import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';

class LaundryOrderController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  ForegroundNotificationsController _fbNotificationsController =
      Get.find<ForegroundNotificationsController>();
  RxList<LaundryOrder> inProcessOrders = <LaundryOrder>[].obs;
  RxList<LaundryOrder> pastOrders = <LaundryOrder>[].obs;
  StreamSubscription? _currentOrdersListener;
  StreamSubscription? _pastOrdersListener;

  @override
  void onInit() {
    mezDbgPrint("--------------------> LaundrysOrderController Initialized !");
    _currentOrdersListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(laundryInProcessOrdersNode())
        .onValue
        .listen((event) {
      List<LaundryOrder> orders = [];
      if (event.snapshot.value != null) {
        for (var orderId in event.snapshot.value.keys) {
          dynamic orderData = event.snapshot.value[orderId];
          orders.add(LaundryOrder.fromData(orderId, orderData));
        }
      }
      inProcessOrders.value = orders;
    });

    _pastOrdersListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(laundryPastOrdersNode())
        .orderByChild('orderTime')
        .limitToLast(5)
        .onChildAdded
        .listen((event) {
      pastOrders
          .add(LaundryOrder.fromData(event.snapshot.key, event.snapshot.value));
    });

    super.onInit();
  }

  @override
  void onClose() async {
    mezDbgPrint("[+] OrderController::dispose ---------> Was invoked !");
    _currentOrdersListener?.cancel();
    _pastOrdersListener?.cancel();
    pastOrders.clear();
    inProcessOrders.clear();
    super.onClose();
  }

  LaundryOrder? getOrder(String orderId) {
    try {
      return inProcessOrders.firstWhere((order) {
        return order.orderId == orderId;
      });
    } on StateError {
      try {
        return pastOrders.firstWhere((order) {
          return order.orderId == orderId;
        });
      } on StateError {
        return null;
      }
    }
  }

  bool isPast(LaundryOrder order) {
    return pastOrders.contains(order);
  }

  Stream<LaundryOrder?> getCurrentOrderStream(String orderId) {
    return inProcessOrders.stream.map<LaundryOrder?>((_) {
      try {
        return inProcessOrders.firstWhere(
          (currentOrder) => currentOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        return null;
      }
    });
  }

  bool orderHaveNewMessageNotifications(String orderId) {
    return _fbNotificationsController
        .notifications()
        .where((notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            notification.orderId! == orderId)
        .isNotEmpty;
  }

  void clearNewOrderNotifications() {
    _fbNotificationsController.notifications.value.forEach((element) {
      // mezDbgPrint(element.notificationType.toFirebaseFormatString());
    });
    _fbNotificationsController.notifications.value
        .where((notification) =>
            notification.notificationType == NotificationType.NewOrder)
        .forEach((notification) {
      // mezDbgPrint(notification.id);
      _fbNotificationsController.removeNotification(notification.id);
    });
  }

  void clearOrderNotifications(String orderId) {
    _fbNotificationsController
        .notifications()
        .where((notification) =>
            (notification.notificationType ==
                    NotificationType.OrderStatusChange ||
                notification.notificationType == NotificationType.NewOrder) &&
            notification.orderId! == orderId)
        .forEach((notification) {
      _fbNotificationsController.removeNotification(notification.id);
    });
  }

  Future<ServerResponse> cancelOrder(String orderId) async {
    return _callLaundryCloudFunction("laundry-cancelFromAdmin", orderId);
  }

  Future<ServerResponse> otwPickupOrder(String orderId) async {
    return _callLaundryCloudFunction("otwPickupOrder", orderId);
  }

  Future<ServerResponse> pickedUpOrder(String orderId) async {
    return _callLaundryCloudFunction("pickedUpOrder", orderId);
  }

  Future<ServerResponse> atLaundryOrder(String orderId, num weight) async {
    return _callLaundryCloudFunction("atLaundryOrder", orderId,
        optionalParams: <String, dynamic>{"weight": weight});
  }

  Future<ServerResponse> readyForDeliveryOrder(String orderId) async {
    return _callLaundryCloudFunction("readyForDeliveryOrder", orderId);
  }

  Future<ServerResponse> otwDeliveryOrder(String orderId) async {
    return _callLaundryCloudFunction("otwDeliveryOrder", orderId);
  }

  Future<ServerResponse> deliveredOrder(String orderId) async {
    return _callLaundryCloudFunction("deliveredOrder", orderId);
  }

  Future<ServerResponse> _callLaundryCloudFunction(
      String functionName, String orderId,
      {Map<String, dynamic>? optionalParams}) async {
    HttpsCallable dropOrderFunction =
        FirebaseFunctions.instance.httpsCallable('laundry-$functionName');
    mezDbgPrint("Drop order");
    try {
      HttpsCallableResult response = await dropOrderFunction
          .call({"orderId": orderId, ...optionalParams ?? {}});
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }
}
