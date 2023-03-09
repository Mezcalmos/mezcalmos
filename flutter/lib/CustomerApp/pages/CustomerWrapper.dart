import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/AppBar.dart';
import 'package:mezcalmos/CustomerApp/components/ServicesCard.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/deepLinkHandler.dart';
import 'package:mezcalmos/CustomerApp/notificationHandler.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrderListView/CustomerOrdersListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundriesList/CustLaundriesListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/CustLaundryOrderView.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/CustRestaurantOrderView.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantsListView/CustRestaurantListView.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';
import 'package:mezcalmos/Shared/helpers/NotificationsHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
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

  AuthController authController = Get.find<AuthController>();
  CustomerOrderController? _orderController;

  AppLifeCycleController appLifeCycleController =
      Get.find<AppLifeCycleController>();

  DateTime? appClosedTime;

  final DeepLinkHandler _deepLinkHandler = DeepLinkHandler();

  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;

  StreamSubscription<bool>? _locationStreamSub;

  RxInt numberOfCurrentOrders = RxInt(0);

  StreamSubscription<dynamic>? _orderCountListener;

  StreamSubscription<dynamic>? _authStateChnagesListener;

  @override
  void initState() {
    super.initState();
    Get.put(CustomerOrderController(), permanent: true);
    _orderController = Get.find<CustomerOrderController>();
    WidgetsBinding.instance.addObserver(this);
    if (authController.fireAuthUser != null) {
      _doIfFireAuthUserIsNotNull();
    }
    startAuthListener();

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
    final DateTime? lastTimeAppReturnedFromBackground =
        Get.find<AppLifeCycleController>().lastTimeAppReturnedFromBackground;
    if (lastTimeAppReturnedFromBackground != null &&
        DateTime.now().difference(lastTimeAppReturnedFromBackground) >
            Duration(seconds: 1)) if (appClosedTime != null &&
        DateTime.now().difference(appClosedTime!) > Duration(seconds: 10) &&
        !MezRouter.isCurrentRoute(SharedRoutes.kLocationPermissionPage)) {
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
    _authStateChnagesListener =
        authController.authStateStream.listen((User? fireUser) {
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
    if (MezRouter.isCurrentRoute(SharedRoutes.kHomeRoute)) {
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
            url: "assets/images/customer/foodService.png",
            subtitle: "${_i18n()['food']["subtitle"]}",
            onTap: () {
              getServiceRoute(
                  orderType: OrderType.Restaurant,
                  serviceRoute: CustRestaurantListView.navigate,
                  singleOrderRoute: (int orderId) {
                    ViewRestaurantOrderScreen.navigate(orderId: orderId);
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
                  serviceRoute: CustLaundriesListView.navigate,
                  singleOrderRoute: (int orderId) {
                    CustLaundryOrderView.navigate(orderId: orderId);
                  });
            },
          ),
        ),
        ServicesCard(
          title: "Currier",
          url: "assets/images/customer/courrierService.png",
          subtitle: "Obtain delivery of anything you desire to your location.",
          onTap: () {
            //  MezRouter.toNamed(getCourierOrderRoute(2));
          },
        ),
      ],
    );
  }

  Future<void> getServiceRoute(
      {required OrderType orderType,
      required Future<void> Function() serviceRoute,
      required void Function(int) singleOrderRoute}) async {
    if (Get.find<AuthController>().fireAuthUser != null &&
        _orderController != null) {
      if (_orderController!.firstOrderIdBasedOnType(orderType) != null) {
        singleOrderRoute(_orderController!.firstOrderIdBasedOnType(orderType)!);
      } else {
        await serviceRoute();
      }
    } else {
      await serviceRoute();
    }
  }

  Future<void> _navigateToOrdersIfNecessary() async {
    if (_orderController != null) {
      await _orderController!.fetchCurrentOrders();
      if (_orderController!.hasOneOrder) {
        if (_orderController!.hasOneOrderType == OrderType.Restaurant) {
          // MezRouter.popEverythingAndNavigateTo(RestaurantOrderRoutes()
          //     .getRestaurantOrderRoute(_orderController!.hasOneOrderId!));
          // ignore: unawaited_futures
          MezRouter.popEverythingTillBeforeHome().then((_) =>
              ViewRestaurantOrderScreen.navigate(
                  orderId: _orderController!.hasOneOrderId!));
          // } else if (_orderController!.hasOneOrderType == OrderType.Taxi) {
          //   MezRouter.popEverythingAndNavigateTo(
          //       getTaxiOrderRoute(_orderController!.hasOneOrderId!));
        } else if (_orderController!.hasOneOrderType == OrderType.Laundry) {
          // ignore: unawaited_futures
          MezRouter.popEverythingTillBeforeHome().then((_) =>
              CustLaundryOrderView.navigate(
                  orderId: _orderController!.hasOneOrderId!));
        }
      } else if (_orderController!.hasManyOrders) {
        // ignore: unawaited_futures
        MezRouter.popEverythingTillBeforeHome()
            .then((_) => CustomerOrdersListView.navigate());
      }
    }
  }
}
