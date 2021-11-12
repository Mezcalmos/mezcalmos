import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/CustomerApp/components/actionIconsComponents.dart';
import 'package:mezcalmos/CustomerApp/components/imagesComponents.dart';
import 'package:mezcalmos/CustomerApp/constants/databaseNodes.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/notificationHandler.dart';
import 'package:mezcalmos/Shared/controllers/fbNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/NotificationsDisplayer.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as MezNotification;

class CustomerWrapper extends StatefulWidget {
  @override
  _CustomerWrapperState createState() => _CustomerWrapperState();
}

class _CustomerWrapperState extends State<CustomerWrapper>
    with WidgetsBindingObserver {
  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;
  StreamSubscription<bool>? _locationStreamSub;

  LanguageController lang = Get.find<LanguageController>();
  SideMenuDraweController _sideMenuDrawerController =
      Get.find<SideMenuDraweController>();
  OrderController _orderController = Get.find<OrderController>();
  LanguageController _lang = Get.find<LanguageController>();
  RxInt numberOfCurrentOrders = RxInt(0);
  DateTime? appClosedTime;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    _orderController.currentOrdersStream.listen((currentOrders) {
      numberOfCurrentOrders.value = currentOrders.length;
    });
    String userId = Get.find<AuthController>().fireAuthUser!.uid;
    _notificationsStreamListener = initializeShowNotificationsListener();
    // listening for notification Permissions!
    listenForLocationPermissions();
    Get.find<FBNotificationsController>()
        .startListeningForNotificationsFromFirebase(
            notificationsNode(userId), customerNotificationHandler);
    super.initState();
  }

  void listenForLocationPermissions() {
    _locationStreamSub?.cancel();
    _locationStreamSub = Get.find<SettingsController>().locationPermissionStream
        // .distinct()
        .listen((locationPermission) {
      if (locationPermission == false &&
          Get.currentRoute != kLocationPermissionPage) {
        Get.toNamed(kLocationPermissionPage);
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (appClosedTime != null &&
          DateTime.now().difference(appClosedTime!) > Duration(seconds: 10) &&
          Get.currentRoute != kLocationPermissionPage) {
        navigateToOrdersIfNecessary(_orderController.currentOrders);
      }
    } else if (state == AppLifecycleState.paused) {
      appClosedTime = DateTime.now();
    }
  }

  // when app resumes check if there are current orders and if yes navigate to orders page
  void navigateToOrdersIfNecessary(List<Order> currentOrders) {
    mezDbgPrint("navigateToOrdersIfNecessary");
    if (currentOrders.length == 1) {
      if (currentOrders[0].orderType == OrderType.Restaurant)
        popEverythingAndNavigateTo(
            getCurrentRestaurantOrderRoute(currentOrders[0].orderId));
      else
        mezDbgPrint("Navigate to other order type");
    } else if (currentOrders.length > 1) {
      popEverythingAndNavigateTo(kOrdersRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    print("CustomWrapper Build callabck");
    // Navigate to current orders if any after build
    Future.microtask(() {
      _orderController.currentOrdersStream.first.then((currentOrders) {
        print("CustomWrapper Build callabck first");
        navigateToOrdersIfNecessary(currentOrders);
      });
    });
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: Colors.white,
          key: _sideMenuDrawerController.getNewKey(),
          drawer: MezSideMenu(),
          appBar: MezcalmosSharedWidgets.mezcalmosAppBar(
              "menu", () => _sideMenuDrawerController.openMenu(), actionIcons: [
            ActionIconsComponents.notificationIcon(),
            ActionIconsComponents.orderIcon()
          ]),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                child: Obx(
                  () => Text("${lang.strings['customer']['home']['services']}",
                      style: TextStyle(
                          color: Color(0xff1d1d1d),
                          // fontWeight: FontWeight.w400,
                          fontFamily: "psr",
                          fontSize: 45.sp),
                      textAlign: TextAlign.left),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Expanded(
                child: Container(
                  width: Get.width,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: const Color(0xfffceb4d).withOpacity(0.25),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TaxiImage(
                        sw: 47,
                        sh: 47,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Obx(
                          () => Text(
                              "${lang.strings['customer']['home']['taxi']}",
                              style: const TextStyle(
                                  color: const Color(0xff000f1c),
                                  fontFamily: "psr",
                                  fontSize: 16.0),
                              textAlign: TextAlign.left),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                    width: Get.width,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: const Color(0xff5582ff).withOpacity(0.25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FoodImage(
                          sw: 47,
                          sh: 47,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Obx(
                            () => Text(
                                "${lang.strings['customer']['home']['food']}",
                                style: const TextStyle(
                                    color: const Color(0xff000f1c),
                                    fontFamily: "psr",
                                    fontSize: 16.0),
                                textAlign: TextAlign.left),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () => Get.toNamed(kRestaurantsRoute),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),

              // OutlinedButton(
              //     onPressed: () ,
              //     child: Text("Restaurants"))
            ],
          )),
    );
  }

  @override
  void dispose() {
    _notificationsStreamListener?.cancel();
    _notificationsStreamListener = null;
    _locationStreamSub?.cancel();
    _locationStreamSub = null;
    super.dispose();
  }
}
