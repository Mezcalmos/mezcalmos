import 'dart:async';

import 'package:callkeep/callkeep.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/components/ServicesCard.dart';
import 'package:mezcalmos/CustomerApp/controllers/laundry/LaundryController.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/deepLinkHandler.dart';
import 'package:mezcalmos/CustomerApp/notificationHandler.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';
import 'package:mezcalmos/Shared/helpers/NotificationsHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as MezNotification;
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:uuid/uuid.dart';
//import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';

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

  /// _orderController
  OrderController? _orderController;

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

  final FlutterCallkeep _callKeep = FlutterCallkeep();

  // Map<String, Call> calls = {};
  // String newUUID() => Uuid().v4();
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // void removeCall(String callUUID) {
  //   setState(() {
  //     calls.remove(callUUID);
  //   });
  // }

  // void setCallHeld(String callUUID, bool held) {
  //   setState(() {
  //     calls[callUUID]!.held = held;
  //   });
  // }

  // void setCallMuted(String callUUID, bool muted) {
  //   setState(() {
  //     calls[callUUID]!.muted = muted;
  //   });
  // }

  // Future<void> answerCall(CallKeepPerformAnswerCallAction event) async {
  //   final String callUUID = event.callUUID!;
  //   final String number = calls[callUUID]!.number;
  //   print('[answerCall] $callUUID, number: $number');
  //   Timer(const Duration(seconds: 1), () {
  //     print('[setCurrentCallActive] $callUUID, number: $number');
  //     _callKeep.setCurrentCallActive(callUUID);
  //   });
  // }

  // Future<void> endCall(CallKeepPerformEndCallAction event) async {
  //   print('endCall: ${event.callUUID}');
  //   removeCall(event.callUUID!);
  // }

  // Future<void> didPerformDTMFAction(CallKeepDidPerformDTMFAction event) async {
  //   print('[didPerformDTMFAction] ${event.callUUID}, digits: ${event.digits}');
  // }

  // Future<void> didReceiveStartCallAction(
  //     CallKeepDidReceiveStartCallAction event) async {
  //   if (event.handle == null) {
  //     // @TODO: sometime we receive `didReceiveStartCallAction` with handle` undefined`
  //     return;
  //   }
  //   final String callUUID = event.callUUID ?? newUUID();
  //   setState(() {
  //     calls[callUUID] = Call(event.handle!);
  //   });
  //   print('[didReceiveStartCallAction] $callUUID, number: ${event.handle}');

  //   _callKeep.startCall(callUUID, event.handle!, event.handle!);

  //   Timer(const Duration(seconds: 1), () {
  //     print('[setCurrentCallActive] $callUUID, number: ${event.handle}');
  //     _callKeep.setCurrentCallActive(callUUID);
  //   });
  // }

  // Future<void> didPerformSetMutedCallAction(
  //     CallKeepDidPerformSetMutedCallAction event) async {
  //   final String number = calls[event.callUUID]!.number;
  //   print(
  //       '[didPerformSetMutedCallAction] ${event.callUUID}, number: $number (${event.muted})');

  //   setCallMuted(event.callUUID!, event.muted!);
  // }

  // Future<void> didToggleHoldCallAction(
  //     CallKeepDidToggleHoldAction event) async {
  //   final String number = calls[event.callUUID]!.number;
  //   print(
  //       '[didToggleHoldCallAction] ${event.callUUID}, number: $number (${event.hold})');

  //   setCallHeld(event.callUUID!, event.hold!);
  // }

  // Future<void> hangup(String callUUID) async {
  //   _callKeep.endCall(callUUID);
  //   removeCall(callUUID);
  // }

  // Future<void> setOnHold(String callUUID, bool held) async {
  //   _callKeep.setOnHold(callUUID, held);
  //   final String handle = calls[callUUID]!.number;
  //   print('[setOnHold: $held] $callUUID, number: $handle');
  //   setCallHeld(callUUID, held);
  // }

  // Future<void> setMutedCall(String callUUID, bool muted) async {
  //   _callKeep.setMutedCall(callUUID, muted);
  //   final String handle = calls[callUUID]!.number;
  //   print('[setMutedCall: $muted] $callUUID, number: $handle');
  //   setCallMuted(callUUID, muted);
  // }

  // Future<void> updateDisplay(String callUUID) async {
  //   final String number = calls[callUUID]!.number;
  //   // Workaround because Android doesn't display well displayName, se we have to switch ...
  //   if (isIOS) {
  //     _callKeep.updateDisplay(callUUID,
  //         displayName: 'New Name', handle: number);
  //   } else {
  //     _callKeep.updateDisplay(callUUID,
  //         displayName: number, handle: 'New Name');
  //   }

  //   print('[updateDisplay: $number] $callUUID');
  // }

  // Future<void> displayIncomingCallDelayed(String number) async {
  //   Timer(const Duration(seconds: 3), () {
  //     displayIncomingCall(number);
  //   });
  // }

  // Future<void> displayIncomingCall(String number) async {
  //   final String callUUID = newUUID();
  //   setState(() {
  //     calls[callUUID] = Call(number);
  //   });
  //   print('Display incoming call now');
  //   final bool hasPhoneAccount = await _callKeep.hasPhoneAccount();
  //   if (!hasPhoneAccount) {
  //     await _callKeep.hasDefaultPhoneAccount(context, <String, dynamic>{
  //       'alertTitle': 'Permissions required',
  //       'alertDescription':
  //           'This application needs to access your phone accounts',
  //       'cancelButton': 'Cancel',
  //       'okButton': 'ok',
  //       'foregroundService': {
  //         'channelId': 'com.company.my',
  //         'channelName': 'Foreground service for my app',
  //         'notificationTitle': 'My app is running on background',
  //         'notificationIcon': 'Path to the resource icon of the notification',
  //       },
  //     });
  //   }

  //   print('[displayIncomingCall] $callUUID number: $number');
  //   _callKeep.displayIncomingCall(callUUID, number,
  //       handleType: 'number', hasVideo: false);
  // }

  // void didDisplayIncomingCall(CallKeepDidDisplayIncomingCall event) {
  //   var callUUID = event.callUUID;
  //   var number = event.handle;
  //   print('[displayIncomingCall] $callUUID number: $number');
  //   setState(() {
  //     calls[callUUID!] = Call(number!);
  //   });
  // }

  // void onPushKitToken(CallKeepPushKitToken event) {
  //   print('[onPushKitToken] token => ${event.token}');
  // }

  @override
  void initState() {
    super.initState();
    Get.put(TaxiController(), permanent: true);
    Get.put(RestaurantController(), permanent: true);
    Get.put(RestaurantsInfoController(), permanent: true);
    Get.put(LaundryController(), permanent: true);
    WidgetsBinding.instance.addObserver(this);

    if (Get.find<AuthController>().fireAuthUser != null) {
      _doIfFireAuthUserIsNotNull();
    }
    startAuthListener();
    //

    /// Check if app was opened through a DeepLink
    Future.wait([_deepLinkHandler.startDynamicLinkCheckRoutine()]);

    super.initState();
    // _callKeep.on(CallKeepDidDisplayIncomingCall(), didDisplayIncomingCall);
    // _callKeep.on(CallKeepPerformAnswerCallAction(), answerCall);
    // _callKeep.on(CallKeepDidPerformDTMFAction(), didPerformDTMFAction);
    // _callKeep.on(
    //     CallKeepDidReceiveStartCallAction(), didReceiveStartCallAction);
    // _callKeep.on(CallKeepDidToggleHoldAction(), didToggleHoldCallAction);
    // _callKeep.on(
    //     CallKeepDidPerformSetMutedCallAction(), didPerformSetMutedCallAction);
    // _callKeep.on(CallKeepPerformEndCallAction(), endCall);
    // _callKeep.on(CallKeepPushKitToken(), onPushKitToken);

    // _callKeep.setup(context, <String, dynamic>{
    //   'ios': {
    //     'appName': 'CallKeepDemo',
    //   },
    //   'android': {
    //     'alertTitle': 'Permissions required',
    //     'alertDescription':
    //         'This application needs to access your phone accounts',
    //     'cancelButton': 'Cancel',
    //     'okButton': 'ok',
    //     'foregroundService': {
    //       'channelId': 'com.company.my',
    //       'channelName': 'Foreground service for my app',
    //       'notificationTitle': 'My app is running on background',
    //       'notificationIcon': 'Path to the resource icon of the notification',
    //     },
    //   },
    // });
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
        _orderController != null &&
        DateTime.now().difference(appClosedTime!) > Duration(seconds: 10) &&
        Get.currentRoute != kLocationPermissionPage) {
      navigateToOrdersIfNecessary(_orderController!.currentOrders);
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

  void _doIfFireAuthUserIsNotNull() {
    _orderController = Get.find<OrderController>();
    _orderCountListener = _orderController!.currentOrders.stream.listen((_) {
      numberOfCurrentOrders.value = _orderController!.currentOrders.length;
    });
    final String? userId = Get.find<AuthController>().fireAuthUser!.uid;
    _notificationsStreamListener = initializeShowNotificationsListener();
    // listening for notification Permissions!
    // listenForLocationPermissions();
    Get.find<ForegroundNotificationsController>()
        .startListeningForNotificationsFromFirebase(
            customerNotificationsNode(userId!), customerNotificationHandler);
    if (Get.currentRoute == kHomeRoute) {
      Future.microtask(() {
        navigateToOrdersIfNecessary(_orderController!.currentOrders);
      });
    }
    appLifeCycleController.attachCallback(
        AppLifecycleState.resumed, appReturnFromBackground);
    appLifeCycleController.attachCallback(AppLifecycleState.paused, () {
      appClosedTime = DateTime.now();
    });
  }

  void checkTaxiCurrentOrdersAndNavigate() {
    _orderController = Get.find<OrderController>();
    // return;
    final num noOfCurrentTaxiOrders = _orderController
            ?.currentOrders()
            .where((Order currentOrder) =>
                currentOrder.orderType == OrderType.Taxi)
            .length ??
        0;
    if (noOfCurrentTaxiOrders == 0) {
      Get.toNamed<void>(kTaxiRequestRoute);
    } else {
      final String orderId = _orderController!.currentOrders
          .firstWhere(
              (Order currentOrder) => currentOrder.orderType == OrderType.Taxi)
          .orderId;
      Get.toNamed<void>(getTaxiOrderRoute(orderId));
    }
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
                  singleOrderRoute: (String orderId) {
                    Get.toNamed<void>(getRestaurantOrderRoute(orderId));
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
                  singleOrderRoute: (String v) {
                    Get.toNamed<void>(getLaundyOrderRoute(v));
                  });
            },
          ),
        ),
        Obx(
          () => ServicesCard(
            title: "${_i18n()['taxi']["title"]}",
            url: "assets/images/customer/taxi/taxiService.png",
            subtitle: "${_i18n()["comingSoon"]}",
            // onTap: () {
            //   getServiceRoute(
            //       orderType: OrderType.Taxi,
            //       serviceRoute: kTaxiRequestRoute,
            //       singleOrderRoute: (String orderId) {
            //         Get.toNamed<void>(getTaxiOrderRoute(orderId));
            //       });
            // },
          ),
        ),
      ],
    );
  }

  void getServiceRoute(
      {required OrderType orderType,
      required String serviceRoute,
      required void Function(String) singleOrderRoute}) {
    if (Get.find<AuthController>().fireAuthUser != null) {
      final List<Order> orders = _orderController!.currentOrders
          .where((Order p0) => p0.orderType == orderType)
          .toList();
      if (orders.length == 1) {
        //   Get.toNamed(getLaundyOrderRoute(orders[0].orderId));
        singleOrderRoute(orders[0].orderId);
      } else if (orders.length > 1) {
        Get.toNamed<void>(kOrdersRoute);
      } else {
        Get.toNamed<void>(serviceRoute);
      }
    } else {
      Get.toNamed<void>(serviceRoute);
    }
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
      } else if (currentOrders[0].orderType == OrderType.Laundry) {
        popEverythingAndNavigateTo(
            getLaundyOrderRoute(currentOrders[0].orderId));
      }
    } else if (currentOrders.length > 1) {
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
  //       Get.toNamed<void>(kLocationPermissionPage);
  //     }
  //   });
  // }
}
