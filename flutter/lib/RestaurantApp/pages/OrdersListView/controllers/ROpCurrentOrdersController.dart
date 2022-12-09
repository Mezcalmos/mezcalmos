import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantOpAuthController.dart';
import 'package:mezcalmos/Shared/graphql/order/hsRestaurantOrder.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalRestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class ROpCurrentOrdersController {
  //instances
  RestaurantOpAuthController opAuthController =
      Get.find<RestaurantOpAuthController>();

  // vars
  RxList<MinimalRestaurantOrder> currentOrders = <MinimalRestaurantOrder>[].obs;
  RxList<MinimalRestaurantOrder> pastOrders = <MinimalRestaurantOrder>[].obs;
  RxBool initalized = RxBool(false);
  late int restaurantId;
  // Rxn<Restaurant> restaurant = Rxn();
  Rxn<ServiceStatus> _serviceStatus = Rxn();
// streams
  StreamSubscription? currentOrdersListener;
// getters
  bool get isOpen => _serviceStatus == ServiceStatus.Open;

  Future<void> init() async {
    restaurantId = opAuthController.restaurantId!;
    mezDbgPrint("INIT ORDERS 👋👋👋👋👋👋 Restaurant id $restaurantId");
    try {
      await _fetchServiceStatus(restaurantId);
      await _initOrders();
    } on Exception catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }

    initalized.value = true;
  }

  Future<void> _initOrders() async {
    currentOrders.value =
        await get_current_restaurant_orders(restaurantId: restaurantId) ?? [];
    pastOrders.value =
        await get_past_restaurant_orders(restaurantId: restaurantId) ?? [];
    currentOrdersListener =
        listen_on_current_restaurant_orders(restaurantId: restaurantId)
            .listen((List<MinimalRestaurantOrder>? event) {
      if (event != null) {
        currentOrders.value = event;
      }
    });
  }

  Future<void> _fetchServiceStatus(int restaurantId) async {
    _serviceStatus.value =
        await get_restaurant_status(restaurantId: restaurantId);
  }

  Future<void> turnOffOrders() async {
    _serviceStatus.value = await update_restaurant_status(
        id: restaurantId, status: ServiceStatus.Closed_temporarily);
  }

  Future<void> turnOnOrders() async {
    _serviceStatus.value = await update_restaurant_status(
        id: restaurantId, status: ServiceStatus.Open);
  }

  void dispose() {
    currentOrdersListener?.cancel();
    currentOrdersListener = null;
  }
}