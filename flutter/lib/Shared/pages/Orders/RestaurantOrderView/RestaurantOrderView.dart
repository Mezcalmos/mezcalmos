import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/RestaurantApp/router/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/pages/Orders/RestaurantOrderView/components/ROpOrderItems.dart';
import 'package:mezcalmos/Shared/pages/Orders/RestaurantOrderView/controller/RestaurantOrderViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/env.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpOrderView'];

class RestaurantOrderView extends StatefulWidget {
  const RestaurantOrderView({Key? key}) : super(key: key);

  static Future<void> navigate({required int orderId}) {
    return MezRouter.toPath(RestaurantAppRoutes.restaurantOrderRoute
        .replaceAll(":orderId", orderId.toString()));
  }

  static String constructPath(int orderId) {
    return RestaurantAppRoutes.restaurantOrderRoute
        .replaceFirst(":orderId", orderId.toString());
  }

  @override
  State<RestaurantOrderView> createState() => _RestaurantOrderViewState();
}

class _RestaurantOrderViewState extends State<RestaurantOrderView> {
  RestaurantOrderViewController viewController =
      RestaurantOrderViewController();

  @override
  void initState() {
    final String? orderId = MezRouter.urlArguments['orderId'].toString();
    mezDbgPrint("Restaurant Order View 🥥🥥🥥 ORDER ID $orderId");
    if (orderId != null && int.tryParse(orderId) != null) {
      viewController.init(orderId: int.parse(orderId));
    }
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("widget.order.dropoffDriver =======");

    mezDbgPrint(viewController.order.value?.driverInfo);
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: MezRouter.back,
          titleWidget: Obx(() =>
              Text("${viewController.order.value?.customer.name ?? ""}"))),
      floatingActionButton:
          (MezEnv.appType == AppType.MezAdmin) ? _copyBtn() : null,
      bottomNavigationBar: Obx(
        () => viewController.showForwardBtn
            ? MezButton(
                label: "Forward to Servi Amigos",
                borderRadius: 0,
                onClick: () async {},
              )
            : SizedBox.shrink(),
      ),
      body: Obx(() {
        if (viewController.order.value != null) {
          return SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  // here call OrderMapWidget
                  MezCard(
                    label: "Customer",
                    margin: const EdgeInsets.only(bottom: 15),
                    radius: 22,
                    firstAvatarBgImage:
                        CachedNetworkImageProvider(defaultUserImgUrl),
                    content: Text(
                      "Customer Name",
                      style: context.textTheme.bodyLarge,
                    ),
                    action: MezIconButton(
                      icon: Ionicons.logo_whatsapp,
                      iconColor: Colors.white,
                      backgroundColor: Colors.green,
                      onTap: () {
                        viewController.openCustomerWhatsapp();
                      },
                    ),
                  ),
                  MezCard(
                    label: "Driver",
                    margin: const EdgeInsets.only(bottom: 15),
                    radius: 22,
                    secondAvatarIconColor: primaryBlueColor,
                    secondAvatarBgColor: secondaryLightBlueColor,
                    secondAvatarIcon: Icons.delivery_dining_rounded,
                    content: Text(
                      "Driver Name",
                      style: context.textTheme.bodyLarge,
                    ),
                    action: MezIconButton(
                      icon: Ionicons.logo_whatsapp,
                      iconColor: Colors.white,
                      backgroundColor: Colors.green,
                      onTap: () {
                        viewController.openDriverWhatsapp();
                      },
                    ),
                  ),
                  smallSepartor,
                  MezButton(
                    label: "Forward to driver",
                    icon: Ionicons.logo_whatsapp,
                    textColor: Colors.green,
                    backgroundColor: Colors.white,
                    elevation: 0.5,
                    onClick: () async {},
                  )

                  // order status
                  // ROpOrderStatusCard(order: viewController.order.value!),

                  // ROpOrderHandleButton(viewController: viewController),
                  // if (viewController.order.value!.scheduleTime != null)
                  //   _getScheduleTime(),
                  // RestaurantOrderEstTime(order: viewController.order.value!),
                  // // if (viewController.order.value?.selfDelivery ?? false)
                  // //   ROpEstDeliveryTime(order: viewController.order.value!),
                  // ROpDriverCard(order: viewController.order.value!),
                  // if (viewController.order.value!.inDeliveryPhase())
                  //   OrderMapWidget(
                  //       deliveryOrderId:
                  //           viewController.order.value!.deliveryOrderId!,
                  //       updateDriver:
                  //           viewController.order.value!.inDeliveryPhase(),
                  //       polyline: viewController
                  //           .order.value!.routeInformation?.polyline,
                  //       from: viewController.order.value!.restaurant.location,
                  //       to: viewController.order.value!.dropOffLocation),
                  // ROpOrderCustomer(order: viewController.order.value!),
                  // if (MezEnv.appType == AppType.MezAdmin)
                  //   _restaurantCard(context),

                  // _orderItemsList(),
                  // Container(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     '${_i18n()["deliveryDet"]}',
                  //     textAlign: TextAlign.center,
                  //     style: context.txt.bodyLarge,
                  //   ),
                  // ),
                  // OrderScheduledTimeCard(
                  //     time: viewController.order.value!.scheduleTime,
                  //     margin: const EdgeInsets.only(top: 8)),

                  // OrderDeliveryLocation(
                  //   address:
                  //       viewController.order.value!.dropOffLocation.address,
                  //   margin: const EdgeInsets.only(top: 8),
                  // ),
                  // OrderPaymentMethod(
                  //   stripeOrderPaymentInfo:
                  //       viewController.order.value!.stripePaymentInfo,
                  //   paymentType: viewController.order.value!.paymentType,
                  // ),
                  // if (viewController.order.value!.review != null)
                  //   ReviewCard(review: viewController.order.value!.review!),
                  // OrderNoteCard(note: viewController.order.value!.notes),
                  // OrderSummaryCard(
                  //   margin: const EdgeInsets.only(bottom: 25),
                  //   costs: viewController.order.value!.costs,
                  //   stripeOrderPaymentInfo:
                  //       viewController.order.value!.stripePaymentInfo,
                  // ),
                  // // ROpRefundButton(
                  // //   order: viewController.order.value!,
                  // // ),
                  // if (viewController.order.value!.inProcess())
                  //   Padding(
                  //     padding: const EdgeInsets.symmetric(vertical: 16),
                  //     child: TextButton(
                  //         style: TextButton.styleFrom(
                  //             foregroundColor: Colors.red,
                  //             backgroundColor: offRedColor),
                  //         onPressed: () {
                  //           showConfirmationDialog(context,
                  //               onYesClick: () async {
                  //             await viewController.cancelOrder().then(
                  //                 (ChangeRestaurantStatusResponse value) =>
                  //                     MezRouter.back());
                  //           });
                  //         },
                  //         child: Container(
                  //           alignment: Alignment.center,
                  //           padding: const EdgeInsets.all(8),
                  //           child: Text('${_i18n()["cancelOrder"]}'),
                  //         )),
                  //   ),
                ],
              ));
        } else
          return Container(
            alignment: Alignment.center,
            child: MezLogoAnimation(centered: true),
          );
      }),
    );
  }

  Column _restaurantCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${_i18n()['restaurant']}",
          style: context.txt.bodyLarge,
        ),
        SizedBox(
          height: 5,
        ),
        MezCard(
          contentPadding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 20),
          firstAvatarBgImage: CachedNetworkImageProvider(
              viewController.order.value!.restaurant.image),
          content: Text(
            viewController.order.value!.restaurant.name,
            style: context.txt.bodyLarge,
          ),
          action: (viewController.order.value!.restaurant.phoneNumber != null)
              ? MezIconButton(
                  onTap: () async {
                    final String number =
                        viewController.order.value!.restaurant.phoneNumber!;
                    await callWhatsappNumber(number);
                  },
                  icon: Ionicons.logo_whatsapp,
                  iconColor: Colors.green,
                  backgroundColor: Colors.white,
                )
              : null,
        ),
      ],
    );
  }

  FloatingActionButton _copyBtn() {
    return new FloatingActionButton(
      focusColor: Colors.grey.shade100,
      hoverColor: Colors.grey.shade100,
      splashColor: Colors.grey.shade100,
      backgroundColor: Colors.grey.shade100,
      foregroundColor: primaryBlueColor,
      onPressed: () {
        final String? number =
            viewController.order.value?.restaurant.phoneNumber;
        if (number != null) {
          callWhatsappNumber(number,
              message: viewController.order.value?.clipBoardText(userLanguage));
        } else {
          Clipboard.setData(ClipboardData(
                  text:
                      '${viewController.order.value?.clipBoardText(userLanguage)}'))
              .then((value) => MezSnackbar("Done :D", "Copied to clipboard.",
                  position: Alignment.topCenter));
        }
      },
      tooltip: 'Copy',
      child: new Icon(Icons.copy),
    );
  }

  Widget _orderItemsList() {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_i18n()["orderItems"]}',
            style: context.txt.bodyLarge,
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: List.generate(
                viewController.order.value!.items.length,
                (int index) => ROpOrderItems(
                      item: viewController.order.value!.items[index],
                      order: viewController.order.value!,
                    )),
          ),
        ],
      ),
    );
  }

  Widget _getMapWidget() {
    if (viewController.order.value!.inDeliveryPhase())
      return Container(
        height: 350,
        margin: const EdgeInsets.only(bottom: 25),
        child: MGoogleMap(
          mGoogleMapController: viewController.mGoogleMapController,
          padding: EdgeInsets.all(20),
          rerenderDuration: Duration(seconds: 30),
          recenterBtnBottomPadding: 20,
        ),
      );
    else
      return SizedBox();
  }

  Widget _getScheduleTime() {
    return Card(
      margin: const EdgeInsets.only(bottom: 25),
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              child: Icon(
                Icons.schedule_send,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 8,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_i18n()["schTitle"]}',
                    style: context.txt.bodyLarge,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  if (viewController.order.value?.scheduleTime != null)
                    Text(
                      "${DateFormat("dd MMMM, hh:mm a ").format(viewController.order.value!.scheduleTime!.toLocal())}",
                      style: context.txt.bodyMedium,
                    ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
