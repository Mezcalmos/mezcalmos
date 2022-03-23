import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:http/http.dart' as http;
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage event) async {
  mezDbgPrint("Handling a background message");
  if (event.data["notificationType"] == "newOrder" &&
      event.data["markReceivedUrl"] != null) {
    await markInDb(event.data["markReceivedUrl"]);
  }
}

Future<void> markInDb(String url) async {
  final String? driverId = GetStorage().read<String>(getxUserId);
  if (driverId != null) {
    url = url.replaceAll("<driverId>", driverId);
    await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, bool>{"value": true}),
    );
  }
  // .then((value) => mezDbgPrint(jsonDecode(value.body)["data"]));
}

class BackgroundNotificationsController extends GetxController {
  FirebaseMessaging _messaging = FirebaseMessaging.instance;
  StreamSubscription<RemoteMessage>? onMessageOpenedAppListener;
  @override
  void onInit() async {
    super.onInit();
    mezDbgPrint("BackgroundNotificationsController onInit");
    final NotificationSettings settings = await requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    }
    // ignore: unawaited_futures, always_specify_types
    _messaging.getInitialMessage().then((message) =>
        message != null ? notificationClickHandler(message) : null);
    onMessageOpenedAppListener =
        FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      notificationClickHandler(message);
    });
  }

  void notificationClickHandler(RemoteMessage message) {
    mezDbgPrint("notificationClickHandler");
    mezDbgPrint("CurrentRoute : ${Get.currentRoute}");
    mezDbgPrint(message.data["linkUrl"]);
    if (message.data["linkUrl"] != null) Get.closeAllSnackbars();
    Future<void>.delayed(Duration(milliseconds: 100),
        () => Get.toNamed<void>(message.data["linkUrl"]));
  }

  Future<NotificationSettings> requestPermission() async {
    final NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    mezDbgPrint(
        'User granted notification permission: ${settings.authorizationStatus}');
    return settings;
  }

  Future<String?> getToken() async {
    final String? token = await _messaging.getToken();
    return token;
  }

  @override
  void onClose() async {
    mezDbgPrint(
        "[+] DeviceNotificationsController::dispose ---------> Was invoked !");
    await onMessageOpenedAppListener?.cancel();
    super.onClose();
  }
}
