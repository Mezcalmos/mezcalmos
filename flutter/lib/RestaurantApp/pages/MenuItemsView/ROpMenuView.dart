import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/components/ROpCategoryGridCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/components/ROpCategoryItems.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/components/ROpItemCard.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

class ROpMenuView extends StatefulWidget {
  const ROpMenuView({Key? key}) : super(key: key);

  @override
  _ROpMenuViewState createState() => _ROpMenuViewState();
}

class _ROpMenuViewState extends State<ROpMenuView>
    with SingleTickerProviderStateMixin {
  Rxn<Restaurant> restaurant = Rxn();
  RestaurantInfoController _restaurantInfoController =
      Get.find<RestaurantInfoController>();
  StreamSubscription? _restaurantListener;
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
    _restaurantListener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: Get.back,
          title: "Menu",
          showNotifications: true,
          tabBar: TabBar(
              controller: _tabController,
              labelColor: primaryBlueColor,
              unselectedLabelColor: Colors.grey.shade800,
              tabs: [
                Tab(
                  text: "My items",
                ),
                Tab(
                  text: "Specials",
                ),
              ])),
      body: Obx(
        () => TabBarView(
          controller: _tabController,
          children: [
            // Items view //
            SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  _categoriesGridList(),
                  _categoriesItemsList(),
                  _noCategoryItemsList()
                ],
              ),
            ),

            // specials view //
            SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [Text("Specials")],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _categoriesItemsList() {
    return Container(
      child: Column(
        children: List.generate(
            restaurant.value!.getCategories.length,
            (int index) => ROpCategoryItems(
                category: restaurant.value!.getCategories[index])),
      ),
    );
  }

  Widget _noCategoryItemsList() {
    if (restaurant.value!.getItemsWithoutCategory != null) {
      return Container(
        child: Column(
          children: List.generate(
              restaurant.value!.getItemsWithoutCategory!.length,
              (int index) => ROpItemCard(
                  item: restaurant.value!.getItemsWithoutCategory![index])),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _categoriesGridList() {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List<Widget>.generate(restaurant.value!.getCategories.length,
              (int index) {
            return ROpCategoryGridCard(
                item: restaurant.value!.getCategories[index]);
          }) +
          [
            Card(
              color: Colors.grey.shade200,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  //     Get.toNamed(kCategoryView);
                },
                child: Container(
                  child: Icon(
                    Icons.add_circle_outline,
                    size: 25,
                    color: primaryBlueColor,
                  ),
                ),
              ),
            )
          ],
    );
  }
}
