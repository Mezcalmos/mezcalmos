import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/adminAuthController.dart';
import 'package:mezcalmos/DeliveryAdminApp/models/Admin.dart';
import 'package:mezcalmos/DeliveryAdminApp/notificationHandler.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/deliveryAdminNodes.dart';
import 'package:mezcalmos/Shared/helpers/NotificationsHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

class AdminWrapper extends StatefulWidget {
  @override
  _AdminWrapperState createState() => _AdminWrapperState();
}

class _AdminWrapperState extends State<AdminWrapper> {
  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;

  @override
  void initState() {
    Future.microtask(() {
      mezDbgPrint("AdminWrapper::microtask handleState first time");
      final Admin? admin = Get.find<AdminAuthController>().admin;
      if (admin != null) {
        mezDbgPrint("Admin ===> null");
        handleAuthorization(admin.authorized);
      } else {
        mezDbgPrint("Admin ===> Not null");

        Get.find<AdminAuthController>().adminStream.first.then((admin) {
          mezDbgPrint("Inside AdminStream.first.then >> $admin");
          handleAuthorization(admin?.authorized ?? false);
        });
      }
    });
    final String userId = Get.find<AuthController>().fireAuthUser!.uid;
    _notificationsStreamListener = initializeShowNotificationsListener();
    Get.find<ForegroundNotificationsController>()
        .startListeningForNotificationsFromFirebase(
      adminNotificationsNode(userId),
      deliveryAdminNotificationHandler,
    );
    super.initState();
  }

  void handleAuthorization(bool authorized) {
    if (authorized) {
      mezDbgPrint("AdminWrapper::handleState going to in process orders");
      MezRouter.toNamed<void>(kOrdersRoute);
    } else {
      mezDbgPrint("AdminWrapper::handleState going to unauthorized");
      MezRouter.toNamed<void>(kUnauthorizedRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("AdminWrapper:: build");
    return Scaffold(
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: MezSideMenu(),
      backgroundColor: Colors.white,
      // appBar: mezcalmosAppBar(
      //     "menu", Get.find<SideMenuDraweController>().openMenu),
      body: MezLogoAnimation(centered: true),
    );
  }

  @override
  void dispose() {
    _notificationsStreamListener?.cancel();
    _notificationsStreamListener = null;
    super.dispose();
  }
}