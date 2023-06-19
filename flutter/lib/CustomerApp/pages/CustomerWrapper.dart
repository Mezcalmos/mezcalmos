// ignore_for_file: unawaited_futures

import 'dart:async';

import 'package:badges/badges.dart' as badge;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/ServicesCard.dart';
import 'package:mezcalmos/CustomerApp/controllers/custBusinessCartController.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/customerDeepLinkHandler.dart';
import 'package:mezcalmos/CustomerApp/notificationHandler.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceView/AllServiceView.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/CustCartView.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrderView/CustOrderListView.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrdersListView/CustomerOrdersListView.dart';
import 'package:mezcalmos/CustomerApp/pages/CustProfileView/CustProfileView.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';
import 'package:mezcalmos/Shared/helpers/NotificationsHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;
import 'package:mezcalmos/Shared/pages/MessagesListView/MessagesListView.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:uni_links/uni_links.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustomerWrapper'];

class CustomerWrapper extends StatefulWidget {
  @override
  _CustomerWrapperState createState() => _CustomerWrapperState();
}

class _CustomerWrapperState extends State<CustomerWrapper> {
  AuthController authController = Get.find<AuthController>();
  CustomerAuthController? customerAuthController;

  AppLifeCycleController appLifeCycleController =
      Get.find<AppLifeCycleController>();

  DateTime? appClosedTime;

  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;

  RxInt numberOfCurrentOrders = RxInt(0);

  StreamSubscription<dynamic>? _authStateChnagesListener;

  @override
  void initState() {
    super.initState();

    if (authController.fireAuthUser != null) {
      customerAuthController = Get.find<CustomerAuthController>();
      _startListeningForNotifications();
      MezRouter.registerReturnToViewCallback(SharedRoutes.kHomeRoute, () {
        _checkOrders();
      });

      _checkOrders();
    }
    startAuthListener();
    // DeepLinkHandler.startDynamicLinkCheckRoutine(
    //     CustomerDeepLinkHandler.handleDeepLink);

    _startListeningForLinks();
  }

  void _checkOrders() {
    if (_index.value == 0) {
      mezDbgPrint(
          "✅ ===========>CustomerWrapper Check ORders  ======>${MezRouter.bodyArguments}");
      final bool showOrders = MezRouter.backResult == true;
      if (showOrders) {
        _index.value = 1;
      }
    }
  }

  @override
  void dispose() {
    _authStateChnagesListener?.cancel();
    _authStateChnagesListener = null;
    _notificationsStreamListener?.cancel();
    _notificationsStreamListener = null;
    super.dispose();
  }

