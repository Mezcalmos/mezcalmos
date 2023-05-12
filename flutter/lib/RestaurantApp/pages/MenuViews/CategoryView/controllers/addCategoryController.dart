import 'package:flutter/foundation.dart' as fd;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/category/hsCategory.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/graphql/translation/hsTranslation.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Category.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class AddCategoryController {
  /// Text input controllers ///
  final TextEditingController primaryCategoryNameController =
      TextEditingController();
  final TextEditingController primaryCatDesc = TextEditingController();
  final TextEditingController secondaryCatDesc = TextEditingController();

  final TextEditingController secondaryCategoryNameController =
      TextEditingController();

  /// Controllers ///
  TabController? tabController;

  /// Variables ///
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  late int restaurantId;
  Rxn<Category> category = Rxn<Category>();

  Rxn<LanguageType> primaryLang = Rxn();

  Rxn<LanguageType> secondaryLang = Rxn();

  RxList<LaundryCostLineItem> categories = <LaundryCostLineItem>[].obs;
  RxBool editMode = RxBool(false);
  String? editableCategoryId;

  bool get isLoading {
    if (editMode.value) {
      return category.value != null;
    } else
      return primaryLang.value != null && secondaryLang.value != null;
  }

  bool refetch = false;

  /// LOGIC ///

  // INIT STATE ///
  Future<void> init({required String restaurantId, String? categoryId}) async {
    this.restaurantId = int.parse(restaurantId);
    mezDbgPrint("INIT CATEGORY VIEW ========================>$categoryId");
    this.restaurantId = int.parse(restaurantId);

    await initLanguages();

    if (categoryId != null && int.tryParse(categoryId) != null) {
      await initEditMode(categoryId);
    }
  }

  Future<void> initLanguages() async {
    primaryLang.value = await get_restaurant_priamry_lang(restaurantId);
    secondaryLang.value = primaryLang.value!.toOpLang();
  }

  Future<void> initEditMode(String categoryId) async {
    editMode.value = true;
    editableCategoryId = categoryId;

    category.value = await get_category_by_id(
        categoryId: int.parse(categoryId), withCache: false);
    if (category.value != null) {
      primaryCategoryNameController.text = category.value!.name![primaryLang]!;
      secondaryCategoryNameController.text =
          category.value!.name![secondaryLang]!;
      primaryCatDesc.text = category.value!.dialog?[primaryLang] ?? "";
      secondaryCatDesc.text = category.value!.dialog?[secondaryLang] ?? "";
    }
  }

  Category constructCategory() {
    final Category newCategory = Category(
      name: _contructName(),
      dialog: _contructDescription(),
    );
    return newCategory;
  }

  Future<bool> saveCategory() async {
    if (editMode.value == true) {
      try {
        await _updateName();
        await _updateDescription();
        refetch = true;
        return true;
      } on Exception catch (e, stk) {
        mezDbgPrint(e);
        mezDbgPrint(stk);
        return false;
      }
      // await restaurantInfoController.editCategory(
      //     category: constructCategory(), categoryId: editableCategoryId!);
    } else {
      try {
        final String? newCatId = await add_category(
            category: constructCategory(), restaurantId: restaurantId);
        refetch = true;
        return true;
      } on Exception catch (e, stk) {
        mezDbgPrint(e);
        mezDbgPrint(stk);
        return false;
      }

      // await restaurantInfoController.addCategory(
      //   category: constructCategory(),
      // );
    }
  }

  Future<void> _updateName() async {
    if (!fd.mapEquals(_contructName(), category.value!.name)) {
      mezDbgPrint("Name changed ✅");

      await Future.forEach(_contructName().entries,
          (MapEntry<LanguageType, String> element) async {
        await update_translation(
            langType: element.key,
            translationId: category.value!.descriptionId!,
            value: element.value);
      });
    }
  }

  Future<void> _updateDescription() async {
    if (!fd.mapEquals(_contructDescription(), category.value!.dialog)) {
      await Future.forEach(_contructDescription()!.entries,
          (MapEntry<LanguageType, String> element) async {
        await update_translation(
            langType: element.key,
            translationId: category.value!.descriptionId!,
            value: element.value);
      });
    }
  }

  Map<LanguageType, String> _contructName() {
    final Map<LanguageType, String> name = {
      primaryLang.value!: primaryCategoryNameController.text,
      secondaryLang.value!: secondaryCategoryNameController.text,
    };
    return name;
  }

  Map<LanguageType, String>? _contructDescription() {
    final Map<LanguageType, String>? desc = {
      primaryLang.value!: primaryCatDesc.text,
      secondaryLang.value!: secondaryCatDesc.text,
    };
    return desc;
  }

  List<String> getCatNames(LanguageType languageType) {
    final List<String> data = [];
    // restaurant.value!.getCategories.forEach((Category element) {
    //   if (element.name?[languageType] != null) {
    //     data.add(element.name![languageType]!.toLowerCase());
    //   }
    // });

    return data;
  }
}
