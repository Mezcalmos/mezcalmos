import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mezcalmos/Shared/pages/AgoraCall.dart';
import 'package:mezcalmos/Shared/pages/AppNeedsUpdateScreen.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/NativeMessagingScreen.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

// Routes Keys.

// GetX based Router (For navigating)
class NativeOnlyRoutes {
  static const String kAgoraCallScreenRoute = '/agora';
  static const String kAppNeedsUpdateRoute = '/needs_update';
  static List<QRoute> routes = [
    QRoute(
      name: kAgoraCallScreenRoute,
      path: kAgoraCallScreenRoute,
      builder: () => AgoraCall(),
    ),
    QRoute(
      name: SharedRoutes.kMessagesRoute,
      path: SharedRoutes.kMessagesRoute,
      builder: () => NativeMessagingScreen(),
    ),
    QRoute(
      name: kAppNeedsUpdateRoute,
      path: kAppNeedsUpdateRoute,
      builder: () => AppNeedsUpdateScreen(),
    ),

    /*   GetPage(name: kAgoraCallScreen, page: () => AgoraCall()),
    GetPage(
      name: SharedRoutes.kMessagesRoute,
      page: () => NativeMessagingScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 500),
      // customTransition:
    ),
    GetPage(name: kAppNeedsUpdate, page: () => AppNeedsUpdateScreen()),*/
  ];
}