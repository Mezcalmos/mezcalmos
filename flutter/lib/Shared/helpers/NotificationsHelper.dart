// ignore_for_file: inference_failure_on_function_invocation

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart' as notifs;
import 'package:mezcalmos/Shared/sharedRouter.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['helpers']
    ["NotificationsHelper"];

StreamSubscription<notifs.Notification> initializeShowNotificationsListener() {
  return Get.find<ForegroundNotificationsController>()
      .displayNotificationsStream
      .listen((notifs.Notification notification) {
    // mezDbgPrint("Notification Displayer: ${notification.toJson()}");
    // mezDbgPrint("Notif::title ====> ${notification.title}");
    // mezDbgPrint("Notif::body ====> ${notification.body}");
    if (DateTime.now().difference(notification.timestamp) <
        Duration(minutes: 1)) {
      _displayNotification(notification);
    }
  });
}

Future<void> _displayNotification(notifs.Notification notification) async {
  await Get.find<SettingsController>().playNotificationSound();
  // mezDbgPrint(notification.imgUrl);
  if (notification.notificationAction == notifs.NotificationAction.ShowPopUp) {
    await decideWhichButtonDialogToUse(notification);
  } else {
    notificationSnackBar(notification.imgUrl, notification.title,
        notification.body, notification.formattedTime, () async {
      // mezDbgPrint("Notification route ===> ${notification.linkUrl} !");
      await Get.toNamed(notification.linkUrl);
    });
  }
}

Future<void> decideWhichButtonDialogToUse(
    notifs.Notification notification) async {
  if (isCurrentRoute(notification.linkUrl))
    await showStatusInfoDialog(Get.context!,
        status: notification.title,
        description: notification.body,
        primaryIcon: notification.icon,
        bottomRightIcon: notification.secondaryIcon,
        showSmallIcon: notification.secondaryIcon != null);
  else
    await showStatusInfoDialog(
      Get.context!,
      status: notification.title,
      primaryIcon: notification.icon,
      description: notification.body,
      showSmallIcon: notification.secondaryIcon != null,
      bottomRightIcon: notification.secondaryIcon,
      primaryCallBack: () {
        Get.back(closeOverlays: true);
      },
      secondaryCallBack: () => Get.toNamed(notification.linkUrl),
    );
}

void notificationSnackBar(
    String imgUrl, String title, String msg, String time, Function onClick) {
  Get.rawSnackbar(
    onTap: (_) async {
      mezDbgPrint("ONTAP ====> $_");

      await onClick();
    },
    maxWidth: Get.width,
    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    duration: Duration(milliseconds: 5000),
    icon: Container(
      height: 50,
      width: 10,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade100,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: imgUrl.startsWith("http")
          ? Image.network(
              imgUrl,
              fit: BoxFit.cover,
              height: 50,
              width: 10,
            )
          : Image.asset(imgUrl),
    ),
    backgroundColor: Colors.black,
    borderWidth: 1,
    borderColor: Colors.black,
    borderRadius: 12,
    messageText: Text(
      msg,
      style: TextStyle(color: Colors.white),
    ),
    titleText: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: Text(
            title,
            style: TextStyle(fontFamily: 'psb', color: Colors.white),
          ),
        ),
        Text(
          time,
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
    padding: EdgeInsets.all(25),
    snackPosition: SnackPosition.TOP,
    snackStyle: SnackStyle.FLOATING,
  );
}
