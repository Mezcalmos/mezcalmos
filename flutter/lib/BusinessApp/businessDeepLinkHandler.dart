import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/UnauthrizedOpView/UnauthrizedOpView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotifications/nativeBackgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class BusinessOpDeepLinkHandler {
  static Future<void> handleDeeplink(Uri deepLink) async {
    final List<String> frags = deepLink.path.split("/");
    if (frags.length == 4 && frags[1] == "op") await _addOperator(frags[2]);
  }

  static Future<void> _addOperator(String uniqueId) async {
    try {
      String? token =
          await Get.find<NativeBackgroundNotificationsController>().getToken();
      await CloudFunctions.serviceProvider_addOperator(
          uniqueId: uniqueId, notificationToken: token);
      // ignore: unawaited_futures
      ROpUnauthorizedOpView.navigate();
    } catch (e, stk) {
      mezDbgPrint("Errrooooooooor =======> $e,$stk");
    }
  }
}
