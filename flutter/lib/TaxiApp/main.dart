import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/routes.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/helpers/appPreInit.dart';
import 'package:mezcalmos/TaxiApp/pages/Wrapper.dart';
import 'package:mezcalmos/TaxiApp/router.dart';

class TaxiApp extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    Future<void> _initializeConfig() async {
    }

    return GetMaterialApp(
      onInit: () async => await _initializeConfig(),
      onReady: () => mezDbgPrint("[++] MaterialApp -------> ready !"),
      debugShowCheckedModeBanner: false,
      title: 'mezcalmos',
      theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      color: Colors.white,
      getPages: XRouter.mainRoutes,
      enableLog: false,
      // logWriterCallback: mezcalmosLogger,
      initialRoute: kMainAuthWrapperRoute,
    );
  }
}
