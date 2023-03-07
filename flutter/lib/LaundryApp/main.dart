import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mezcalmos/LaundryApp/authHooks.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/LaundryApp/theme.dart';
import 'package:mezcalmos/Shared/appStart/appStartBase.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:sizer/sizer.dart';

Function signInCallback = AuthHooks.onSignInHook;
Function signOutCallback = AuthHooks.onSignOutHook;
List<GetPage<dynamic>> routes = LaundryAppRoutes.mainRoutes;

void main() {
  runMainGuarded(
    () => runApp(
      Sizer(
        builder: (_, __, ___) {
          return StartingPointBase(
            appType: AppType.LaundryApp,
            signInCallback: signInCallback,
            appTheme: LaundryAppTheme.lightTheme,
            signOutCallback: signOutCallback,
            routes: routes,
            locationPermissionType: LocationPermissionType.Foreground,
          );
        },
      ),
    ),
  );
}
