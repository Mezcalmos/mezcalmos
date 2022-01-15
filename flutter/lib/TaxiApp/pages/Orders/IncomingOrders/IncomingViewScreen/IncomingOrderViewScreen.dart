import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/TaxiApp/components/taxiAppBar.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/IPositionedBottomBar.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/IPositionedFromToBar.dart';
import 'package:mezcalmos/TaxiApp/router.dart';

class IncomingOrderViewScreen extends StatefulWidget {
  @override
  _IncomingOrderViewScreenState createState() =>
      _IncomingOrderViewScreenState();
}

class _IncomingOrderViewScreenState extends State<IncomingOrderViewScreen> {
  LanguageController lang = Get.find<LanguageController>();
  TaxiOrder? order;
  IncomingOrdersController controller = Get.find<IncomingOrdersController>();
  StreamSubscription? _orderListener;
  MGoogleMapController mGoogleMapController = MGoogleMapController();

  bool _clickedButton = false;
  TaxiAuthController taxiAuthController = Get.find<TaxiAuthController>();

  @override
  void initState() {
    String orderId = Get.parameters['orderId']!;
    order = controller.getOrder(orderId);

    // we do not setState here yet !
    if (order == null) {
      mezDbgPrint('ORDER NULL NAVIGATE BACK');
      Get.back();
    } else {
      controller.markOrderAsRead(orderId, order!.customer.id);
      if (order!.inProcess()) {
        // populate the LatLngPoints from the encoded PolyLine String + SetState!
        mGoogleMapController.decodeAndAddPolyline(
            encodedPolylineString: order!.routeInformation.polyline);
        // add the corresponding markers
        mGoogleMapController.addOrUpdateUserMarker(
            markerId: order!.customer.id,
            latLng: order!.from.toLatLng(),
            customImgHttpUrl: order!.customer.image);

        mGoogleMapController.addOrUpdatePurpleDestinationMarker(
            latLng: order!.to.toLatLng());
        // set initial position
        mGoogleMapController.setLocation(order!.from);
        // start Listening for the vailability of the order
        _orderListener =
            controller.getIncomingOrderStream(orderId).listen((order) {
          if (order != null) {
            // keep updating our Order
            setState(() {
              this.order = order;
            });
          } else {
            // if the Order is no more available , Show a pop up while poping back back !
            if (_clickedButton == false) {
              cancelOrderSubscription();
              Get.back();
              oneButtonDialog(
                  body: lang.strings['taxi']['cancelOrder']['rideUnavailble'],
                  imagUrl: aOrderUnavailable);
            }
          }
        });
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    cancelOrderSubscription();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: taxiAppBar(AppBarLeftButtonType.Back,
          function: cancelOrderSubscription),
      body: order != null
          ? Stack(
              alignment: Alignment.topCenter,
              children: [
                MGoogleMap(
                  mGoogleMapController: mGoogleMapController,
                  debugString: "IncomingViewScreen",
                  myLocationButtonEnabled: false,
                ),
                IncomingPositionedBottomBar(
                  order: this.order!,
                ),
                Positioned(
                    bottom: GetStorage().read(getxGmapBottomPaddingKey),
                    child: acceptOrderButton(
                      child: !_clickedButton
                          ? Text(
                              lang.strings['taxi']['taxiView']["acceptOrders"],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          : const SizedBox(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                              height: 20,
                              width: 20,
                            ),
                    )),
                IncomingPositionedFromToTopBar(
                  order: this.order!,
                )
              ],
            )
          : MezLogoAnimation(
              centered: true,
            ),
    );
  }

  void cancelOrderSubscription() {
    _orderListener?.cancel();
    _orderListener = null;
  }

  Widget acceptOrderButton({required Widget child}) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(Get.width / 1.05,
            getSizeRelativeToScreen(20, Get.height, Get.width))),
        backgroundColor:
            MaterialStateProperty.all(Color.fromARGB(255, 79, 168, 35)),
      ),
      onPressed: !_clickedButton
          ? () async {
              setState(() {
                _clickedButton = true;
              });
              mezDbgPrint(
                  '-----------------ORDER PRINT-------------' + order!.orderId);

              ServerResponse serverResponse =
                  await controller.acceptTaxi(order!.orderId);

              if (serverResponse.success) {
                // canceling Subscription Just to Avoid possible Racing Conditions
                cancelOrderSubscription();
                // Go to CurrentOrder View !
                Get.offNamedUntil(
                    kCurrentOrderRoute, ModalRoute.withName(kHomeRoute));
                // Notice the User !
                mezDbgPrint(
                    "s@ad:IncommingOrderViewScreen::acceptOrderButton::response::data:: ${serverResponse.data}");
                mezDbgPrint(
                    "s@ad:IncommingOrderViewScreen::acceptOrderButton::response::status:: ${serverResponse.status.toShortString()}");
              } else {
                // in case Taxi User failed accepting the order.
                setState(() {
                  _clickedButton = false;
                });
                Get.back();
                MezSnackbar("Failed", serverResponse.errorMessage!);
              }
            }
          : () => null,
      child: child,
    );
  }
}
