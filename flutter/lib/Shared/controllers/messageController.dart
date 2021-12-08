// import 'dart:async';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class MessageController extends GetxController {
  Rx<Chat> _model = Chat("", "", {}, [], "").obs;
  Chat? get value => _model.value;
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  AuthController _authController = Get.find<AuthController>();
  StreamSubscription? chatListener;
  late AppType appType;

  @override
  void onInit() {
    super.onInit();
    mezDbgPrint("--------------------> messageController Initialized !");
    this.appType = Get.find<SettingsController>().appType;
  }

  void loadChat(String userId, String orderId,
      {VoidCallback? onValueCallBack}) {
    chatListener?.cancel();
    chatListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(orderChatNode(orderId))
        .onValue
        .listen((event) {
      if (event.snapshot.value != null) {
        // mezDbgPrint("\n\n\n ${event.snapshot.value} \n\n\n");
        Chat res = Chat.fromJson(event.snapshot.key, event.snapshot.value);

        _model.value = res;
        if (onValueCallBack != null) onValueCallBack();
        // mezDbgPrint(
        //     "--------------------> messageController Listener Invoked with Messages > ${_model.value.messages} ");
      }
    });
  }

  void sendMessage(String message, String orderId) async {
    _databaseHelper.firebaseDatabase
        .reference()
        .child('${orderChatNode(orderId)}/messages')
        .push()
        .set(<String, dynamic>{
      "message": message,
      "userId": _authController.user!.uid,
      "timestamp": DateTime.now().toUtc().toString(),
      "orderId": _model.value.orderId
    });
  }

  Participant? sender() {
    return _model.value.participants[_authController.user!.uid];
  }

  Participant? recipient({ParticipantType? participantType}) {
    if (participantType != null) {
      for (String key in _model.value.participants.keys.toList()) {
        Participant recipient = _model.value.participants[key]!;
        if (recipient.participantType == participantType) {
          return recipient;
        }
      }
    }

    for (String key in _model.value.participants.keys.toList()) {
      Participant recipient = _model.value.participants[key]!;
      if (key != _authController.user!.uid) {
        return recipient;
      }
    }
  }

  void clearMessageNotifications(String orderId) {
    mezDbgPrint("Clearing message notifications");
    ForegroundNotificationsController fbNotificationsController =
        Get.find<ForegroundNotificationsController>();
    fbNotificationsController
        .notifications()
        .where((notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            notification.orderId! == orderId)
        .forEach((notification) {
      fbNotificationsController.removeNotification(notification.id);
    });
  }

  // using onClose better , since  the getter of GetX invoke it automatically.
  // for now we will delete the MessageController instance manually , when Order canceled or finished.
  // Later on , it will be done automatically by GetX since we will be changing everything to GetxPage routes.

  @override
  void onClose() {
    chatListener?.cancel();
    chatListener = null;
    super.onClose();
  }
}
