// ignore_for_file: unawaited_futures, inference_failure_on_function_invocation

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/businessDeepLinkHandler.dart';
import 'package:mezcalmos/BusinessApp/controllers/BusinessOpAuthController.dart';
import 'package:mezcalmos/BusinessApp/notificationHandler.dart';
import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/deepLinkHandler.dart';
import 'package:mezcalmos/Shared/firebaseNodes/operatorNodes.dart';
import 'package:mezcalmos/Shared/helpers/NotificationsHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/CreateServiceView.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class BusinessWrapper extends StatefulWidget {
  const BusinessWrapper({super.key});

  @override
  State<BusinessWrapper> createState() => _BusinessWrapperState();
}

class _BusinessWrapperState extends State<BusinessWrapper> {
  Operator? restaurantOperator;

  BusinessOpAuthController businessOpAuthController =
      Get.find<BusinessOpAuthController>();
  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;
  @override
  void initState() {
    mezDbgPrint(" 👋👋👋👋👋👋👋 Business ::init state 👋👋👋👋👋👋👋 ");
    Future.microtask(() async {
      await DeepLinkHandler.startDynamicLinkCheckRoutine(
          BusinessOpDeepLinkHandler.handleDeeplink);
      businessOpAuthController
          .setupBusinessOperator()
          .whenComplete(() => handleState());
    });

    _setupNotifications();
    super.initState();
  }

  Future<void> handleState() async {
    // if (Get.find<AuthController>().userRedirectFinish == true) {
    //   return;
    // }
    mezDbgPrint(
        "🫡 Start routing process 🫡 =>${businessOpAuthController.operator.value}");

    if (businessOpAuthController.operator.value?.status ==
        cModels.AuthorizationStatus.Authorized) {
      MezRouter.toNamed(BusinessOpRoutes.kBusniessOpTabsView);
    } else {
      CreateServiceView.navigate(
          serviceProviderType: cModels.ServiceProviderType.Business);
    }
  }

  void _setupNotifications() {
    if (Get.find<AuthController>().isUserSignedIn) {
      mezDbgPrint("Setup notifs listener 🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀 ");
      _notificationsStreamListener?.cancel();
      _notificationsStreamListener = null;
      _notificationsStreamListener = initializeShowNotificationsListener();
      Get.find<ForegroundNotificationsController>()
          .startListeningForNotificationsFromFirebase(
        operatorNotificationsNode(
            uid: Get.find<AuthController>().fireAuthUser!.uid,
            operatorType: OperatorType.Business),
        businessOperatorNotificationHandler,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        backgroundColor: Colors.white,
        appBar: MezcalmosAppBar(AppBarLeftButtonType.Menu,
            onClick: () => Get.find<SideMenuDrawerController>().openMenu()),
        body: MezLogoAnimation(centered: true));
  }

  @override
  void dispose() {
    _notificationsStreamListener?.cancel();
    _notificationsStreamListener = null;
    super.dispose();
  }
}
