import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/AppBar.dart';
import 'package:mezcalmos/CustomerApp/components/ServicesCard.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/customerDeepLinkHandler.dart';
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
import 'package:mezcalmos/Shared/DeepLinkHandler.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/old/customerApp/taxi/TaxiController.dart';

class CustomerWrapper extends StatefulWidget {
  @override
  _CustomerWrapperState createState() => _CustomerWrapperState();
}

class _CustomerWrapperState extends State<CustomerWrapper>
    with WidgetsBindingObserver {
  dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
      ['pages']['CustomerWrapper'];

  AuthController auth = Get.find<AuthController>();
  CustomerOrderController? _orderController;

  AppLifeCycleController appLifeCycleController =
      Get.find<AppLifeCycleController>();

  DateTime? appClosedTime;

  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;

  StreamSubscription<bool>? _locationStreamSub;

  RxInt numberOfCurrentOrders = RxInt(0);

  StreamSubscription<dynamic>? _orderCountListener;

  StreamSubscription<dynamic>? _authStateChnagesListener;

  @override
  void initState() {
    super.initState();
    Get.put(TaxiController(), permanent: true);

    Get.put(CustomerOrderController(), permanent: true);
    _orderController = Get.find<CustomerOrderController>();
    WidgetsBinding.instance.addObserver(this);
    if (Get.find<AuthController>().fireAuthUser != null) {
      _doIfFireAuthUserIsNotNull();
    }
    startAuthListener();
    DeepLinkHandler.startDynamicLinkCheckRoutine(
        CustomerDeepLinkHandler.handleDeepLink);
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
        !isCurrentRoute(kLocationPermissionPage)) {
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
                Theme.of(context).textTheme.displayMedium!,
              ),
              mezDescription(txt.titleMedium!),
              const SizedBox(height: 10),
              mezServiceTitle(txt.displayMedium!),
              mezListOfServices(),
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

    Get.find<ForegroundNotificationsController>()
        .startListeningForNotificationsFromFirebase(
            customerNotificationsNode(userId!), customerNotificationHandler);
    if (isCurrentRoute(kHomeRoute)) {
      await Future.microtask(() {
        _navigateToOrdersIfNecessary();
      });
    }
    appLifeCycleController.attachCallback(
        AppLifecycleState.resumed, appReturnFromBackground);
    appLifeCycleController.attachCallback(AppLifecycleState.paused, () {
      appClosedTime = DateTime.now();
    });
  }

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
            subtitle: "${_i18n()["comingSoon"]}",
          ),
        ),
      ],
    );
  }

  Future<void> getServiceRoute(
      {required OrderType orderType,
      required String serviceRoute,
      required void Function(int) singleOrderRoute}) async {
    if (Get.find<AuthController>().fireAuthUser != null &&
        _orderController != null) {
      if (_orderController!.firstOrderIdBasedOnType(orderType) != null) {
        singleOrderRoute(_orderController!.firstOrderIdBasedOnType(orderType)!);
      } else {
        await MezRouter.toNamed<void>(serviceRoute);
      }
    } else {
      await MezRouter.toNamed<void>(serviceRoute);
    }
  }

  Future<void> _navigateToOrdersIfNecessary() async {
    if (_orderController != null) {
      await _orderController!.fetchCurrentOrders();
      if (_orderController!.hasOneOrder) {
        if (_orderController!.hasOneOrderType == OrderType.Restaurant) {
          popEverythingAndNavigateTo(
              getRestaurantOrderRoute(_orderController!.hasOneOrderId!));
        } else if (_orderController!.hasOneOrderType == OrderType.Taxi) {
          popEverythingAndNavigateTo(
              getTaxiOrderRoute(_orderController!.hasOneOrderId!));
        } else if (_orderController!.hasOneOrderType == OrderType.Laundry) {
          popEverythingAndNavigateTo(
              getLaundryOrderRoute(_orderController!.hasOneOrderId!));
        }
      } else if (_orderController!.hasManyOrders) {
        popEverythingAndNavigateTo(kOrdersRoute);
      }
    }
  }
}
