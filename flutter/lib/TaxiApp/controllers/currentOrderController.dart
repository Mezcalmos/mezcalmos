import 'dart:async';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/SharedEnums.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/TaxiApp/controllers/fbTaxiNotificationsController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/Shared/models/Order.dart';

class CurrentOrderController extends GetxController with MezDisposable {
  TaxiAuthController _taxiAuthController =
      Get.find<TaxiAuthController>(); // since it's already injected .
  DatabaseHelper _databaseHelper =
      Get.find<DatabaseHelper>(); // Already Injected in main function

  FBNotificationsController _notifications =
      Get.put<FBTaxiNotificationsController>(FBTaxiNotificationsController());

  String? lastOrderStatus;

  CurrentOrderEvent? currentEvent;
  Rxn<CurrentOrder> _currentOrderStream = Rxn();
  CurrentOrder? get currentOrderStream => _currentOrderStream.value;
  Rxn<CurrentOrder> get currentOrderStreamRx => _currentOrderStream;

  @override
  void onInit() {
    super.onInit();
    mezDbgPrint("Current Order Controller");
    mezDbgPrint(_taxiAuthController.taxiState!.currentOrder!);
    _databaseHelper.firebaseDatabase
        .reference()
        .child(orderId(_taxiAuthController.taxiState!.currentOrder!))
        .onValue
        .listen((event) {
      Order order = Order.fromSnapshot(event.snapshot);
      CurrentOrderEvent? currentOrderEvent = currentEvent;
      // _currentOrderStream.value?.event = currentEvent;
      if (order.status != null && order.status != lastOrderStatus) {
        mezDbgPrint("NEW EVENTTTTTTTTTT");
        currentOrderEvent = new CurrentOrderEvent(
            CurrentOrderEventTypes.OrderStatusChange,
            eventDetails: <String, String?>{
              "oldStatus": lastOrderStatus,
              "newStatus": order.status
            });
        lastOrderStatus = order.status;
        currentEvent = currentOrderEvent;

        mezDbgPrint(
            "\from Listener of CurrentORderController :: \n${_currentOrderStream.value?.toJson()}\n");
      }
      _currentOrderStream.value = CurrentOrder(order, event: currentOrderEvent);
    }).canceledBy(this);
  }

  void clearEvent() {
    this.currentEvent = null;
  }

  Future<CurrentOrder> getOrder() async {
    DataSnapshot snapshot = await _databaseHelper.firebaseDatabase
        .reference()
        .child(orderId(_taxiAuthController.taxiState!.currentOrder!))
        .once();

    Order order = Order.fromSnapshot(snapshot);
    CurrentOrderEvent? currentOrderEvent = currentEvent;
    // _currentOrderStream.value?.event = currentEvent;
    if (order.status != null && order.status != lastOrderStatus) {
      mezDbgPrint("NEW EVENTTTTTTTTTT");
      currentOrderEvent = new CurrentOrderEvent(
          CurrentOrderEventTypes.OrderStatusChange,
          eventDetails: <String, String?>{
            "oldStatus": lastOrderStatus,
            "newStatus": order.status
          });
      lastOrderStatus = order.status;
      currentEvent = currentOrderEvent;

      mezDbgPrint(
          "\from Listener of CurrentORderController :: \n${_currentOrderStream.value?.toJson()}\n");
    }
    return CurrentOrder(order, event: currentOrderEvent);
  }

  Future<void> cancelTaxi(String? reason) async {
    HttpsCallable cancelTaxiFunction =
        FirebaseFunctions.instance.httpsCallable('cancelTaxiFromDriver');
    mezDbgPrint("Cancel Taxi Called");
    try {
      // _waitingResponse.value = true;
      HttpsCallableResult response = await cancelTaxiFunction
          .call(<String, dynamic>{
        'reason': reason,
        'database': _databaseHelper.dbType
      });
      dynamic _res = responseStatusChecker(response.data);
      if (_res == null) {
        throw Exception(
            "Manually thrown Exception - Reason -> Response.data was null !");
      } else {
        mezcalmosSnackBar("Notice ~", _res);
        // Get.delete<CurrentOrderMapController>();
      }

      // _waitingResponse.value = false;
    } catch (e) {
      mezcalmosSnackBar("Notice ~", "Failed to Cancel the Taxi Request :( ");
      // _waitingResponse.value = false;
      mezDbgPrint("Exception happend in cancelTaxi : $e");
    }
  }

  Future<void> startRide() async {
    HttpsCallable startRideFunction =
        FirebaseFunctions.instance.httpsCallable('startTaxiRide');
    mezDbgPrint("Start Taxi Called");
    try {
      // _waitingResponse.value = true;
      HttpsCallableResult response = await startRideFunction
          .call(<String, dynamic>{'database': _databaseHelper.dbType});
      dynamic _res = responseStatusChecker(response.data);

      if (_res == null)
        throw Exception(
            "Manually thrown Exception - Reason -> Response.data was null !");
      // : mezcalmosSnackBar("Notice ~", _res);
      // _waitingResponse.value = false;
    } catch (e) {
      mezcalmosSnackBar("Notice ~", "Failed to Start The ride :( ");
      // _waitingResponse.value = false;
      mezDbgPrint("Exception happend in startRide : $e");
    }
  }

  Future<void> finishRide() async {
    HttpsCallable finishRideFunction =
        FirebaseFunctions.instance.httpsCallable('finishTaxiRide');
    mezDbgPrint("Finish Taxi Called");
    try {
      // _waitingResponse.value = true;
      HttpsCallableResult response = await finishRideFunction
          .call(<String, dynamic>{'database': _databaseHelper.dbType});
      dynamic _res = responseStatusChecker(response.data);

      if (_res == null) {
        throw Exception(
            "Manually thrown Exception - Reason -> Response.data was null !");
      } else {
        mezcalmosSnackBar("Notice ~", _res);
        // Get.delete<CurrentOrderMapController>();
      }

      // _waitingResponse.value = false;
    } catch (e) {
      mezcalmosSnackBar("Notice ~", "Failed to finish The ride :( ");
      // _waitingResponse.value = false;
      mezDbgPrint("Exception happend in finishRide : $e");
    }
  }

  void detachListeners() {
    _notifications.clearAllMessageNotification();
  }

  @override
  void onClose() async {
    mezDbgPrint("cuRRENT CONTROLLER :: ::: :: :: : :   : :::::: DISPOSE !");
    // try {
    //   Get.delete<CurrentOrderController>();
    // } catch (e) {
    //   mezDbgPrint(e);
    // }
    cancelSubscriptions();
    detachListeners();
    mezDbgPrint(
        "--------------------> CurrentOrderController::onClose called  !");

    super.onClose();
  }
}
