import 'dart:async';

import 'package:async/async.dart' show StreamGroup;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/serviceProviderNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class ROpOrderController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  ForegroundNotificationsController _foregroundNotificationsController =
      Get.find<ForegroundNotificationsController>();

  RxList<RestaurantOrder> currentOrders = <RestaurantOrder>[].obs;
  RxList<RestaurantOrder> pastOrders = <RestaurantOrder>[].obs;
  StreamSubscription? _currentOrdersListener;
  StreamSubscription? _pastOrdersListener;

  Future<void> init(String restaurantId) async {
    mezDbgPrint(
        "--------------------> Start listening on past orders  ${serviceProviderPastOrders(orderType: OrderType.Restaurant, providerId: restaurantId)}");
    await _pastOrdersListener?.cancel();
    _pastOrdersListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderPastOrders(
            orderType: OrderType.Restaurant, providerId: restaurantId))
        .onValue
        .listen((DatabaseEvent event) {
      final List<RestaurantOrder> orders = [];
      if (event.snapshot.value != null) {
        (event.snapshot.value as dynamic).keys.forEach((orderId) {
          final dynamic orderData = (event.snapshot.value as dynamic)[orderId];

          orders.add(RestaurantOrder.fromData(orderId, orderData));
        });
      }
      pastOrders.value = orders;
    }, onError: (error) {
      mezDbgPrint('EROOOOOOR +++++++++++++++++ $error');
    });

    mezDbgPrint(
        "Starting listening on inProcess : ${serviceProviderInProcessOrders(orderType: OrderType.Restaurant, providerId: restaurantId)}");
    await _currentOrdersListener?.cancel();
    _currentOrdersListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderInProcessOrders(
            orderType: OrderType.Restaurant, providerId: restaurantId))
        .onValue
        .listen((DatabaseEvent event) {
      // mezDbgPrint("[][][][][ got new inProcess Order ]]");

      final List<RestaurantOrder> orders = [];
      if (event.snapshot.value != null) {
        // mezDbgPrint("orderController: new incoming order data");
        (event.snapshot.value as dynamic).keys?.forEach((orderId) {
          // mezDbgPrint("Hndling Order : $orderId");
          final dynamic orderData = (event.snapshot.value as dynamic)[orderId];
          orders.add(RestaurantOrder.fromData(orderId, orderData));
        });
      }
      currentOrders.value = orders;
    });
  }

  RestaurantOrder? getOrder(String orderId) {
    try {
      return currentOrders.firstWhere((DeliverableOrder order) {
        return order.orderId == orderId;
      });
    } on StateError {
      try {
        return pastOrders.firstWhere((DeliverableOrder order) {
          return order.orderId == orderId;
        });
      } on StateError {
        return null;
      }
    }
  }

  Stream<RestaurantOrder?> getOrderStream(String orderId) {
    return StreamGroup.merge(<Stream<RestaurantOrder?>>[
      _getCurrentOrderStream(orderId),
      _getPastOrderStream(orderId)
    ]);
  }

  Stream<RestaurantOrder?> _getCurrentOrderStream(String orderId) {
    return currentOrders.stream.map<RestaurantOrder?>((_) {
      try {
        return currentOrders.firstWhere(
          (RestaurantOrder currentOrder) => currentOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        // return null;
      }
      return null;
    });
  }

  Stream<RestaurantOrder?> _getPastOrderStream(String orderId) {
    return pastOrders.stream.map<RestaurantOrder?>((_) {
      try {
        return pastOrders.firstWhere(
          (RestaurantOrder pastOrder) => pastOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        // return null;
      }
      return null;
    });
  }

  Future<ServerResponse> cancelOrder(String orderId) async {
    return _callRestaurantCloudFunction("cancelOrderFromAdmin", orderId);
  }

  bool hasNewMessageNotification(String chatId) {
    return _foregroundNotificationsController
        .notifications()
        .where((Notification notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            notification.chatId == chatId)
        .isNotEmpty;
  }

  void clearOrderNotifications(String orderId) {
    _foregroundNotificationsController
        .notifications()
        .where((Notification notification) =>
            (notification.notificationType ==
                    NotificationType.OrderStatusChange ||
                notification.notificationType == NotificationType.NewMessage) &&
            notification.orderId == orderId)
        .forEach((Notification notification) {
      _foregroundNotificationsController.removeNotification(notification.id);
    });
  }

  Future<ServerResponse> setAsReadyForOrderPickup(String orderId) async {
    mezDbgPrint("Seeting order ready for delivery");
    return _callRestaurantCloudFunction("readyForOrderPickup", orderId);
  }

  Future<ServerResponse> startPreparingOrder(String orderId) async {
    mezDbgPrint("Seeting order ready for delivery");
    return _callRestaurantCloudFunction("prepareOrder", orderId);
  }

  Future<ServerResponse> setEstimatedFoodReadyTime(
      String orderId, DateTime estimatedTime) async {
    mezDbgPrint("inside clod set delivery time $estimatedTime");
    return _callRestaurantCloudFunction("setEstimatedFoodReadyTime", orderId,
        optionalParams: {
          "estimatedFoodReadyTime": estimatedTime.toUtc().toString()
        });
  }

  Future<ServerResponse> refundCustomerCustomAmount(
      String orderId, num refundAmount) async {
    mezDbgPrint("inside refundCustomerCustomAmount $refundAmount");
    return _callRestaurantCloudFunction("refundCustomerCustomAmount", orderId,
        optionalParams: {"refundAmount": refundAmount});
  }

  Future<ServerResponse> markItemUnavailable(
      String orderId, String itemId) async {
    mezDbgPrint("inside markItemUnavailable $itemId");
    return _callRestaurantCloudFunction("markOrderItemUnavailable", orderId,
        optionalParams: {"itemId": itemId});
  }

  Future<ServerResponse> _callRestaurantCloudFunction(
      String functionName, String orderId,
      {Map<String, dynamic>? optionalParams}) async {
    mezDbgPrint("calling cloud func");
    final HttpsCallable cloudFunction =
        FirebaseFunctions.instance.httpsCallable('restaurant-$functionName');
    try {
      final HttpsCallableResult response = await cloudFunction.call({
        "orderId": orderId,
        "fromRestaurantOperator": true,
        ...optionalParams ?? {}
      });
      mezDbgPrint("Response : ${response.data}");
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      mezDbgPrint("Errrooooooooor =======> $e");
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  @override
  void onClose() {
    mezDbgPrint(
        "CURRENT ORDER CONTROLLER :: ::: :: :: : :   : :::::: DISPOSE ! $hashCode");
    mezDbgPrint(
        "--------------------> CurrentROpOrderController::onClose called  !");
    print("[+] Orderontroller::onClose ---------> Was invoked !");
    _currentOrdersListener?.cancel();
    _currentOrdersListener = null;
    _pastOrdersListener?.cancel();
    _pastOrdersListener = null;
    super.onClose();
  }
}