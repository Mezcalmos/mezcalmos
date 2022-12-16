import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/laundry/LaundryController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/firbaseAuthController.dart';

import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NotificationsHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/WebApp/authHooks.dart';
import 'package:mezcalmos/WebApp/controllers/mezWebSideBarController.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/resturentListView/controller/ListRestaurantController.dart';

Function signInCallback = AuthHooks.onSignInHook;
Function signOutCallback = AuthHooks.onSignOutHook;

Future<bool> putControllers() async {
  Completer<List<bool>> x = Completer<List<bool>>();
  List<bool> areAllIntilized = [];

  if (!Get.isRegistered<LanguageController>()) {
    await Get.put<LanguageController>(LanguageController())
        .isLamgInitialized
        .stream
        .first
        .then((value) {
      mezDbgPrint("]]]]]]]]]] the langController is intailized ]]]]]]]]]]]]");

      areAllIntilized.add(value);
    });
  }

  if (!Get.isRegistered<FirbaseAuthController>()) {
    await Get.put<FirbaseAuthController>(
      FirbaseAuthController(signInCallback, signOutCallback),
      permanent: true,
    );
    mezDbgPrint("]]]]]]]]]] the authController is intailized ]]]]]]]]]]]]");
    areAllIntilized.add(true);
  }
  if (!Get.isRegistered<RestaurantController>()) {
    await Get.put(RestaurantController(), permanent: true);
    mezDbgPrint(
        "]]]]]]]]]] the RestaurantController is intailized ]]]]]]]]]]]]");
    areAllIntilized.add(true);
  }

  if (!Get.isRegistered<RestaurantsInfoController>()) {
    await Get.put<RestaurantsInfoController>(
      RestaurantsInfoController(),
      permanent: true,
    );
    mezDbgPrint(
        "]]]]]]]]]] the RestaurantsInfoController is intailized ]]]]]]]]]]]]");
    areAllIntilized.add(true);
  }
  if (!Get.isRegistered<AppLifeCycleController>()) {
    await Get.put<AppLifeCycleController>(
      AppLifeCycleController(logs: true),
      permanent: true,
    );
    mezDbgPrint(
        "]]]]]]]]]] the AppLifeCycleController is intailized ]]]]]]]]]]]]");
    areAllIntilized.add(true);
  }
  if (!Get.isRegistered<LaundryController>()) {
    await Get.put<LaundryController>(
      LaundryController(),
      permanent: true,
    );
    mezDbgPrint("]]]]]]]]]] the LaundryController is intailized ]]]]]]]]]]]]");
    areAllIntilized.add(true);
  }

  if (!Get.isRegistered<MezWebSideBarController>()) {
    await Get.put<MezWebSideBarController>(
      MezWebSideBarController(),
      permanent: true,
    );
    mezDbgPrint(
        "]]]]]]]]]] the MezWebSideBarController is intailized ]]]]]]]]]]]]");
    areAllIntilized.add(true);
  }
  if (Get.find<FirbaseAuthController>().isUserSignedIn) {
    await AuthHooks.onSignInHook().then((value) {
      mezDbgPrint(
          "]]]]]]]]]] the MezWebSideBarController is intailized ]]]]]]]]]]]]");
      areAllIntilized.add(true);
    });
  }
  if (!Get.isRegistered<ListRestaurantsController>()) {
    await Get.put<ListRestaurantsController>(
      ListRestaurantsController(),
    );
    areAllIntilized.add(true);
  }

  x.complete(areAllIntilized);
  var isItailized = false;
  await x.future.then((values) {
    isItailized = !values.contains(false);
    mezDbgPrint(
        "]]]]]]]]]] inside the setup function ${isItailized} ]]]]]]]]]]]]");
  });
  return Future<bool>.delayed(Duration(seconds: 3)).then((value) async {
    return isItailized;
  });
}

Future<bool> setupFirebase(
    {required AppLaunchMode launchMode, Function? func}) async {
  const String _host =
      String.fromEnvironment('HOST', defaultValue: "http://127.0.0.1");
  // final AppLaunchMode _launchMode =
  //     String.fromEnvironment('LMODE', defaultValue: "prod").toLaunchMode();
  print('mode  -> $launchMode');

  late FirebaseApp _app;

  late FirebaseDatabase firebaseDb;
  if (!Get.isRegistered<FirebaseDb>()) {
    if (launchMode == AppLaunchMode.prod) {
      _app = await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: "AIzaSyB9vaAB9ptXhpeRs_JjxODEyuA_eO0tYu0",
          appId: "1:804036698204:web:39b22436cbb4ef633f8699",
          messagingSenderId: "804036698204",
          projectId: "mezcalmos-31f1c",
        ),
      );
      firebaseDb = FirebaseDatabase.instanceFor(
          app: _app,
          databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com");
    } else if (launchMode == AppLaunchMode.dev) {
      print("DEV MODE");
      _app = await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: "AIzaSyAKu4WzLR4iZPk4qnEgYdVh1SWqnRXbS-M",
          appId: "1:606383265109:web:a2050a8335ee6e37d8cbdc",
          messagingSenderId: "606383265109",
          projectId: "mezcalmos-85ff1",
        ),
      );
      firebaseDb =
          FirebaseDatabase.instanceFor(app: _app, databaseURL: _host + dbRoot);
      firebaseDb.setPersistenceEnabled(true);
      firebaseDb.setPersistenceCacheSizeBytes(10000000);
      // await FirebaseAuth.instance.useEmulator(_host + authPort);
      // FirebaseFunctions.instance
      //     .useFunctionsEmulator(_host.replaceAll('http://', ''), functionPort);
    } else if (launchMode == AppLaunchMode.stage) {
      print("[+] Entered Staging check ----.");
      _app = await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: "AIzaSyBRQTIUx_-oMdp5_S5e9F8h4Uc4ViZKM4U",
          appId: "1:606383265109:web:a2050a8335ee6e37d8cbdc",
          messagingSenderId: "606383265109",
          projectId: "mezcalmos-staging",
        ),
      );
      firebaseDb =
          FirebaseDatabase.instanceFor(app: _app, databaseURL: stagingDb);
    } else {
      throw Exception("Invalid Launch Mode");
    }

    await Get.put(
        FirebaseDb(
          dbUrl: _host + dbRoot,
          firebaseDatabase: firebaseDb,
          firebaseApp: _app,
        ),
        permanent: true);
  }
  //func?.call();
  //final bool isItailized =
  return await putControllers().then((value) {
    return value;
  });
  // return isItailized;
}
