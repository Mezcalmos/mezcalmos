import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/components/ItemCategorySelector.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/components/ROpItemAvChips.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/components/ROpItemImage.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/components/ROpSpecialItemTime.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/components/RopItemOptionCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/controllers/ItemViewController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpItemView"];

//
class ROpItemView extends StatefulWidget {
  const ROpItemView({Key? key}) : super(key: key);

  @override
  _ROpItemViewState createState() => _ROpItemViewState();
}

class _ROpItemViewState extends State<ROpItemView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? restuarantID;
  String? itemId;
  String? categoryId;
  bool? specials;
  ROpItemViewController viewController = ROpItemViewController();
  final GlobalKey<FormState> _prformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _scformKey = GlobalKey<FormState>();

  @override
  void initState() {
    itemId = Get.parameters["itemId"];
    categoryId = Get.parameters["categoryId"];
    restuarantID = Get.parameters["restaurantId"];
    mezDbgPrint("Restuarnt id in item view ============> $restuarantID");
    if (restuarantID != null) {
      specials = Get.arguments?["specials"] ?? false;

      _tabController = TabController(length: 2, vsync: this);
      viewController.init(
          itemId: itemId,
          categoryId: categoryId,
          specials: specials,
          restaurantId: restuarantID!);
    } else
      MezRouter.back();

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    viewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (viewController.isInitalized.isTrue) {
          return Scaffold(
            appBar: _appBar(),
            bottomNavigationBar: _saveBtn(),
            body: Obx(
              () {
                if (viewController.isInitalized.isTrue) {
                  return TabBarView(
                    controller: _tabController,
                    children: [
                      _primaryTab(),
                      _secondaryTab(),
                    ],
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          );
        } else {
          return Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: MezLogoAnimation(centered: true),
          );
        }
      },
    );
  }

  Widget _saveBtn() {
    return Obx(
      () => MezButton(
        height: 65,
        withGradient: true,
        borderRadius: 0,
        label: (viewController.editMode.isTrue)
            ? '${_i18n()["saveItem"]}'
            : '${_i18n()["addItem"]}',
        onClick: () async {
          await _handleSaveBtn();
        },
      ),
    );
  }

  AppBar _appBar() {
    return mezcalmosAppBar(AppBarLeftButtonType.Back, onClick: () {
      MezRouter.back(result: viewController.needToRefetch.value);
    },
        title: '${_i18n()["item"]}',
        showNotifications: true,
        tabBar: TabBar(controller: _tabController, tabs: [
          Tab(
            child: Obx(
                () => Text("${viewController.prLang.value.toLanguageName()}")),
          ),
          Tab(
            child: Obx(
                () => Text("${viewController.scLang.value.toLanguageName()}")),
          ),
        ]));
  }

  Widget _secondaryTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Form(
        key: _scformKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            Text(
              '${_i18n()["itemName"]}',
              style: Get.textTheme.bodyText1,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: Get.textTheme.bodyText1,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: viewController.scItemNameController,
              validator: (String? value) {
                // TODO validations
                // if (value == null || value.isEmpty) {
                //   return '${_i18n()["required"]}';
                // } else if (viewController
                //     .getItemsNames(viewController.scLang.value)
                //     .contains(value.replaceAll(" ", "").toLowerCase())) {
                //   return '${_i18n()["nameExist"]}';
                // }
                return null;
              },
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              '${_i18n()["itemDesc"]}',
              style: Get.textTheme.bodyText1,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: Get.textTheme.bodyText1,
              minLines: 4,
              maxLines: 6,
              controller: viewController.scItemDescController,
            ),
          ],
        ),
      ),
    );
  }

  Widget _primaryTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: _prformKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ROpItemImage(
              viewController: viewController,
            ),
            if (viewController.editMode.isTrue)
              ROpItemAvChips(
                viewController: viewController,
              ),
            const SizedBox(
              height: 35,
            ),
            if (viewController.specialMode.isTrue)
              ROpSpecialItemTime(viewController: viewController),
            Text(
              '${_i18n()["itemName"]}',
              style: Get.textTheme.bodyText1,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: Get.textTheme.bodyText1,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: viewController.prItemNameController,
              validator: (String? value) {
                // TODO validations
                // if (value == null || value.isEmpty) {
                //   return '${_i18n()["required"]}';
                // } else if (viewController
                //     .getItemsNames(viewController.prLang.value)
                //     .contains(value.replaceAll(" ", "").toLowerCase())) {
                //   return '${_i18n()["nameExist"]}';
                // }
                return null;
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              '${_i18n()["itemPrice"]}',
              style: Get.textTheme.bodyText1,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: viewController.itemPriceController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return '${_i18n()["required"]}';
                }
                return null;
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
              ],
              textAlignVertical: TextAlignVertical.center,
              style: Get.textTheme.bodyText1,
              decoration: InputDecoration(
                  prefixIconColor: primaryBlueColor,
                  prefixIcon: Icon(Icons.attach_money)),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              '${_i18n()["itemDesc"]}',
              style: Get.textTheme.bodyText1,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: Get.textTheme.bodyText1,
              maxLines: 6,
              minLines: 4,
              controller: viewController.prItemDescController,
            ),
            const SizedBox(
              height: 25,
            ),
            if (viewController.specialMode.value == false)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_i18n()["category"]}',
                    style: Get.textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ROpItemCategorySelector(viewController: viewController),
                ],
              ),
            const SizedBox(
              height: 25,
            ),
            Text(
              '${_i18n()["itemOptions"]}',
              style: Get.textTheme.bodyText1,
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() {
              if (viewController.isEditing) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ROpItemOptionCard(
                      viewController: viewController,
                      itemId: viewController.editableItem.value!.id!.toString(),
                      restaurantID: restuarantID!,
                      categoryID: categoryId,
                    ),
                    MezAddButton(
                      title: '${_i18n()["addOption"]}',
                      onClick: () async {
                        final bool? result = await MezRouter.toNamed(
                            getROpOptionRoute(
                                restaurantId: restuarantID!,
                                optionId: null,
                                itemID: viewController.editableItem.value!.id!
                                    .toString())) as bool?;
                        if (result == true) {
                          await viewController.fetchItem();
                        }
                      },
                    ),
                    _deleteItemBtn(),
                  ],
                );
              } else {
                return Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      "Save item so you can manage options and choices ...",
                      textAlign: TextAlign.center,
                    ));
              }
            })
          ],
        ),
      ),
    );
  }

  Widget _deleteItemBtn() {
    return Obx(() {
      return Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: (viewController.editMode.value)
              ? TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.redAccent,
                      backgroundColor: offRedColor),
                  onPressed: () {
                    showConfirmationDialog(context, onYesClick: () async {
                      await viewController
                          .deleteItem(itemId: itemId!, catgeoryId: categoryId)
                          .then((bool? value) {
                        if (value == true) {
                          MezRouter.back(result: true);
                        }
                      });
                    },
                        title: '${_i18n()["deleteTitle"]}',
                        primaryButtonText: '${_i18n()["deleteBtn"]}',
                        helperText: "${_i18n()["deleteHelper"]}");
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete_outline_rounded,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("${_i18n()["deleteItem"]}"),
                        ],
                      )))
              : null);
    });
  }

  Future<void> _handleSaveBtn() async {
    if (_tabController.index == 0) {
      await _handleFirstTab();
    } else {
      await _handleSecondTab();
    }
  }

  Future<void> _handleSecondTab() async {
    if (isSecValid && isPrValid) {
      await viewController.saveItem();
    } else if (!isSecValid) {
      _tabController.animateTo(1);
    } else if (!isPrValid) {
      viewController.secondFormValid = true;
      _tabController.animateTo(0);
    }
  }

  Future<void> _handleFirstTab() async {
    if (isPrValid && isSecValid) {
      await viewController.saveItem();
    } else if (!isPrValid) {
      _tabController.animateTo(0);
    } else if (!isSecValid) {
      viewController.firstFormValid = true;
      _tabController.animateTo(1);
    }
  }

  bool get isPrValid {
    return _prformKey.currentState?.validate() == true ||
        viewController.firstFormValid;
  }

  bool get isSecValid {
    return _scformKey.currentState?.validate() == true ||
        viewController.secondFormValid;
  }
}