  RxInt _index = RxInt(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Get.find<AuthController>().isUserSignedIn
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(
                  () => Get.find<CustBusinessCartController>().cart.value !=
                              null &&
                          Get.find<CustBusinessCartController>()
                              .cart
                              .value!
                              .items
                              .isNotEmpty
                      ? FloatingActionButton(
                          heroTag: "cart",
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                          backgroundColor: primaryBlueColor,
                          onPressed: () async {
                            await CustCartView.navigate();
                          },
                        )
                      : SizedBox(),
                ),
                Obx(
                  () => Get.find<CustBusinessCartController>()
                                  .previousOrders
                                  .value !=
                              null &&
                          Get.find<CustBusinessCartController>()
                              .previousOrders
                              .value!
                              .isNotEmpty
                      ? FloatingActionButton(
                          heroTag: "orders",
                          child: Icon(
                            Icons.access_time_outlined,
                            color: Colors.white,
                          ),
                          backgroundColor: primaryBlueColor,
                          onPressed: () async {
                            await CustOrderListView.navigate();
                          },
                        )
                      : SizedBox(),
                ),
              ],
            )
          : null,
      bottomNavigationBar: _navBar(),
      body: Obx(() {
        if (authController.user != null) {
          return _getBody();
        } else {
          return AllServiceView();
        }
      }),
    );
  }

  Widget _getBody() {
    switch (_index.value) {
      case 0:
        return AllServiceView();
      case 1:
        return CustomerOrdersListView(
          asTab: true,
        );
      case 2:
        return MessagesListView(
          entityType: EntityType.Customer,
        );
      case 3:
        return CustProfileView();

      default:
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Text("Error"),
          ),
        );
    }
  }

  Widget _navBar() {
    return Obx(
      () => authController.user != null
          ? BottomNavigationBar(
              selectedLabelStyle: context.textTheme.bodyLarge,
              unselectedLabelStyle: context.textTheme.bodyMedium,
              currentIndex: _index.value,
              unselectedItemColor: pickLocationHintTextFieldColor,
              onTap: (int v) {
                _index.value = v;
              },
              type: BottomNavigationBarType.fixed,
              items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      label: "${_i18n()['home']}"),
                  BottomNavigationBarItem(
                      icon: badge.Badge(
                          badgeColor: Colors.red,
                          badgeContent: Text(
                            numberOfCurrentOrders.value.toString(),
                            style: context.textTheme.bodyLarge
                                ?.copyWith(color: Colors.white),
                          ),
                          showBadge: numberOfCurrentOrders > 0,
                          child: Icon(Icons.history)),
                      label: "${_i18n()['orders']}"),
                  BottomNavigationBarItem(
                    icon: badge.Badge(
                      badgeColor: Colors.red,
                      showBadge: Get.find<ForegroundNotificationsController>()
                          .hasNewSPMessageNotification(),
                      position: badge.BadgePosition(top: 0, end: 0),
                      child: Icon(
                        Icons.sms_outlined,
                      ),
                    ),
                    label: "${_i18n()['messages']}",
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline),
                      label: "${_i18n()['profile']}"),
                ])
          : SizedBox(),
    );
  }

  void startAuthListener() {
    _authStateChnagesListener?.cancel();
    _authStateChnagesListener = null;
    _authStateChnagesListener =
        authController.authStateStream.listen((User? fireUser) {
      if (fireUser != null) {
        _startListeningForNotifications();
      } else {
        _notificationsStreamListener?.cancel();
        _notificationsStreamListener = null;
        appLifeCycleController.cleanAllCallbacks();
      }
    });
  }

  Future<void> _startListeningForNotifications() async {
    _notificationsStreamListener = initializeShowNotificationsListener();
    final String? userId = Get.find<AuthController>().fireAuthUser!.uid;
    Get.find<ForegroundNotificationsController>()
        .startListeningForNotificationsFromFirebase(
            customerNotificationsNode(userId!), customerNotificationHandler);
  }

  Future<void> _startListeningForLinks() async {
    mezDbgPrint("startListeningForLinks");
    String? initialLink;
    try {
      initialLink = await getInitialLink();
    } catch (error) {
      // Handle error
    }
    // Parse the initial link (if it exists)
    if (initialLink != null) {
      CustomerLinkHandler.handleLink(Uri.parse(initialLink));
    }

    // Subscribe to incoming links
    if (kIsWeb == false) {
      linkStream.listen((String? link) {
        // Parse the link
        if (link != null) {
          CustomerLinkHandler.handleLink(Uri.parse(link));
        }
      });
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
    return Obx(
      () => Column(
        children: [
          ServicesCard(
            title: "${_i18n()['food']["title"]}",
            url: "assets/images/customer/foodService.png",
            subtitle: "${_i18n()['food']["subtitle"]}",
            onTap: () {},
          ),
          ServicesCard(
            title: "${_i18n()['laundry']["title"]}",
            subtitle: "${_i18n()['laundry']["subtitle"]}",
            url: "assets/images/customer/laundryService.png",
            onTap: () {},
          ),
          ServicesCard(
            title: "${_i18n()['courier']["title"]}",
            subtitle: "${_i18n()['courier']["subtitle"]}",
            url: "assets/images/customer/courrierService.png",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
