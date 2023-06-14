import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';

class LanguageTabsController {
  late int serviceDetailsId;
  // LanguageTabsController({});

  ServiceProviderLanguage? _language;
  Rxn<TabController> _tabController = Rxn();

  Language? get primaryLang => _language?.primary;
  Language? get secondaryLang => _language?.secondary;
  GlobalKey<FormState> primaryLangFormKey = GlobalKey<FormState>();
  GlobalKey<FormState>? secondaryLangFormKey;
  // getters //
  ServiceProviderLanguage? get language => _language;
  TabController? get tabController => _tabController.value;
  bool get hasSecondaryLang => _language?.secondary != null;
  bool get isOnFirstTab => tabController?.index == 0;

  bool get isOnSecondTab => tabController?.index == 1;

  // vars //
  bool firstFormValid = false;
  bool secondFormValid = false;
  late Language _oldUserLanguage;
  // methods //
  Future<void> init(
      {required TickerProvider vsync,
      int? detailsId,
      ServiceProviderLanguage? language}) async {
    assert((detailsId ?? language) != null,
        'Either Details id or language must be not null.');
    _oldUserLanguage = userLanguage;
    serviceDetailsId = detailsId ?? 0;
    _language = language ?? await get_service_lang(detailsId: serviceDetailsId);
    if (_language != null) {
      await Get.find<LanguageController>().changeUserLanguage(
        language: _language!.primary,
        saveToDatabase: false,
      );
      _tabController.value = TabController(length: _length, vsync: vsync);
      _tabController.refresh();
      secondaryLangFormKey =
          (_language!.secondary != null) ? GlobalKey<FormState>() : null;
    } else
      throw StateError("🔴🔴🔴 Language is null🔴🔴🔴");
  }
  // forms validation methods //

  bool validate() {
    if (hasSecondaryLang)
      return _validateTwoTabs();
    else
      return primaryLangFormKey.currentState?.validate() == true;
  }

  bool _validateTwoTabs() {
    if (isOnFirstTab) {
      // validate first tab
      firstFormValid = _isFirstFormValid;
      if (firstFormValid && !secondFormValid) {
        tabController?.animateTo(1);
      }
    }
    // second tab
    else {
      secondFormValid = _isSecondFormValid;
      if (secondFormValid && !firstFormValid) {
        tabController?.animateTo(0);
      }
    }
    if (secondFormValid && firstFormValid) {
      tabController?.animateTo(0);
    }
    return secondFormValid && firstFormValid;
  }

  bool get _isFirstFormValid {
    return primaryLangFormKey.currentState?.validate() == true;
  }

  bool get _isSecondFormValid {
    return secondaryLangFormKey?.currentState?.validate() == true;
  }

  bool get isBothFormValid {
    return _isFirstFormValid && _isSecondFormValid;
  }

  int get _length {
    int length = 1;
    if (_language != null && _language?.secondary != null) {
      length += 1;
    }
    return length;
  }

  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(Get.find<LanguageController>().changeUserLanguage(
        language: _oldUserLanguage,
        saveToDatabase: false,
      ));
    });
    tabController?.dispose();
  }
}
