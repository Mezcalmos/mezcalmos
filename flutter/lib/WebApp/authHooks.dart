import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/customerCartController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/Shared/controllers/AuthController.dart';
// import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
// import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';
import 'package:mezcalmos/WebApp/controllers/messageWebController.dart';
import 'package:mezcalmos/WebApp/webHelpers/WebNotificationHelper.dart';

import '../Shared/helpers/NotificationsHelper.dart';

class AuthHooks {
  static Future<void> onSignOutHook() async {
    print("[+] WebApp::AuthHooks::onSignOutHook -> Callback Executed.");
    await Get.delete<CustomerAuthController>(force: true);

    // await Get.delete<ForegroundNotificationsController>(force: true);

    // NotifListener.cancel();
  }

  static Future<void> onSignInHook() async {
    var NotifListener = initializeShowNotificationsListener(
      isWebVersion: true,
    );
    print("[+] WebApp::AuthHooks::onSignInHook -> Callback Executed.");

    if (!Get.isRegistered<AuthController>()) {
      await Get.put<AuthController>(
        AuthController(onSignInHook, onSignOutHook),
        permanent: true,
      );
    }

    if (!Get.isRegistered<CustomerAuthController>()) {
      await Get.put<CustomerAuthController>(
          CustomerAuthController(isWebVersion: true),
          permanent: true);
    }
    if (!Get.isRegistered<CustomerCartController>()) {
      await Get.put<CustomerCartController>(CustomerCartController(),
          permanent: true);
    }

    if (!Get.isRegistered<MessageWebController>()) {
      await Get.put<MessageWebController>(MessageWebController(),
          permanent: true);
    }
    // NotifListener.resume();
  }
}
