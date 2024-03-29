import 'dart:math';

import 'package:flutter/foundation.dart' as fd;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/LanguagesTabsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/item/option/choice/hsChoice.dart';
import 'package:mezcalmos/Shared/graphql/translation/hsTranslation.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpChoiceView"];

class ROpChoiceViewController {
  LanguageTabsController languageTabsController = LanguageTabsController();
  // vars //
  late int restaurantId;
  late int detailsId;
  int? optionId;

  // form//
  bool firstTabValid = false;
  bool secondTabValid = false;
  Rxn<Choice> choice = Rxn();
  RxBool editMode = RxBool(false);
  RxBool isAv = RxBool(false);
  RxBool needToFetch = RxBool(false);
  RxBool _hasData = RxBool(false);

  // text inputs //
  TextEditingController prChoiceName = TextEditingController();
  TextEditingController scChoiceName = TextEditingController();
  TextEditingController choicePriceText = TextEditingController();

  // getters //
  cModels.ServiceProviderLanguage? get languages =>
      languageTabsController.language;
  bool get hasSecondaryLang => languages?.secondary != null;
  bool get hasData =>
      _hasData.value && languageTabsController.tabController != null;

  // init //
  Future<void> init(
      {required int? choiceId,
      required int optionId,
      required int detailsId,
      required TickerProvider vsync,
      required int restaurantId}) async {
    this.optionId = optionId;
    this.restaurantId = restaurantId;
    this.detailsId = detailsId;
    await languageTabsController.init(vsync: vsync, detailsId: detailsId);

    if (choiceId != null) {
      await _initEditMode(choiceId);
    }
    _hasData.value = true;
  }

  // dispose //
  void dispose() {
    languageTabsController.dispose();
  }

  /// construct a choice instance from the view inputs
  ///
  /// on edit mode it will maintain the same id of the edited choice
  ///
  /// if the edit mode is false it will generate a random id
  Choice _contructChoice() {
    final LanguageMap name = {languages!.primary: prChoiceName.text};
    if (languages?.secondary != null && scChoiceName.text.isNotEmpty) {
      name[languages!.secondary!] = scChoiceName.text;
    }
    return Choice(
      id: editMode.isTrue ? choice.value!.id : Random().nextInt(5),
      name: name,
      cost: num.tryParse(choicePriceText.text) ?? 0,
      available: isAv.value,
    );
  }

  /// init edit mode for existant choice
  ///
  /// gets the choice from db based on id and assign to an observable variable
  Future<void> _initEditMode(int choiceId) async {
    choice.value = await get_choice_by_id(choiceId);
    if (choice.value != null) {
      editMode.value = true;
      isAv.value = choice.value!.available;
      prChoiceName.text = choice.value!.name[languages!.primary]!;
      scChoiceName.text = choice.value!.name[languages!.secondary] ?? "";
      choicePriceText.text = choice.value!.cost.toString();
    }
  }

  /// switch the item availability
  ///choice.available is getting changed (only state change)
  void switchChoiceAv(bool value) {
    isAv.value = value;
  }

  Future<void> saveChoice() async {
    if (languageTabsController.validate()) {
      if (editMode.isTrue && choice.value != null) {
        await _editChoice();
      } else {
        await _addNewChoice();
      }
    }
  }

  Future<void> _editChoice() async {
    if (fd.mapEquals(_contructChoice().name, choice.value!.name) == false) {
      _contructChoice()
          .name
          .forEach((cModels.Language key, String value) async {
        await update_translation(
            langType: key, value: value, translationId: choice.value!.nameId!);
      });
    }
    final bool response = await update_choice_by_id(
        choiceId: choice.value!.id, choice: _contructChoice());
    if (response) {
      customSnackBar(
          title: _i18n()['saved'],
          subTitle: _i18n()['savedText'],
          backgroundColor: Colors.black,
          textColor: Colors.white,
          icon: Icon(
            Icons.check_circle,
            color: Colors.green,
          ));
      needToFetch.value = true;
    }
  }

  Future<void> _addNewChoice() async {
    final int? newChoiceId = await add_choice(
        choice: _contructChoice(),
        optionId: optionId!,
        restaurantId: restaurantId);
    if (newChoiceId != null) {
      customSnackBar(
        title: _i18n()['added'],
        subTitle: _i18n()['addedText'],
        backgroundColor: Colors.black,
        textColor: Colors.white,
        icon: Icon(
          Icons.check_circle,
          color: primaryBlueColor,
        ),
      );
      choice.value = await get_choice_by_id(newChoiceId);
      if (choice.value != null) {
        editMode.value = true;
        needToFetch.value = true;
      }
    }
  }

  Future<bool?> deleteChoice() async {
    final bool result = await delete_choice_by_id(choiceId: choice.value!.id);
    await result ? MezRouter.back() : null;
    return result;
  }

  bool get isFirstValid {
    return prChoiceName.text.removeAllWhitespace.isNotEmpty;
  }

  bool get isSecondValid {
    return scChoiceName.text.removeAllWhitespace.isNotEmpty;
  }
}
