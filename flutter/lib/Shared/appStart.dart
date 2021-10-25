// WARNING : ===================

// DO NOT TOUCH OR IMPORT ANYTHING IN THIS MAIN PLEASE.

// =============================

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/pages/SplashScreen.dart';
import 'package:package_info/package_info.dart';
import 'package:get/route_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'dart:io';

class SPoint extends StatefulWidget {
  String appName;
  Function signInCallback;
  Function signOutCallback;
  List<GetPage<dynamic>> routes;
  SPoint(this.appName, this.signInCallback, this.signOutCallback, this.routes);

  @override
  _SPointState createState() => _SPointState();
}

class _SPointState extends State<SPoint> {
  bool _initialized = false;
  bool _error = false;

  _SPointState();

  Future<void> setupFirebase() async {
    const String _host =
        String.fromEnvironment('HOST', defaultValue: "http://127.0.0.1");
    const String _launchMode =
        String.fromEnvironment('LMODE', defaultValue: "prod");

    print('mode  -> $_launchMode');
    print('host  -> $_host');

    FirebaseApp _app = await Firebase.initializeApp();
    mezDbgPrint("[+] App Initialized under Name ${_app.name} .");
    late FirebaseDatabase firebaseDb;

    if (_launchMode == "prod") {
      firebaseDb = FirebaseDatabase(app: _app);
    } else if (_launchMode == "dev") {
      firebaseDb = FirebaseDatabase(app: _app, databaseURL: _host + dbRoot);
      await FirebaseAuth.instance.useEmulator(_host + authPort);
      FirebaseFunctions.instance
          .useFunctionsEmulator(origin: _host + functionPort);
    } else if (_launchMode == "stage") {
      mezDbgPrint("[+] Entered Staging check ----.");
      firebaseDb = FirebaseDatabase(app: _app, databaseURL: stagingDb);
    } else {
      throw Exception("Invalid Launch Mode");
    }

    Get.put(DatabaseHelper(
        dbUrl: _host + dbRoot,
        firebaseDatabase: firebaseDb,
        firebaseApp: _app));
  }

  Future<void> setGlobalVariables() async {
    const String _launchMode =
        String.fromEnvironment('LMODE', defaultValue: "prod");
    if (await GetStorage.init()) {
      mezDbgPrint("[ GET STORAGE ] INITIALIZED !");
      await GetStorage().write(getxLmodeKey, _launchMode);
      // Get the VersionNumber
      PackageInfo pInfos = await PackageInfo.fromPlatform();
      await GetStorage().write(version, pInfos.version);
      await GetStorage().write(getxGmapBottomPaddingKey,
          Platform.isAndroid ? 38.0 : Get.height / 20);
    } else
      mezDbgPrint("[ GET STORAGE ] FAILED TO INITIALIZE !");
  }

  void putControllers() {
    AuthController authController = Get.put<AuthController>(
        AuthController(widget.signInCallback, widget.signOutCallback),
        permanent: true);
    mezDbgPrint("Putting Auth Controller");
    Get.put<AppLifeCycleController>(AppLifeCycleController(logs: true),
        permanent: true);
    Get.put<SettingsController>(SettingsController(widget.appName),
        permanent: true);
  }

  Future<void> waitForInitialization() async {
    await Get.find<AuthController>().authStateChange.first;
    return;
  }

  void hookOnFlutterErrorsStdout() {
    FlutterError.onError = (FlutterErrorDetails details) {
      for (var item in details.toString().split('\n')) {
        mezDbgPrint(item);
      }
    };
  }

  void initializeSetup() async {
    try {
      await setupFirebase();
      await setGlobalVariables();
      putControllers();
      await waitForInitialization();
      hookOnFlutterErrorsStdout();
      setState(() => _initialized = true);
    } catch (e) {
      mezDbgPrint("[+] Error Happend =======> $e");
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    initializeSetup();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      mezcalmosSnackBar("Error", "Server connection failed !");
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Icon(Icons.signal_wifi_bad,
                color: Colors.red.shade200,
                size: getSizeRelativeToScreen(50, Get.height, Get.width)),
          ),
        ),
      );
    }
    if (!_initialized) {
      return SplashScreen();
    } else {
      return mainApp(widget.appName, widget.routes);
    }
  }
}

Widget mainApp(String appName, List<GetPage<dynamic>> routes) {
  Future<void> _initializeConfig() async {
    // We will use this to Initialize anything at MaterialApp root init of app
    BitmapDescriptor desc = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/images/purple_circle.png');

    await GetStorage().write('markerCircle', desc);
    print("[+] InitializedConfig -- the $appName !");
  }

  return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onInit: () async => await _initializeConfig(),
      title: appName,
      theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      color: Colors.white,
      getPages: routes,
      initialRoute: kWrapperRoute);
}
