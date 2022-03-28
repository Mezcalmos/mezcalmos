import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/appStart.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/TaxiApp/authHooks.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/router.dart';
import 'package:mezcalmos/TaxiApp/theme.dart';
import 'package:sizer/sizer.dart';

Function signInCallback = AuthHooks.onSignInHook;
Function signOutCallback = AuthHooks.onSignOutHook;
List<GetPage<dynamic>> routes = XRouter.mainRoutes;

void main() {
  loadBitmaps();
  runMainGuarded(
      () => runApp(Sizer(builder: (context, orientation, deviceType) {
            return StartingPoint(
                appType: AppType.TaxiApp,
                signInCallback: signInCallback,
                appTheme: TaxiAppTheme.lightTheme,
                signOutCallback: signOutCallback,
                routes: routes);
          })));
}

void loadBitmaps() async {
  mezDbgPrint("[+] L O A D I N G .... BITMAP_DESCRIPTORS !");
  if (await GetStorage.init()) {
    await GetStorage().write(getxTaxiDescriptor,
        await bitmapDescriptorLoader(taxi_driver_marker_asset, 60, 60));

    await GetStorage().write(getxDestinationDescriptor,
        await bitmapDescriptorLoader(purple_destination_marker_asset, 60, 60));
  }
}
