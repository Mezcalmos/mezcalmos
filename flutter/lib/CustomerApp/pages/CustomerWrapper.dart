import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/AppBar.dart';
import 'package:mezcalmos/CustomerApp/components/ServicesCard.dart';
import 'package:mezcalmos/CustomerApp/controllers/laundry/LaundryController.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/customerCartController.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/deepLinkHandler.dart';
import 'package:mezcalmos/CustomerApp/notificationHandler.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';
import 'package:mezcalmos/Shared/helpers/NotificationsHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/routes/sharedRouter.dart' as r;
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class CustomerWrapper extends StatefulWidget {
  @override
  _CustomerWrapperState createState() => _CustomerWrapperState();
}

class _CustomerWrapperState extends State<CustomerWrapper>
    with WidgetsBindingObserver {
  dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
      ['pages']['CustomerWrapper'];

  /// AuthController
  AuthController auth = Get.find<AuthController>();

  AppLifeCycleController appLifeCycleController =
      Get.find<AppLifeCycleController>();

  CustomerOrderController? _orderController;

  /// appClosedTime
  DateTime? appClosedTime;

  /// DeepLinkHandler
  final DeepLinkHandler _deepLinkHandler = DeepLinkHandler();

  /// _notificationsStreamListener
  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;

  /// _locationStreamSub
  StreamSubscription<bool>? _locationStreamSub;

  /// numberOfCurrentOrders
  RxInt numberOfCurrentOrders = RxInt(0);

  /// _orderCountListener
  StreamSubscription<dynamic>? _orderCountListener;

  /// _authStateChnagesListener
  StreamSubscription<dynamic>? _authStateChnagesListener;

  @override
  void initState() {
    super.initState();
    Get.put(TaxiController(), permanent: true);
    Get.put(CustomerCartController(), permanent: true);
    Get.put(CustomerOrderController(), permanent: true);

    Get.put(LaundryController(), permanent: true);
    _orderController = Get.find<CustomerOrderController>();
    WidgetsBinding.instance.addObserver(this);

    if (Get.find<AuthController>().fireAuthUser != null) {
      _doIfFireAuthUserIsNotNull();
    }
    startAuthListener();
    //

    /// Check if app was opened through a DeepLink
    Future.wait([_deepLinkHandler.startDynamicLinkCheckRoutine()]);
  }

  @override
  void dispose() {
    _orderCountListener?.cancel();
    _orderCountListener = null;
    _authStateChnagesListener?.cancel();
    _authStateChnagesListener = null;
    super.dispose();
  }

  void appReturnFromBackground() {
    final DateTime? lastBgNotAppOpen =
        Get.find<BackgroundNotificationsController>()
            .lastTimeBackgroundNotificationOpenedApp;
    if (lastBgNotAppOpen != null &&
        DateTime.now().difference(lastBgNotAppOpen) >
            Duration(seconds: 1)) if (appClosedTime != null &&
        DateTime.now().difference(appClosedTime!) > Duration(seconds: 10) &&
        !r.isCurrentRoute(kLocationPermissionPage)) {
      _navigateToOrdersIfNecessary();
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        appBar: CustomerAppBar(
          leftBtnType: AppBarLeftButtonType.Menu,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const SizedBox(height: 10),

              mezWelcomeContainer(
                Theme.of(context).textTheme.headline2!,
              ),
              //============================== description=============================
              mezDescription(txt.subtitle1!),

              //============================Service title===================================
              const SizedBox(height: 10),
              mezServiceTitle(txt.headline2!),

              //========================= list of services ===========================
              mezListOfServices(),
              // Spacer(),
              //  HomeFooterButtons(),
            ],
          ),
        ),
      ),
    );
  }

  void startAuthListener() {
    _authStateChnagesListener?.cancel();
    _authStateChnagesListener = null;
    _authStateChnagesListener = auth.authStateStream.listen((User? fireUser) {
      if (fireUser != null) {
        _doIfFireAuthUserIsNotNull();
      } else {
        _orderCountListener?.cancel();
        _orderCountListener = null;
        _notificationsStreamListener?.cancel();
        _notificationsStreamListener = null;
        appLifeCycleController.cleanAllCallbacks();
      }
    });
  }

  Future<void> _doIfFireAuthUserIsNotNull() async {
    final String? userId = Get.find<AuthController>().fireAuthUser!.uid;
    _notificationsStreamListener = initializeShowNotificationsListener();
    // listening for notification Permissions!
    // listenForLocationPermissions();
    Get.find<ForegroundNotificationsController>()
        .startListeningForNotificationsFromFirebase(
            customerNotificationsNode(userId!), customerNotificationHandler);
    if (r.isCurrentRoute(kHomeRoute)) {
      // ignore: unawaited_futures
      Future.microtask(() {
        _navigateToOrdersIfNecessary();
      });
    }
    appLifeCycleController.attachCallback(
        AppLifecycleState.resumed, appReturnFromBackground);
    appLifeCycleController.attachCallback(AppLifecycleState.paused, () {
      appClosedTime = DateTime.now();
    });
  }

  // void checkTaxiCurrentOrdersAndNavigate() {
  //   _orderController = Get.find<OrderController>();
  //   // return;
  //   final num noOfCurrentTaxiOrders = _orderController
  //           ?.currentOrders()
  //           .where((Order currentOrder) =>
  //               currentOrder.orderType == OrderType.Taxi)
  //           .length ??
  //       0;
  //   if (noOfCurrentTaxiOrders == 0) {
  //     MezRouter.toNamed<void>(kTaxiRequestRoute);
  //   } else {
  //     final int orderId = _orderController!.currentOrders
  //         .firstWhere(
  //             (Order currentOrder) => currentOrder.orderType == OrderType.Taxi)
  //         .orderId;
  //     MezRouter.toNamed<void>(getTaxiOrderRoute(orderId));
  //   }
  // }

  Widget mezWelcomeContainer(TextStyle textStyle) {
    return Container(
      margin: const EdgeInsets.all(5),
      alignment: Alignment.centerLeft,
      child: Obx(
        () => Text(
          "${_i18n()['welcomeText']}",
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
        () => Text("${_i18n()['appDescription']}", style: textStyle),
      ),
    );
  }

  Widget mezServiceTitle(TextStyle textStyle) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(5),
      child: Obx(
        () => Text(
          "${_i18n()['services']}",
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

        //==================Food====================
        Obx(
          () => ServicesCard(
            title: "${_i18n()['food']["title"]}",
            url: "assets/images/customer/restaurants/restaurantService.png",
            subtitle: "${_i18n()['food']["subtitle"]}",
            onTap: () {
              getServiceRoute(
                  orderType: OrderType.Restaurant,
                  serviceRoute: kRestaurantsRoute,
                  singleOrderRoute: (int orderId) {
                    MezRouter.toNamed<void>(getRestaurantOrderRoute(orderId));
                  });
            },
          ),
        ),

        //==================Laundry=================
        Obx(
          () => ServicesCard(
            title: "${_i18n()['laundry']["title"]}",
            subtitle: "${_i18n()['laundry']["subtitle"]}",
            url: "assets/images/customer/laundryService.png",
            onTap: () {
              getServiceRoute(
                  orderType: OrderType.Laundry,
                  serviceRoute: kLaundriesListRoute,
                  singleOrderRoute: (int v) {
                    MezRouter.toNamed<void>(getLaundryOrderRoute(v));
                  });
            },
          ),
        ),
        Obx(
          () => ServicesCard(
            title: "${_i18n()['taxi']["title"]}",
            url: "assets/images/customer/taxi/taxiService.png",
            // subtitle: "${_i18n()['taxi']["subtitle"]}",
            subtitle: "${_i18n()["comingSoon"]}",
            // onTap: () {
            //   getServiceRoute(
            //       orderType: OrderType.Taxi,
            //       serviceRoute: kTaxiRequestRoute,
            //       singleOrderRoute: (String orderId) {
            //         MezRouter.toNamed<void>(getTaxiOrderRoute(orderId));
            //       });
            // },
          ),
        ),
      ],
    );
  }

  Future<void> getServiceRoute(
      {required OrderType orderType,
      required String serviceRoute,
      required void Function(int) singleOrderRoute}) async {
    if (Get.find<AuthController>().fireAuthUser != null) {
      await _orderController?.fetchCustomerOrders();
      final List<Order> orders = _orderController!.currentOrders
          .where((Order p0) => p0.orderType == orderType)
          .toList();
      if (orders.length == 1) {
        //   MezRouter.toNamed(getLaundyOrderRoute(orders[0].orderId));
        singleOrderRoute(orders[0].orderId);
      } else if (orders.length > 1) {
        // ignore: unawaited_futures
        MezRouter.toNamed<void>(kOrdersRoute);
      } else {
        // ignore: unawaited_futures
        MezRouter.toNamed<void>(serviceRoute);
      }
    } else {
      // ignore: unawaited_futures
      MezRouter.toNamed<void>(serviceRoute);
    }
  }

  // when app resumes check if there are current orders and if yes navigate to orders page
  Future<void> _navigateToOrdersIfNecessary() async {
    await _orderController?.fetchCustomerOrders();
    if (_orderController?.currentOrders != null &&
        _orderController?.currentOrders.length == 1) {
      // Restaurant
      if (_orderController?.currentOrders[0].orderType ==
          OrderType.Restaurant) {
        popEverythingAndNavigateTo(getRestaurantOrderRoute(
            _orderController!.currentOrders[0].orderId));
        // Taxi
      } else if (_orderController?.currentOrders[0].orderType ==
          OrderType.Taxi) {
        popEverythingAndNavigateTo(
            getTaxiOrderRoute(_orderController!.currentOrders[0].orderId));
      } else if (_orderController?.currentOrders[0].orderType ==
          OrderType.Laundry) {
        popEverythingAndNavigateTo(
            getLaundryOrderRoute(_orderController!.currentOrders[0].orderId));
      }
    } else if (_orderController?.currentOrders != null &&
        _orderController!.currentOrders.length > 1) {
      popEverythingAndNavigateTo(kOrdersRoute);
    }
  }

  // void listenForLocationPermissions() {
  //   _locationStreamSub?.cancel();
  //   _locationStreamSub = Get.find<LocationController>().locationPermissionStream
  //       // .distinct()
  //       .listen((bool locationPermission) {
  //     if (locationPermission == false &&
  //         Get.currentRoute != kLocationPermissionPage) {
  //       MezRouter.toNamed<void>(kLocationPermissionPage);
  //     }
  //   });
  // }
}
