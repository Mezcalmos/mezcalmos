import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/pages/LocationPermissionScreen.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/helpers/authHooks.dart';
import 'package:mezcalmos/TaxiApp/pages/TaxiWrapper.dart';
// import 'package:mezcalmos/TaxiApp/pages/CurrentOrderScreen.dart';
// import 'package:mezcalmos/TaxiApp/pages/UnauthorizedScreen.dart';

class Wrapper extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    SettingsController _settingsController = Get.find<SettingsController>();
    return Obx(() {
      if (controller.user != null) {
        return _settingsController.hasLocationPermissions.value == false
            ? LocationPermissionScreen()
            : TaxiWrapper();
      } else
        return SignIn();
    });
  }
}
