import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/RestaurantApp/pages/SingleOrderViews/ROpSelfDeliveryView/components/AnimatedOrderInfoCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/SingleOrderViews/ROpSelfDeliveryView/components/ROpControllButtons.dart';
import 'package:mezcalmos/RestaurantApp/pages/SingleOrderViews/ROpSelfDeliveryView/components/ROpOrderFromTo.dart';
import 'package:mezcalmos/RestaurantApp/router/deliveryRoutes.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:url_launcher/url_launcher_string.dart';

//
// dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
//     ["pages"]["ROpSelfDeliveryView"];
//
// TODO handle @m66are handle commented part

class ROpSelfDeliveryView extends StatefulWidget {
  const ROpSelfDeliveryView({Key? key}) : super(key: key);

  static Future<void> navigate({required String orderId}) {
    return MezRouter.toPath(
        DeliveryRouter.selfDeliveryRoute.replaceAll(":orderId", orderId));
  }

  @override
  _ROpSelfDeliveryViewState createState() => _ROpSelfDeliveryViewState();
}

class _ROpSelfDeliveryViewState extends State<ROpSelfDeliveryView> {
  MGoogleMapController mapController = MGoogleMapController();
  Rxn<RestaurantOrder> order = Rxn<RestaurantOrder>();

  // ROpOrderController controller = Get.find<ROpOrderController>();
  StreamSubscription<Order?>? _orderListener;
  RestaurantOrderStatus? orderStatusSnapshot;

  // DeliveryAuthController deliveryAuthAuthController =
  //     Get.find<DeliveryAuthController>();
  @override
  void initState() {
    // final String orderId = Get.parameters['orderId']!;

    // controller.clearOrderNotifications(orderId);
    // //  order.value = controller.getOrder(orderId) as RestaurantOrder;

    // if (order.value != null && order.value!.inSelfDelivery()) {
    //   controller.startLocationListener(order.value!);
    // }

    // if (order.value!.routeInformation != null) {
    //   mapController.decodeAndAddPolyline(
    //       encodedPolylineString: order.value!.routeInformation!.polyline);
    // }

    // // _orderListener =
    // //     controller.getOrderStream(orderId).listen((Order? newOrderEvent) async {
    // //   if (newOrderEvent != null) {
    // //     order.value = newOrderEvent as RestaurantOrder;
    // //     await controller.startLocationListener(order.value!);
    // //     if (!order.value!.inProcess()) {
    // //       await controller.stopLocationListener();
    // //       await _orderListener?.cancel();
    // //       await Future.microtask(() {
    // //         SchedulerBinding.instance.addPostFrameCallback((_) {
    // //           Get.offAndToNamed(getROpOrderRoute(orderId));
    // //         });
    // //       });
    // //     }
    // //     handleRestaurantOrder(newOrderEvent);
    // //     order.refresh();
    // //     mezDbgPrint(
    // //         "Inside self delivery listnere ======>>>>> ${order.value!.status}");
    // //   }
    // // });

    // // init the map
    // Future<void>.microtask(
    //   () async {
    //     await controller.initCurrentLocation();
    //     controller.currentLocation != null
    //         ? mapController.setLocation(
    //             Location.fromLocationData(
    //               controller.currentLocation!,
    //             ),
    //           )
    //         : null;
    //   },
    // );
    // mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded; // LEZEM
    // mapController.animateMarkersPolyLinesBounds.value = true;
    // mapController.periodicRerendering.value = true;

    // // doing this once to avoid doing it constaintly in [handleRestaurantOrder::switch::default]
    // // Future.wait(<Future<void>>[
    // // DESTINATION MARKER
    // mapController.addOrUpdatePurpleDestinationMarker(
    //   latLng: order.value?.to.toLatLng(),
    // );
    // // USER MARKER
    // mapController.addOrUpdateUserMarker(
    //   latLng: controller.currentLocation?.getLatLng(),
    // );
    // // Restaurant Marker
    // mapController.addOrUpdateUserMarker(
    //   latLng: order.value?.restaurant.location.toLatLng(),
    //   markerId: order.value?.restaurantId.toString(),
    //   customImgHttpUrl: order.value?.restaurant.image,
    // );
    // if (order.value != null)
    //   handleRestaurantOrder(order.value as RestaurantOrder);

    // waitForOrderIfNotLoaded().then((void value) {
    //   if (order.value == null) {
    //     // ignore: inference_failure_on_function_invocation
    //     Future<Null>.delayed(Duration.zero, () {
    //       //    MezRouter.back<Null>();
    //       MezSnackbar("Error", "Order does not exist");
    //     });
    //   } else {
    //     initilizeMap(mapController, order, order.value!.restaurant);
    //   }
    // });
    // super.initState();
  }

