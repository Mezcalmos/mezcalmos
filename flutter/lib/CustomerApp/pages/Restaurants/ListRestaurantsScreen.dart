import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/Restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/models/restaurants/restaurant.dart';
import 'package:mezcalmos/Shared/widgets/GetFutureData.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen.dart';
import 'dart:async';

class ListRestaurantsScreen extends GetView<RestaurantsInfoController> {
  RxList<Restaurant> restaurants = <Restaurant>[].obs;
  ListRestaurantsScreen() {
    RestaurantsInfoController controller =
        Get.put<RestaurantsInfoController>(RestaurantsInfoController());
    controller.getRestaurants().then((value) {
      restaurants.value = value;
    });
    // controller.getCurrentOrder().listen((data) {
    //   order = data;
    // });
  }

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
