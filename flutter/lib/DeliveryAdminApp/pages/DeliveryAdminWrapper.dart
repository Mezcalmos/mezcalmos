import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/deliveryAdminAuth.dart';
import 'package:mezcalmos/DeliveryAdminApp/models/DeliveryOperator.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

class DeliveryAdminWrapper extends StatefulWidget {
  const DeliveryAdminWrapper({super.key});

  @override
  State<DeliveryAdminWrapper> createState() => _DeliveryAdminWrapperState();
}

class _DeliveryAdminWrapperState extends State<DeliveryAdminWrapper> {
  DeliveryOperatorAuthController _adminAuthController =
      Get.find<DeliveryOperatorAuthController>();
  @override
  void initState() {
    Future<void>.microtask(() {
      final DeliveryOperator? _operator = _adminAuthController.deliveryOperator;
      if (_operator != null) {
        mezDbgPrint("+ Operator is not null ==> ${_operator.status}");
        handleAuthorization(_operator.status);
      } else {
        mezDbgPrint("+ Operator is null!");

        _adminAuthController.operatorStream.first.then((DeliveryOperator? _op) {
          mezDbgPrint("+ Operator :: from :: OpStream :: ${_op?.status}!");
          handleAuthorization(_op?.status);
        });
      }
    });
    // final String userId = Get.find<AuthController>().fireAuthUser!.uid;
    // _notificationsStreamListener = initializeShowNotificationsListener();
    // Get.find<ForegroundNotificationsController>()
    //     .startListeningForNotificationsFromFirebase(
    //   adminNotificationsNode(userId),
    //   deliveryAdminNotificationHandler,
    // );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void handleAuthorization(String? status) {
    switch (status) {
      case "approved":
        if (MezRouter.currentRoute()?.name == kNotAuthorizedOperator)
          MezRouter.offNamed(kCurrentOrdersList);
        else
          MezRouter.toNamed(kCurrentOrdersList);
        break;
      default:
        MezRouter.toNamed(kNotAuthorizedOperator);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MezLogoAnimation(centered: true));
  }
}




// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mezcalmos/DeliveryAdminApp.old/controllers/adminAuthController.dart';
// import 'package:mezcalmos/DeliveryAdminApp.old/models/Admin.dart';
// import 'package:mezcalmos/DeliveryAdminApp.old/notificationHandler.dart';
// import 'package:mezcalmos/DeliveryAdminApp.old/router.dart';
// import 'package:mezcalmos/Shared/controllers/authController.dart';
// import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
// import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
// import 'package:mezcalmos/Shared/firebaseNodes/deliveryAdminNodes.dart';
// import 'package:mezcalmos/Shared/helpers/NotificationsHelper.dart';
// import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
// import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
//     as MezNotification;
// import 'package:mezcalmos/Shared/sharedRouter.dart';
// import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
// import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
// import 'package:mezcalmos/Shared/MezRouter.dart';

// class AdminWrapper extends StatefulWidget {
//   @override
//   _AdminWrapperState createState() => _AdminWrapperState();
// }

// class _AdminWrapperState extends State<AdminWrapper> {
//   StreamSubscription<MezNotification.Notification>?
//       _notificationsStreamListener;

//   @override
//   void initState() {
//     Future.microtask(() {
//       mezDbgPrint("AdminWrapper::microtask handleState first time");
//       final Admin? admin = Get.find<AdminAuthController>().admin;
//       if (admin != null) {
//         mezDbgPrint("Admin ===> null");
//         handleAuthorization(admin.authorized);
//       } else {
//         mezDbgPrint("Admin ===> Not null");

//         Get.find<AdminAuthController>().adminStream.first.then((admin) {
//           mezDbgPrint("Inside AdminStream.first.then >> $admin");
//           handleAuthorization(admin?.authorized ?? false);
//         });
//       }
//     });
//     final String userId = Get.find<AuthController>().fireAuthUser!.uid;
//     _notificationsStreamListener = initializeShowNotificationsListener();
//     Get.find<ForegroundNotificationsController>()
//         .startListeningForNotificationsFromFirebase(
//       adminNotificationsNode(userId),
//       deliveryAdminNotificationHandler,
//     );
//     super.initState();
//   }

//   void handleAuthorization(bool authorized) {
//     if (authorized) {
//       mezDbgPrint("AdminWrapper::handleState going to in process orders");
//       MezRouter.toNamed<void>(kOrdersRoute);
//     } else {
//       mezDbgPrint("AdminWrapper::handleState going to unauthorized");
//       MezRouter.toNamed<void>(kUnauthorizedRoute);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     mezDbgPrint("AdminWrapper:: build");
//     return Scaffold(
//       key: Get.find<SideMenuDrawerController>().getNewKey(),
//       drawer: MezSideMenu(),
//       backgroundColor: Colors.white,
//       // appBar: mezcalmosAppBar(
//       //     "menu", Get.find<SideMenuDraweController>().openMenu),
//       body: MezLogoAnimation(centered: true),
//     );
//   }

//   @override
//   void dispose() {
//     _notificationsStreamListener?.cancel();
//     _notificationsStreamListener = null;
//     super.dispose();
//   }
// }