  Future<void> waitForOrderIfNotLoaded() {
    if (order.value != null) {
      return Future<void>.value(null);
    } else {
      final Completer<void> completer = Completer<void>();
      Timer(Duration(seconds: 5), () {
        completer.complete();
      });
      return completer.future;
    }
  }

  @override
  void dispose() {
    _orderListener?.cancel();
    _orderListener = null;
    super.dispose();
  }

  double _recenterBtnBottomPadding = 315;
  EdgeInsets _mapPadding = EdgeInsets.only(top: 10, bottom: 220);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
        showNotifications: true,
        title: 'Self delivery',
      ),
      bottomNavigationBar: Obx(
        () => ROpControllButtons(
          order: order.value!,
        ),
      ),
      body: Obx(
        () => order.value != null
            ? Stack(
                children: [
                  MGoogleMap(
                    recenterBtnBottomPadding: _recenterBtnBottomPadding,
                    mGoogleMapController: mapController,
                    padding: _mapPadding,
                  ),
                  Positioned(
                    bottom: _recenterBtnBottomPadding,
                    right: 12,
                    child: InkWell(
                      onTap: () async {
                        final LatLng _destination = LatLng(
                            order.value!.to.latitude,
                            order.value!.to.longitude);

                        final String url =
                            "https://www.google.com/maps/dir/?api=1&destination=${_destination.latitude},${_destination.longitude}";

                        try {
                          await launchUrlString(url);
                        } catch (e) {
                          await launchUrlString(url);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.5),
                                offset: Offset(-1, 0),
                                spreadRadius: 1,
                                blurRadius: 10)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.navigation_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    left: 5,
                    right: 4,
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: ROpOrderFromTo(
                          order: order.value!,
                          onCardStateChange: (OrderInfoCardState state) {
                            setState(() {
                              if (state == OrderInfoCardState.Maximized) {
                                _recenterBtnBottomPadding = 315;
                                _mapPadding =
                                    EdgeInsets.only(top: 10, bottom: 220);
                              } else {
                                _recenterBtnBottomPadding = 180;
                                _mapPadding =
                                    EdgeInsets.only(top: 10, bottom: 120);
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  )
                ],
              )
            : MezLogoAnimation(
                centered: true,
              ),
      ),
    );
  }

  /// this handles Restaurant Order.
  void handleRestaurantOrder(RestaurantOrder order) {
    switch (order.status) {
      case RestaurantOrderStatus.Ready:
        // only update once upon ReadyForPickUp
        if (orderStatusSnapshot != order.status) {
          // ignoring customer's marker (destination)
          mapController.addOrUpdatePurpleDestinationMarker(
              latLng: order.to.toLatLng(),
              fitWithinBounds: true,
              markerId: order.customer.hasuraId.toString());
        }
        // update position of our delivery Guy
        // mapController.addOrUpdateUserMarker(
        //     latLng: controller.currentLocation?.getLatLng(),
        //     fitWithinBounds: true,
        //     markerId: order.restaurantId);
        // mapController.animateAndUpdateBounds();
        // orderStatusSnapshot = order.status;
        break;

      case RestaurantOrderStatus.OnTheWay:
        // only update once.
        if (orderStatusSnapshot != order.status) {
          // ignoring Restaurant's marker
          // mapController.addOrUpdateUserMarker(
          //   latLng: order.selfDeliveryDetails?.location,
          //   markerId: order.restaurantId,
          //   customImgHttpUrl: order.restaurant.image,
          //   fitWithinBounds: false,
          // );

          mapController.addOrUpdatePurpleDestinationMarker(
              latLng: order.to.toLatLng(),
              fitWithinBounds: true,
              markerId: order.customer.hasuraId.toString());
        }
        // updating our delivery guy location
        mezDbgPrint(
            "NEw looooc =======>>> ${order.selfDeliveryDetails?.location}");
        mapController.addOrUpdateUserMarker(
          latLng: order.selfDeliveryDetails?.location,
          fitWithinBounds: true,
        );
        mapController.animateAndUpdateBounds();
        orderStatusSnapshot = order.status;
        break;
      default:
        orderStatusSnapshot = order.status;
    }
  }
}
