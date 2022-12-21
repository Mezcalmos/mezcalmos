import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/Shared/controllers/firbaseAuthController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';
import 'package:mezcalmos/WebApp/controllers/messageWebController.dart';
import 'package:mezcalmos/WebApp/webHelpers/webNotificationHelper.dart';

import '../Shared/helpers/NotificationsHelper.dart';

var NotifListener = initializeShowNotificationsListener(
  isWebVersion: true,
);

class AuthHooks {
  static Future<void> onSignOutHook() async {
    print("[+] WebApp::AuthHooks::onSignOutHook -> Callback Executed.");
    await Get.delete<CustomerAuthController>(force: true);
    await Get.delete<OrderController>(force: true);
    await Get.delete<RestaurantController>(force: true);
    await Get.delete<ForegroundNotificationsController>(force: true);
    NotifListener.cancel();
  }

  static Future<void> onSignInHook() async {
    print("[+] WebApp::AuthHooks::onSignInHook -> Callback Executed.");

    if (!Get.isRegistered<CustomerAuthController>()) {
      await Get.put<CustomerAuthController>(CustomerAuthController(),
          permanent: true);
    }
    if (!Get.isRegistered<RestaurantController>()) {
      await Get.put(RestaurantController(), permanent: true);
    }
    if (!Get.isRegistered<ForegroundNotificationsController>()) {
      await Get.put<ForegroundNotificationsController>(
          ForegroundNotificationsController(isWebVersion: true),
          permanent: true);
    }

    Get.find<ForegroundNotificationsController>()
        .startListeningForNotificationsFromFirebase(
            customerNotificationsNode(
                Get.find<FirbaseAuthController>().fireAuthUser!.uid),
            webNotificationHandler);
    if (!Get.isRegistered<OrderController>()) {
      await Get.put<OrderController>(OrderController(), permanent: true);
    }
    if (!Get.isRegistered<MessageWebController>()) {
      await Get.put<MessageWebController>(MessageWebController(),
          permanent: true);
    }
    NotifListener.resume();
  }
}
