import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/FloatingCartComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Restaurants/CustRestaurantView/CustomerRestaurantView.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Restaurants/CustRestaurantsListView/components/RestaurantCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Restaurants/CustRestaurantsListView/components/RestaurantShimmerList.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Restaurants/CustRestaurantsListView/components/SearchItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Restaurants/CustRestaurantsListView/controllers/CustRestaurantListViewController.dart';
import 'package:mezcalmos/CustomerApp/router/restaurantRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ListRestaurantsScreen"]["ListRestaurantScreen"];

class CustRestaurantListView extends StatefulWidget {
  const CustRestaurantListView({Key? key}) : super(key: key);
  static Future<void> navigate() {
    return MezRouter.toNamed(RestaurantRoutes.restaurantsListRoute);
  }

  @override
  _CustRestaurantListViewState createState() => _CustRestaurantListViewState();
}

class _CustRestaurantListViewState extends State<CustRestaurantListView> {
  /// RestaurantsInfoController

  CustRestaurantListViewController viewController =
      CustRestaurantListViewController();

  @override
  void initState() {
    viewController.init();
    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("${_i18n()['restaurants']}"),
      // ),
      // appBar: MezcalmosAppBar(
      //   AppBarLeftButtonType.Back,
      //   onClick: MezRouter.back,
      //   title: "${_i18n()['restaurants']}",
      // ),

      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        title: "${_i18n()['restaurants']}"
      ),
      floatingActionButton: FloatingCartComponent(),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              _searchInput(),
              _searchFilter(),
              _sortingSwitcher(),
              Obx(() {
                if (viewController.byRestaurants)
                  return Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: _restaurantList(),
                  );
                else
                  return _searchedItemsList();
              })
            ],
          )),
    );
  }

  Widget _searchedItemsList() {
    if (viewController.filteredItems.isNotEmpty) {
      return Column(
        children: List.generate(
            viewController.filteredItems.length,
            (int index) =>
                SearchItemCard(item: viewController.filteredItems[index])),
      );
    } else {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              radius: 40,
              child: Icon(
                Icons.search_off_rounded,
                color: Colors.grey.shade600,
                size: 35,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              '${_i18n()["noItemTitle"]}',
              style: context.txt.bodyLarge,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${_i18n()["noItemDesc"]}',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
  }

  Widget _searchFilter() {
    return Obx(() => Container(
          margin: const EdgeInsets.only(top: 15),
          child: Row(
            children: [
              Flexible(
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    viewController
                        .switchSearchType(SearchType.searchByRestaurantName);
                  },
                  child: Ink(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: (viewController.byRestaurants)
                            ? primaryBlueColor
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(18)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.flatware,
                          color: !viewController.byRestaurants
                              ? Colors.grey.shade700
                              : Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Flexible(
                          child: Text(
                            "${_i18n()["restaurants"]}",
                            style: context.txt.bodyLarge?.copyWith(
                              color: !viewController.byRestaurants
                                  ? Colors.grey.shade700
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Flexible(
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    viewController
                        .switchSearchType(SearchType.searchByItemName);
                  },
                  child: Ink(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: (!viewController.byRestaurants)
                            ? primaryBlueColor
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(18)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.fastfood,
                          color: viewController.byRestaurants
                              ? Colors.grey.shade700
                              : Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: Text(
                            '${_i18n()["meal"]}',
                            style: context.txt.bodyLarge?.copyWith(
                              color: viewController.byRestaurants
                                  ? Colors.grey.shade700
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _restaurantList() {
    mezDbgPrint(viewController.filteredRestaurants.length);
    return Obx(() {
      if (viewController.isLoading.value) {
        return Column(
          children: List.generate(10, (int index) => RestaurantShimmerCard()),
        );
      } else if (viewController.filteredRestaurants.isNotEmpty) {
        return Column(
          children: List.generate(viewController.filteredRestaurants.length,
              (int index) {
            return RestaurantCard(
              restaurant: viewController.filteredRestaurants[index],
              customerLocation: viewController.customerLocation,
              onClick: () => CustomerRestaurantView.navigate(
                restaurantId:
                    viewController.filteredRestaurants[index].info.hasuraId,
              ),
            );
          }),
        );
      } else {
        return Column(
          children: [
            //give space when its bigger size.
            SizedBox(
              height: 20,
            ),
            Container(
              child: Image.asset(
                "assets/images/customer/restaurants/noOpenRestaurants.png",
                height: 35.h,
                width: 65.w,
              ),
            ),
            Text(
              '${_i18n()["noOpenRestaurant"]}',
              style: context.txt.bodyLarge,
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
          style: context.txt.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget _searchInput() {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      style: context.txt.bodyLarge,
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