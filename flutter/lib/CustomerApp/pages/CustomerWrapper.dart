import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/components/CustomerHomeFooterButtons.dart';
import 'package:mezcalmos/CustomerApp/components/ServicesCard.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/notificationHandler.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';
import 'package:mezcalmos/Shared/helpers/NotificationsHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as MezNotification;
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
//import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';

class CustomerWrapper extends StatefulWidget {
  @override
  _CustomerWrapperState createState() => _CustomerWrapperState();
}

class _CustomerWrapperState extends State<CustomerWrapper>
    with WidgetsBindingObserver {
  LanguageController i18n = Get.find<LanguageController>();
  AuthController auth = Get.find<AuthController>();
  OrderController? _orderController;
  DateTime? appClosedTime;

  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;
  StreamSubscription<bool>? _locationStreamSub;
  RxInt numberOfCurrentOrders = RxInt(0);
  StreamSubscription? _orderCountListener;
  StreamSubscription? _authStateChnagesListener;
  @override
  void initState() {
    Get.put(TaxiController(), permanent: true);
    Get.put(RestaurantController(), permanent: true);
    Get.put(RestaurantsInfoController(), permanent: true);
    WidgetsBinding.instance!.addObserver(this);
    if (Get.find<AuthController>().fireAuthUser != null) {
      _doIfFireAuthUserIsNotNull();
    }
    startAuthListener();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (appClosedTime != null &&
          _orderController != null &&
          DateTime.now().difference(appClosedTime!) > Duration(seconds: 10) &&
          Get.currentRoute != kLocationPermissionPage) {
        navigateToOrdersIfNecessary(_orderController!.currentOrders);
      }
    } else if (state == AppLifecycleState.paused) {
      appClosedTime = DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;

    responsiveSize(context);
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            appBar: CustomerAppBar(
              autoBack: false,
            ),
            body: LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minWidth: constraints.maxWidth,
                          minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child:
                              Column(mainAxisSize: MainAxisSize.max, children: [
                            SizedBox(
                              height: 10,
                            ),

                            mezWelcomeContainer(
                                Theme.of(context).textTheme.headline2!),
                            //============================== description=============================
                            mezDescription(txt.subtitle1!),

                            //============================Service title===================================
                            SizedBox(
                              height: 10,
                            ),
                            mezServiceTitle(txt.headline2!),

                            //========================= list of services ===========================
                            Expanded(child: mezListOfServices()),
                            // Spacer(),
                            HomeFooterButtons(),
                          ]),
                        ),
                      )));
            })));
  }

  void startAuthListener() {
    _authStateChnagesListener?.cancel();
    _authStateChnagesListener = null;
    _authStateChnagesListener = auth.authStateStream.listen((fireUser) {
      if (fireUser != null) {
        _doIfFireAuthUserIsNotNull();
      } else {
        _orderCountListener?.cancel();
        _orderCountListener = null;
        _notificationsStreamListener?.cancel();
        _notificationsStreamListener = null;
      }
    });
  }

  void _doIfFireAuthUserIsNotNull() {
    _orderController = Get.find<OrderController>();
    _orderCountListener = _orderController!.currentOrders.stream.listen((_) {
      numberOfCurrentOrders.value = _orderController!.currentOrders.length;
    });
    String? userId = Get.find<AuthController>().fireAuthUser!.uid;
    _notificationsStreamListener = initializeShowNotificationsListener();
    // listening for notification Permissions!
    listenForLocationPermissions();
    Get.find<ForegroundNotificationsController>()
        .startListeningForNotificationsFromFirebase(
            customerNotificationsNode(userId), customerNotificationHandler);
    if (Get.currentRoute == kHomeRoute) {
      Future.microtask(() {
        navigateToOrdersIfNecessary(_orderController!.currentOrders);
      });
    }
  }

  void checkTaxiCurrentOrdersAndNavigate() {
    _orderController = Get.find<OrderController>();
    // return;
    num noOfCurrentTaxiOrders = _orderController
            ?.currentOrders()
            .where((currentOrder) => currentOrder.orderType == OrderType.Taxi)
            .length ??
        0;
    if (noOfCurrentTaxiOrders == 0) {
      Get.toNamed(kTaxiRequestRoute);
    } else {
      String orderId = _orderController!.currentOrders
          .firstWhere(
              (currentOrder) => currentOrder.orderType == OrderType.Taxi)
          .orderId;
      Get.toNamed(getTaxiOrderRoute(orderId));
    }
  }

  Widget mezWelcomeContainer(TextStyle textStyle) {
    return Container(
      margin: const EdgeInsets.all(5),
      alignment: Alignment.centerLeft,
      child: Obx(
        () => Text(
          "${i18n.strings['pages']['customerApp']['customerWrapper']['welcomeText']}",
          style: textStyle,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget mezDescription(TextStyle textStyle) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Obx(
        () => Text(
            "${i18n.strings['pages']['customerApp']['customerWrapper']['appDescription']}",
            style: textStyle),
      ),
    );
  }

  Widget mezServiceTitle(TextStyle textStyle) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(5),
      child: Obx(
        () => Text(
          "${i18n.strings['pages']['customerApp']['customerWrapper']['services']}",
          style: textStyle,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget mezListOfServices() {
    return Column(
      children: [
        //====================Taxi===================
        Obx(
          () => ServicesCard(
            title:
                "${i18n.strings['pages']['customerApp']['customerWrapper']['taxi']["title"]}",
            url: "assets/images/customer/taxi/taxiService.png",
            subtitle:
                "${i18n.strings['pages']['customerApp']['customerWrapper']['taxi']["subtitle"]}",
            ontap: () {
              if (Get.find<AuthController>().fireAuthUser == null) {
                Get.toNamed(kTaxiRequestRoute);
              } else {
                checkTaxiCurrentOrdersAndNavigate();
              }
            },
          ),
        ),

        //==================Food====================
        Obx(
          () => ServicesCard(
            title:
                "${i18n.strings['pages']['customerApp']['customerWrapper']['food']["title"]}",
            url: "assets/images/customer/restaurants/restaurantService.png",
            subtitle:
                "${i18n.strings['pages']['customerApp']['customerWrapper']['food']["subtitle"]}",
            ontap: () {
              if (auth.fireAuthUser != null) {
                List<Order> restaurantOrders = Get.find<OrderController>()
                    .currentOrders
                    .where((p0) => p0.orderType == OrderType.Restaurant)
                    .toList();

                if (restaurantOrders.length == 1) {
                  Get.toNamed(
                      getRestaurantOrderRoute(restaurantOrders[0].orderId));
                } else if (restaurantOrders.length > 1) {
                  Get.toNamed(kOrdersRoute);
                } else {
                  Get.toNamed(kRestaurantsRoute);
                }
              } else {
                Get.toNamed(kRestaurantsRoute);
              }
            },
          ),
        ),

        //==================Laundry=================
        Obx(
          () => ServicesCard(
            title:
                "${i18n.strings['pages']['customerApp']['customerWrapper']['laundry']["title"]}",
            url: "assets/images/customer/laundryService.png",
          ),
        ),
      ],
    );
  }

  // when app resumes check if there are current orders and if yes navigate to orders page
  void navigateToOrdersIfNecessary(List<Order> currentOrders) {
    if (currentOrders.length == 1) {
      // Restaurant
      if (currentOrders[0].orderType == OrderType.Restaurant) {
        popEverythingAndNavigateTo(
            getRestaurantOrderRoute(currentOrders[0].orderId));
        // Taxi
      } else if (currentOrders[0].orderType == OrderType.Taxi) {
        popEverythingAndNavigateTo(getTaxiOrderRoute(currentOrders[0].orderId));
      }
    } else if (currentOrders.length > 1) {
      popEverythingAndNavigateTo(kOrdersRoute);
    }
  }

  void listenForLocationPermissions() {
    _locationStreamSub?.cancel();
    _locationStreamSub = Get.find<LocationController>().locationPermissionStream
        // .distinct()
        .listen((locationPermission) {
      if (locationPermission == false &&
          Get.currentRoute != kLocationPermissionPage) {
        Get.toNamed(kLocationPermissionPage);
      }
    });
  }
}
