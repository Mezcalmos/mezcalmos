import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/AppBar.dart';
import 'package:mezcalmos/CustomerApp/components/FloatingCartComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen/components/RestaurandCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen/components/RestaurantShimmerList.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen/controllers/ListRestaurantController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ListRestaurantsScreen"]["ListRestaurantScreen"];

class ListRestaurantsScreen extends StatefulWidget {
  const ListRestaurantsScreen({Key? key}) : super(key: key);

  @override
  _ListRestaurantsScreenState createState() => _ListRestaurantsScreenState();
}

class _ListRestaurantsScreenState extends State<ListRestaurantsScreen> {
  /// RestaurantsInfoController

  ListRestaurantsController viewController = ListRestaurantsController();
  @override
  void initState() {
    // TODO: implement initState
    viewController.init();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppBar(
        title: "${_i18n()['restaurants']}",
        autoBack: true,
      ),
      floatingActionButton: FloatingCartComponent(),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [_searchInput(), _sortingSwitcher(), _restaurantList()],
          )),
    );
  }

  Widget _restaurantList() {
    return Obx(() {
      if (viewController.isLoading.value) {
        return Column(
          children: List.generate(10, (int index) => RestaurantShimmerCard()),
        );
      } else if (viewController.filteredRestaurants.isNotEmpty) {
        return Column(
          children: List.generate(
              viewController.filteredRestaurants.length,
              (int index) => RestaurantCard(
                    restaurant: viewController.filteredRestaurants[index],
                    shippingPrice: viewController.baseShippingPrice,
                    onClick: () {
                      Get.toNamed<void>(
                        getRestaurantRoute(
                            viewController.filteredRestaurants[index].info.id),
                        arguments: viewController.filteredRestaurants[index],
                      );
                    },
                  )),
        );
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/customer/restaurants/noOpenRestaurants.png",
              height: 50.h,
              width: 80.w,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '${_i18n()["noOpenRestaurant"]}',
              style: Get.textTheme.bodyText1,
            )
          ],
        );
      }
    });
  }

  Widget _sortingSwitcher() {
    return Obx(
      () => SwitchListTile(
        value: viewController.showOnlyOpen.value,
        onChanged: (bool v) {
          viewController.changeAlwaysOpenSwitch(v);
          viewController.filter();
        },
        activeColor: primaryBlueColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
        title: Text(
          "${_i18n()["showOnlyOpen"]}",
          style: Get.textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget _searchInput() {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      style: Get.textTheme.bodyText1,
      onChanged: (String value) {
        viewController.searchQuery.value = value;
        viewController.filter();
        mezDbgPrint(viewController.searchQuery);
      },
      decoration: InputDecoration(
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade300,
          ),
          hintStyle: TextStyle(
            color: Colors.grey.shade300,
          ),
          hintText: "${_i18n()["search"]}"),
    );
  }
}
