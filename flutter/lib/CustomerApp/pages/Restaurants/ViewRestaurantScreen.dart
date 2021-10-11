import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/appbarComponent.dart';
import 'package:mezcalmos/CustomerApp/components/itemMenuComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/models/restaurant.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen.dart';
import 'dart:async';

class ViewRestaurantScreen extends GetView<RestaurantsInfoController> {
  String restaurantId;
  Rxn<Restaurant> restaurant = Rxn();

  ViewRestaurantScreen(this.restaurantId) {
    RestaurantsInfoController controller =
        Get.put<RestaurantsInfoController>(RestaurantsInfoController());
    controller.getRestaurant(restaurantId).then((value) {
      restaurant.value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Obx(() => Text("${restaurant.value?.name ?? 'Loading'}")),
        //   actions: [
        //     TextButton(
        //         onPressed: () => Get.to(ViewCartScreen()), child: Text("Cart"))
        //   ],
        // ),
        body: Obx(() {
      List<Item> items = restaurant.value?.items ?? [];
      print(items.length);

      return (restaurant.value?.items == null)
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SafeArea(
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    // alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 80),

                    height: Get.height,
                    width: Get.width,
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Container(
                          height: Get.height * 0.45,
                          width: Get.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25)),
                            child: Image.network(
                              "${restaurant.value!.photo}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: Get.height * 0.45,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            border: Border.all(
                                color: const Color(0x5c707070), width: 1),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(0, -2),
                                  blurRadius: 6,
                                  spreadRadius: 0)
                            ],
                            gradient: LinearGradient(
                              begin: Alignment(0.5, 0),
                              end: Alignment(0.5, 0.8458111882209778),
                              colors: [
                                const Color(0x00000f1c),
                                const Color(0xad000f1c),
                                const Color(0xff000f1c)
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            top: Get.height * 0.325,
                            child: Container(
                              width: Get.width,
                              child: Text("${restaurant.value!.name}",
                                  style: const TextStyle(
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "ProductSans",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 25.0),
                                  textAlign: TextAlign.center),
                            ))
                      ],
                    ),
                  )),
                  Positioned(child: restaurantAppBarComponent("back", () {})),
                  SlidingUpPanel(
                    maxHeight: Get.height * 0.85,
                    minHeight: Get.height * 0.45,
                    parallaxEnabled: true,
                    parallaxOffset: 1,
                    body: Container(
                      decoration: BoxDecoration(
                        color: Color(0x36fafafa),
                      ),
                    ),
                    panelBuilder: (sc) => _panel(sc, context, items),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        topRight: Radius.circular(18.0)),
                  ),
                ],
              ),
            );
      // return Column(
      //     children: items
      //         .map((item) => TextButton(
      //             onPressed: () => Get.to(
      //                 ViewItemScreen.forNewItem(restaurantId, item.id!)),
      //             child: Text(item.name!)))
      //         .toList());
    }));
  }

  Widget _panel(ScrollController sc, BuildContext context, List<Item> items) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Container(
          height: Get.height * 0.82,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            boxShadow: [
              BoxShadow(
                  color: const Color(0x29000000),
                  offset: Offset(0, -5),
                  blurRadius: 6,
                  spreadRadius: 0)
            ],
            color: Color(0xfffbfbfb),
          ),
          child: SingleChildScrollView(
            controller: sc,
            child: Container(
              height: Get.height * 0.82,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Menu",
                        style: const TextStyle(
                            color: const Color(0xff000f1c),
                            fontWeight: FontWeight.w700,
                            fontFamily: "ProductSans",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        textAlign: TextAlign.left),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Expanded(
                      child: Container(
                    child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return ItemMenuComponents(
                            itemID: items[index].id,
                            photo: items[index].image,
                            price: items[index].cost,
                            title: items[index].name,
                            function: () {
                              Get.to(ViewItemScreen.forNewItem(
                                  restaurantId, items[index].id!));
                            },
                          );
                        }),
                  ))
                ],
              ),
            ),
          ),
        ));
  }
}

class ListRestaurantsScreen extends GetView<RestaurantsInfoController> {
  RxList<Restaurant> restaurants = <Restaurant>[].obs;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Restaurant list"),
        ),
        body: Obx(() => Column(
            children: restaurants
                .map((restaurant) => TextButton(
                    onPressed: () =>
                        Get.to(ViewRestaurantScreen(restaurant.id!)),
                    child: Text(restaurant.name!)))
                .toList())));
  }
}
