import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart' as material;
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
import 'package:qlevar_router/qlevar_router.dart';

typedef shouldSaveNotification = bool Function(Notification notification);

class ForegroundNotificationsController extends GetxController {
  ForegroundNotificationsController({this.isWebVersion});
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();

  RxList<Notification> notifications = RxList<Notification>();

  StreamSubscription? _notificationNodeAddListener;
  StreamSubscription? _notificationNodeRemoveListener;
  bool? isWebVersion = false;

  StreamController<Notification> _displayNotificationsStreamController =
      StreamController<Notification>.broadcast();
  late String _notificationNode;

  Stream<Notification> get displayNotificationsStream =>
      _displayNotificationsStreamController.stream;

  @override
  void onInit() {
    mezDbgPrint(
        "sd@s:ForegroundNotificationsController::Notifications =====> ${notifications.length}");

    mezDbgPrint("sd@s:ForegroundNotificationsController: Init");
    super.onInit();
  }

  void startListeningForNotificationsFromFirebase(
      String notificationNode,
      // ignore: avoid_annotating_with_dynamic
      Notification Function(String key, dynamic value) notificationHandler) {
    var x = <Notification>[];
    // mezDbgPrint(
    //     "ForegroundNotificationsController:startListeningForNotifications");
    // mezDbgPrint(notificationNode);
    _notificationNode = notificationNode;
    _notificationNodeAddListener?.cancel();
    _databaseHelper.firebaseDatabase
        .ref()
        .child(notificationNode)
        .onChildAddedWitchCatch()
        .then((Stream<DatabaseEvent> stream) {
      _notificationNodeAddListener = stream.listen((DatabaseEvent event) {
        try {
          final Notification _notification =
              notificationHandler(event.snapshot.key!, event.snapshot.value);

          final bool alreadyOnLinkPage =
              isCurrentRoute(_notification.linkUrl, isWebVersion ?? false);

          switch (_notification.notificationAction) {
            case NotificationAction.ShowPopUp:
              if (Get.find<AppLifeCycleController>().appState ==
                  material.AppLifecycleState.resumed) {
                _displayNotificationsStreamController.add(_notification);
              }
              break;
            case NotificationAction.ShowSnackBarAlways:
              _displayNotificationsStreamController.add(_notification);
              break;
            case NotificationAction.ShowSnackbarOnlyIfNotOnPage:
              //   if (!alreadyOnLinkPage) {
              _displayNotificationsStreamController.add(_notification);
              //  }
              break;
          }

          // if (!alreadyOnLinkPage) {
          notifications.add(_notification);
          // } else {
          //   removeNotification(_notification.id);
          // }
        } catch (e, stk) {
          mezDbgPrint("Invalid notification");
          mezDbgPrint(e);
          mezDbgPrint(stk);
        }
      });
    });

    //     .listen((dynamic event) {
    //   // mezDbgPrint("sd@s:ForegroundNotificationsController:: NEW NOTIFICATION");
    //   // mezDbgPrint(event.snapshot.value);

    // });

    _notificationNodeRemoveListener?.cancel();
    _databaseHelper.firebaseDatabase
        .ref()
        .child(notificationNode)
        .onChildRemovedWitchCatch()
        .then((Stream<DatabaseEvent> value) {
      _notificationNodeRemoveListener = value.listen((DatabaseEvent event) {
        final Notification _notifaction =
            notificationHandler(event.snapshot.key!, event.snapshot.value);
        notifications.value = notifications
            .where((Notification element) => element.id != _notifaction.id)
            .toList();
      });
    });
    mezDbgPrint("[cc] the notifications length is ${x.length}");
  }

  void removeNotification(String notificationId) {
    _databaseHelper.firebaseDatabase
        .ref()
        .child("$_notificationNode/$notificationId")
        .remove();
  }

  bool hasNewNotifications() {
    return notifications.isNotEmpty;
  }

  void clearAllMessageNotification() {
    mezDbgPrint(
        "fbNotificationsController: Clearing All Messages Notifications");
    notifications()
        .where((Notification notification) =>
            notification.notificationType == NotificationType.NewMessage)
        .forEach((Notification element) {
      removeNotification(element.id);
    });
  }

  void clearAllNotification() {
    mezDbgPrint("fbNotificationsController: Clearing All Notifications");
    _databaseHelper.firebaseDatabase.ref().child("$_notificationNode").remove();
  }

  @override
  void onClose() {
    _notificationNodeAddListener?.cancel();
    _notificationNodeRemoveListener?.cancel();
    super.onClose();
  }

  bool hasNewMessageNotification(int chatId) {
    mezDbgPrint("🥸 chatId ==========>>>$chatId");
    notifications().forEach((Notification n) {
      mezDbgPrint(n.chatId);
    });
    mezDbgPrint(
        "Final value ===>${notifications().where((Notification notification) => notification.notificationType == NotificationType.NewMessage && notification.chatId == chatId).toList().isNotEmpty}");
    return notifications()
        .where((Notification notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            notification.chatId == chatId)
        .toList()
        .isNotEmpty;
  }
}

bool isCurrentRoute(String route, bool isWebVersion) {
  return routeMatch(route, isWebVersion ? QR.currentPath : Get.currentRoute);
}

bool routeMatch(String routeA, String routeB) {
  return routeA.split("?")[0] == routeB.split("?")[0];
}






//// first make ur code separated and the call the incomming changes 
///
///
//notification handler for web
