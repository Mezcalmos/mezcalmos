import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart' as material;
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

typedef shouldSaveNotification = bool Function(Notification notification);

class ForegroundNotificationsController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();

  RxList<Notification> notifications = RxList<Notification>();

  StreamSubscription? _notificationNodeAddListener;
  StreamSubscription? _notificationNodeRemoveListener;
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
              MezRouter.isCurrentRoute(_notification.linkUrl);

          switch (_notification.notificationAction) {
            case NotificationAction.ShowPopUp:
              if (Get.find<AppLifeCycleController>().appState ==
                  material.AppLifecycleState.resumed) {
                _displayNotificationsStreamController.add(_notification);
              }
              break;
            case NotificationAction.ShowSnackBarAlways:
            case NotificationAction.NavigteToLinkUrl:
              _displayNotificationsStreamController.add(_notification);
              break;
            case NotificationAction.ShowSnackbarOnlyIfNotOnPage:
              if (!alreadyOnLinkPage) {
                _displayNotificationsStreamController.add(_notification);
              }
              break;
          }
          if (!alreadyOnLinkPage &&
              DateTime.now().difference(_notification.timestamp) <
                  Duration(days: 5)) {
            notifications.add(_notification);
          } else {
            removeNotification(_notification.id);
          }
        } catch (e, stk) {
          mezDbgPrint("Invalid notification 🛑 ${event.snapshot.value}");
          mezDbgPrint(e);
          mezDbgPrint(stk);
        }
      });
    });

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
  }

  void removeNotification(String notificationId) {
    mezDbgPrint("👉 Removing notification $notificationId");
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

  void clearAllOrderNotifications(
      {required OrderType orderType, required num orderId}) {
    mezDbgPrint(
        "🗑️ Clearing notifs of order id => $orderId and order type => $orderType");
    notifications()
        .where((Notification notification) =>
            notification.orderId == orderId &&
            notification.variableParams["orderType"] ==
                orderType.toFirebaseFormatString())
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
    return notifications()
        .where((Notification notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            notification.chatId == chatId)
        .toList()
        .isNotEmpty;
  }

  bool hasNewSPMessageNotification() {
    return notifications()
        .where((Notification notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            (notification.isServiceProvderChat ?? false))
        .toList()
        .isNotEmpty;
  }
}
