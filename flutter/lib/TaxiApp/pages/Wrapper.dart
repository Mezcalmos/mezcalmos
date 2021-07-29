import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/TaxiWrapper.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
// import 'package:mezcalmos/TaxiApp/pages/CurrentOrderScreen.dart';
// import 'package:mezcalmos/TaxiApp/pages/UnauthorizedScreen.dart';

class Wrapper extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    // Locale userLocale = Localizations.localeOf(context);
    // print(userLocale.toString());
    // Get.find<LanguageController>().changeUserLanguage(userLocale.languageCode);
    return Obx(() {
      if (controller.user != null) {
        // Injecting TaxiAuthController Here so we can get it as Widget in TaxiWrapper
        return TaxiWrapper();
      } else
        return SignIn();
    });
  }
}
