import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/components/ItemCategorySelector.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/components/ROpItemAvChips.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/components/ROpItemImage.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/components/RopItemOptionCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/controllers/ItemViewController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/CallToActionButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

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
  ItemViewController viewController = ItemViewController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    itemId = Get.parameters["itemId"];
    categoryId = Get.parameters["categoryId"];
    restuarantID = Get.parameters["restaurantId"];
    mezDbgPrint("Restuarnt id in item view ============> $restuarantID");
    if (restuarantID != null) {
      if (Get.arguments != null) {
        specials = Get.arguments["specials"] as bool;
      }
      _tabController = TabController(length: 2, vsync: this);
      viewController.init(
          itemId: itemId,
          categoryId: categoryId,
          specials: specials,
          restaurantId: restuarantID!);
    } else
      Get.back();

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
        if (viewController.restaurant.value != null) {
          return Scaffold(
            appBar: _appBar(),
            bottomNavigationBar: _saveBtn(),
            body: Obx(
              () {
                if (viewController.restaurant.value != null) {
                  return Form(
                    key: _formKey,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _primaryTab(),
                        _secondaryTab(),
                      ],
                    ),
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
      () => CallToActionButton(
        height: 65,
        text: (viewController.editMode.isTrue)
            ? '${_i18n()["saveItem"]}'
            : '${_i18n()["addItem"]}',
        onTap: () async {
          if (viewController.isSecondLangValid) {
            _tabController.index = 0;
            if (_formKey.currentState!.validate()) {
              await viewController.saveItem();
            }
          } else {
            _tabController.index = _tabController.length - 1;
            _formKey.currentState!.validate();
          }
        },
      ),
    );
  }

  AppBar _appBar() {
    return mezcalmosAppBar(AppBarLeftButtonType.Back,
        onClick: Get.back,
        title: '${_i18n()["item"]}',
        showNotifications: true,
        tabBar: TabBar(controller: _tabController, tabs: [
          Tab(
            text:
                "${viewController.restaurant.value!.primaryLanguage.toLanguageName()}",
          ),
          Tab(
            text:
                "${viewController.restaurant.value!.secondaryLanguage!.toLanguageName()}",
          ),
        ]));
  }

  Widget _secondaryTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
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
            controller: viewController.scItemNameController,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return '${_i18n()["required"]}';
              }
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
    );
  }

  Widget _primaryTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
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
          Text(
            '${_i18n()["itemName"]}',
            style: Get.textTheme.bodyText1,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            style: Get.textTheme.bodyText1,
            controller: viewController.prItemNameController,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return '${_i18n()["required"]}';
              }
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
          if (viewController.specialMode.value == null ||
              viewController.specialMode.value == false)
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
          ROpItemOptionCard(
            viewController: viewController,
            itemId: itemId,
            restaurantID: restuarantID!,
            categoryID: categoryId,
          ),
          MezAddButton(
            title: '${_i18n()["addOption"]}',
            onClick: () async {
              final Option? newOption = await Get.toNamed(
                  getROpOptionRoute(restaurantId: restuarantID!)) as Option?;
              if (newOption != null) {
                viewController.addOption(newOption);
              }
            },
          ),
          _deleteItemBtn()
        ],
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
                      backgroundColor: offRedColor, primary: Colors.redAccent),
                  onPressed: () {
                    showConfirmationDialog(context, onYesClick: () async {
                      await viewController
                          .deleteItem(itemId: itemId!, catgeoryId: categoryId)
                          .then((value) => Get.back());
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
}
