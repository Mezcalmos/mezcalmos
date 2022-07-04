import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/components/ItemCategorySelector.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/components/ROpItemImage.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/components/RopItemOptionCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/controllers/ItemViewController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/CallToActionButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';

class ROpItemView extends StatefulWidget {
  const ROpItemView({Key? key}) : super(key: key);

  @override
  _ROpItemViewState createState() => _ROpItemViewState();
}

class _ROpItemViewState extends State<ROpItemView>
    with SingleTickerProviderStateMixin {
  Rxn<Restaurant> restaurant = Rxn();
  RestaurantInfoController _restaurantInfoController =
      Get.find<RestaurantInfoController>();
  StreamSubscription? _restaurantListener;
  late TabController _tabController;
  ItemViewController viewController = ItemViewController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    viewController.init();
    restaurant.value = _restaurantInfoController.restaurant.value;
    _restaurantListener =
        _restaurantInfoController.restaurant.stream.listen((Restaurant? event) {
      if (event != null) {
        restaurant.value = event;
      } else {
        Get.back();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _restaurantListener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: Get.back,
          title: "Item",
          showNotifications: true,
          tabBar: TabBar(controller: _tabController, tabs: [
            Tab(
              text: "${restaurant.value!.primaryLanguage.toLanguageName()}",
            ),
            Tab(
              text: "${restaurant.value!.secondaryLanguage!.toLanguageName()}",
            ),
          ])),
      bottomNavigationBar: CallToActionButton(
        height: 65,
        text: "Add item",
        onTap: () {
          if (viewController.isSecondLangValid) {
            _tabController.index = _tabController.length - 2;
            if (_formKey.currentState!.validate()) {
              viewController.addItemToDb();
            }
          } else {
            _tabController.index = _tabController.length - 1;
            _formKey.currentState!.validate();
          }
        },
      ),
      body: Obx(
        () {
          if (restaurant.value != null) {
            return Form(
              key: _formKey,
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Items view //
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ROpItemImage(
                          viewController: viewController,
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          "Item name",
                          style: Get.textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: viewController.prItemNameController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Item Price",
                          style: Get.textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: viewController.itemPriceController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
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
                          "Item Description",
                          style: Get.textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          maxLines: 6,
                          minLines: 4,
                          controller: viewController.prItemDescController,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Category",
                          style: Get.textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ROpItemCategorySelector(viewController: viewController),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Item options",
                          style: Get.textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: List.generate(
                              viewController.itemOptions.length,
                              (int index) => ROpItemOptionCard(
                                  option: viewController.itemOptions[index])),
                        ),
                        MezAddButton(
                          title: "Add option",
                          onClick: () async {
                            final Option? newOption =
                                await Get.toNamed(kOptionView) as Option?;
                            if (newOption != null) {
                              mezDbgPrint(newOption.toJson());
                              viewController.addOption(newOption);
                            }
                          },
                        )
                      ],
                    ),
                  ),

                  SingleChildScrollView(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Item name",
                          style: Get.textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: viewController.scItemNameController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Item Description",
                          style: Get.textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          minLines: 4,
                          maxLines: 6,
                          controller: viewController.scItemDescController,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _addOptionButton() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.grey.shade200,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () async {},
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 5),
          child: Icon(
            Icons.add_circle_outline_outlined,
            color: primaryBlueColor,
            size: 25,
          ),
        ),
      ),
    );
  }
}
