import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

import '../../../../../Shared/controllers/languageController.dart';
import 'buildOrders.dart';

dynamic i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["Orders"]["ListOrdersScreen"]["ListOrdersScreen"];

class RestaurantOrdersList extends StatelessWidget {
  /// Component responsible of building the restaurant orders list inside the tabbarview of the delivery admin app
  RestaurantOrdersList(
      {Key? key, required this.pastOrders, required this.currentOrders})
      : super(key: key);
  final RxList<RestaurantOrder> pastOrders;
  final RxList<RestaurantOrder> currentOrders;
  LanguageController lang = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            child: Text(i18n()["title"],
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.left),
          ),
          SizedBox(
            height: 8,
          ),
          Obx(
            () => Container(
              child: currentOrders.value.length > 0
                  ? buildOrders(currentOrders)
                  : Center(
                      child: Text(i18n()['noOrders']),
                    ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            child: Text(i18n()['pastOrders'],
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.left),
          ),
          SizedBox(
            height: 8,
          ),
          Obx(
            () => Container(
              child: pastOrders.value.length > 0
                  ? buildOrders(pastOrders)
                  : Center(
                      child: Text(i18n()['noOrders']),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
