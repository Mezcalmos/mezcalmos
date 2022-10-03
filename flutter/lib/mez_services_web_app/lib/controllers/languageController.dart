import 'dart:convert';
//import 'dart:io' show Platform;

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mez_services_web_app/models/Generic.dart';
import 'package:mez_services_web_app/services/values/constants.dart';

// import 'package:mezcalmos/Shared/controllers/authController.dart';

class LanguageController extends GetxController {
  // default is english
  RxBool isLamgInitialized = false.obs;
  Rx<LanguageType> _userLanguageKey = sDefaultLanguage.obs;

  // jsonStrings will have:
  // {en : {}, es : {}}  <- so we avoid loading up each one onchanging lang
  dynamic _jsonStrings = {}
      .obs; // language Object by default  must be set to en if no lang given  in constructor.

  LanguageController() {
    final LanguageType? lang =
        Get.deviceLocale?.languageCode.substring(0, 2).toLanguageType();

    // mezDbgPrint("\n\n\n\n\nUSER LANGUAGE [[ $lang ]]\n\n\n\n\n");
    if (lang == LanguageType.EN)
      _userLanguageKey.value = LanguageType
          .EN; // to avoid diffrent other languages diffrent than en and es
  }

  Map<LanguageType, dynamic> languageDetails = {
    LanguageType.EN: {"fullName": "English", "langImage": "none"},
    LanguageType.ES: {"fullName": "Español", "langImage": "none"}
  };
  LanguageType get userLanguageKey => _userLanguageKey.value;
  String get langFullName =>
      languageDetails[_userLanguageKey.value]['fullName'];
  String get langImage => languageDetails[_userLanguageKey.value]['langImage'];
  dynamic get strings =>
      _jsonStrings[_userLanguageKey.value.toFirebaseFormatString()];

  /// fileLocation: customerApp/notificationHandler
  dynamic getLMap(String fileLocation) {
    try {
      dynamic map =
          _jsonStrings[_userLanguageKey.value.toFirebaseFormatString()];
      fileLocation.split('/').forEach((element) {
        map = map[element];
      });
      return map;
    } on Exception catch (e) {
      // TODO
    }
  }

  LanguageType get oppositLangKey => _userLanguageKey.value == LanguageType.EN
      ? LanguageType.ES
      : LanguageType.EN;
  String get oppositToLang =>
      _userLanguageKey.value == LanguageType.EN ? "A Español" : "To English";
  // String get oppositFlag => _userLanguageKey.value == LanguageType.EN
  //     ? mexicoFlagAsset
  //     : usaFlagAsset;

  // void changeUserLanguage([LanguageType? language]) {
  //   if (language == null) {
  //     if (Get.find<AuthController>().user?.language == LanguageType.ES) {
  //       language = LanguageType.EN;
  //     } else {
  //       language = LanguageType.ES;
  //     }
  //     if (Get.find<AuthController>().user != null) {
  //       // we need that because in case user clicked change lang from SideMenu , we really don't
  //       // need to execute that one because there is no user SIgnedIn yet!
  //       // we have to make some kind of queue that will handle stuff once the user SignedIn.
  //       Get.find<AuthController>().changeLanguage(language);
  //     } else {
  //       // welse so we can still update the user language locally but not in db!
  //       _userLanguageKey.value = oppositLangKey;
  //     }
  //   } else if (Get.find<AuthController>().user == null) {
  //     _userLanguageKey.value = language;
  //   }
  // }

  ///this function [changeLangForWeb] used only for web
  void changeLangForWeb(LanguageType? language) {
    _userLanguageKey.value = language ?? LanguageType.EN;
    print("just changed this lang to ${_userLanguageKey.value}");
  }

  void setLanguage(LanguageType language) {
    _userLanguageKey.value = language;
  }

  @override
  void onInit() {
    super.onInit();
    Future<dynamic>.microtask(() async {
      String enJson = await rootBundle.loadString(enLang);
      String esJson = await rootBundle.loadString(esLang);
      _jsonStrings = <String, dynamic>{
        "en": jsonDecode(enJson) as Map<String, dynamic>,
        "es": jsonDecode(esJson) as Map<String, dynamic>
      };
    }).then((_) {
      isLamgInitialized.value = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}