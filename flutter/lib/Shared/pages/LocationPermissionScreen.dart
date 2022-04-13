import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:permission_handler/permission_handler.dart'
    show openAppSettings;

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ['LocationPermissionScreen'];

class LocationPermissionScreen extends StatelessWidget {
  final LocationController _locationController = Get.find<LocationController>();
  final bool? bgLocatinAccess = Get.arguments?['withBackground'];
  final SideMenuDrawerController _sideMenuDraweController =
      Get.find<SideMenuDrawerController>();

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("[544D] WithBackgroundLocation => $bgLocatinAccess");
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: mezcalmosAppBar(AppBarLeftButtonType.Menu),
          resizeToAvoidBottomInset: false,
          key: _sideMenuDraweController.getNewKey(),
          drawer: MezSideMenu(),
          backgroundColor: Colors.white,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: Get.height,
            width: Get.width,
            child: Center(
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height:
                          getSizeRelativeToScreen(100, Get.height, Get.width),
                      width:
                          getSizeRelativeToScreen(100, Get.height, Get.width),
                      decoration: BoxDecoration(
                          // color: Colors.grey,
                          image: DecorationImage(
                              image: AssetImage(aLocationPermissionAsset))),
                    ),
                  ),
                  Obx(
                    () => Text(
                      _i18n()['locationIsOff'],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26, fontFamily: 'psr'),
                    ),
                  ),
                  SizedBox(
                    height: getSizeRelativeToScreen(10, Get.height, Get.width),
                  ),
                  Obx(
                    () => Text(
                      // "App can not work without Background Location Permission !",
                      _i18n()['askForNotif'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'psb',
                          color: Colors.grey.shade400),
                    ),
                  ),
                  SizedBox(
                    height: getSizeRelativeToScreen(25, Get.height, Get.width),
                  ),
                  GestureDetector(
                    onTap: () async => onGivePermissionBtnClick(context),
                    child: Container(
                      height:
                          getSizeRelativeToScreen(25, Get.height, Get.width),
                      width:
                          getSizeRelativeToScreen(100, Get.height, Get.width),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: <Color>[
                            Color.fromARGB(255, 97, 127, 255),
                            Color.fromARGB(255, 198, 90, 252),
                          ]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                offset: Offset(0, 2),
                                blurRadius: 5,
                                color: Colors.blue.shade100,
                                spreadRadius: 1),
                          ]),
                      child: Center(
                          child: Obx(
                        () => Text(
                          _i18n()['permissionBtn'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'psb',
                              fontSize: 10,
                              letterSpacing: 1),
                        ),
                      )),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  Future<void> onGivePermissionBtnClick(BuildContext context) async {
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidDeviceInfo =
          await DeviceInfoPlugin().androidInfo;
      final int? sdkVersion = androidDeviceInfo.version.sdkInt;
      if (sdkVersion != null && sdkVersion >= 30) {
        final YesNoDialogButton res = await yesNoDialog(
          body: _i18n()['isAndroid_11'],
          bodyTextStyle: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
          text: "",
          buttonLeftStyle: YesButtonStyle.customized(
            customMezDialogButtonStyle: MezDialogButtonStyle.customized(
                customButtonDecoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.purple.shade600,
                      Colors.deepPurple.shade600
                    ]),
                    borderRadius: BorderRadius.circular(12)),
                customTextStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                buttonText: YesButtonStyle.yesText),
          ),
          buttonRightStyle: NoButtonStyle.customized(
            customMezDialogButtonStyle: MezDialogButtonStyle.customized(
                customButtonDecoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.red.shade400,
                      Colors.deepOrange.shade300
                    ]),
                    borderRadius: BorderRadius.circular(12)),
                customTextStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                buttonText: NoButtonStyle.noText),
          ),
        );

        if (res == YesNoDialogButton.Yes) {
          final bool didOpen = await openAppSettings();
          if (!didOpen) {
            return;
          }
        } else
          return;
      }
    }
    final Location location = Location();
    final bool _serviceEnabled = await location.requestService();
    // if Location Service is enabled!
    if (_serviceEnabled) {
      final PermissionStatus _permissionStatus =
          await _locationController.requestLocationPermissions();
      mezDbgPrint(_permissionStatus);
      switch (_permissionStatus) {
        // on denied forever User must know cuz it needs manual change in IOS!!
        case PermissionStatus.deniedForever:
          MezSnackbar('Error :(', _i18n()['locationPermissionDeniedForever'],
              position: SnackPosition.TOP, duration: Duration(seconds: 2));
          // ignore_file_for : always_specify_types
          Future<bool>.delayed(Duration(seconds: 3), openAppSettings);
          break;

        // on granted !
        case PermissionStatus.granted:
          if (bgLocatinAccess == true) {
            final bool isBgOn = await Location().isBackgroundModeEnabled();
            mezDbgPrint("[544D] isBgOn => $isBgOn");

            if (!isBgOn) {
              try {
                await Location().enableBackgroundMode();
              } catch (e) {
                mezDbgPrint("[OOPS] => BG LOCATION => $e");
                await oneButtonDialog(
                  body:
                      "Please Allow Background Location.\nClick Ok to open Settings.",
                );
                await openAppSettings();
                break;
              }
            }
          }
          Get.back<void>(closeOverlays: true);
          break;
        case PermissionStatus.grantedLimited:
          if (bgLocatinAccess == true) {
            final bool isBgOn = await Location().isBackgroundModeEnabled();
            mezDbgPrint("[544D] isBgOn => $isBgOn");

            if (!isBgOn) {
              try {
                await Location().enableBackgroundMode();
              } catch (e) {
                mezDbgPrint("[OOPS] => BG LOCATION => $e");
                await oneButtonDialog(
                  body:
                      "Please Allow Background Location.\nClick Ok to open Settings.",
                );
                await openAppSettings();
                break;
              }
            }
          }
          Get.back<void>(closeOverlays: true);
          break;
        // Default
        default:
          MezSnackbar('Error :(', _i18n()['locationPermissionDenied'],
              position: SnackPosition.TOP);
      }
    } else {
      MezSnackbar('Error :(', _i18n()['locationIsOff'],
          position: SnackPosition.TOP);
    }
  }
}
