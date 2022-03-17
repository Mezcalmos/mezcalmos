import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['notificationHandler'];
Notification customerNotificationHandler(String key, value) {
  final NotificationType notificationType =
      value['notificationType'].toString().toNotificationType();
  switch (notificationType) {
    case NotificationType.NewMessage:
      return newMessageNotification(key, value);
    case NotificationType.OrderStatusChange:
      final OrderType orderType = value['orderType'].toString().toOrderType();
      mezDbgPrint(value['orderType']);
      switch (orderType) {
        case OrderType.Restaurant:
          return restaurantOrderStatusChangeNotificationHandler(key, value);
        case OrderType.Taxi:
          return taxiOrderStatusChangeNotificationHandler(key, value);
        case OrderType.Laundry:
          return laundryOrderStatusChangeNotificationHandler(key, value);
        default:
          throw StateError("Invalid Notification Type");
      }
    default:
      throw StateError("Invalid Notification Type");
  }
}

Notification laundryOrderStatusChangeNotificationHandler(String key, value) {
  final LaundryOrderStatus newOrdersStatus =
      value['status'].toString().toLaundryOrderStatus();
  mezDbgPrint(newOrdersStatus);
  final Map<String, dynamic> dynamicFields =
      getLaundryOrderStatusFields(newOrdersStatus)!;
  mezDbgPrint(dynamicFields);
  return Notification(
      id: key,
      linkUrl: getLaundyOrderRoute(value['orderId']),
      linkText: _i18n()['viewOrder'],
      body: dynamicFields["body"],
      imgUrl: dynamicFields["imgUrl"],
      title: dynamicFields["title"],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.OrderStatusChange,
      notificationAction:
          value["notificationAction"].toString().toNotificationAction(),
      variableParams: value);
}

Notification taxiOrderStatusChangeNotificationHandler(String key, value) {
  final TaxiOrdersStatus newOrdersStatus =
      value['status'].toString().toTaxiOrderStatus();
  mezDbgPrint(
      'notif nuuuuuuuuuuuuuuuuuuuuuuuuuuuul :' + newOrdersStatus.toString());
  final Map<String, dynamic> dynamicFields =
      getTaxiOrderStatusFields(newOrdersStatus)!;
  mezDbgPrint(dynamicFields);
  return Notification(
      id: key,
      linkUrl: getTaxiOrderRoute(value['orderId']),
      linkText: _i18n()['viewOrder'],
      body: dynamicFields["body"],
      imgUrl: dynamicFields["imgUrl"],
      title: dynamicFields["title"],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.OrderStatusChange,
      notificationAction:
          value["notificationAction"].toString().toNotificationAction(),
      variableParams: value);
}

Notification restaurantOrderStatusChangeNotificationHandler(String key, value) {
  final RestaurantOrderStatus newOrdersStatus =
      value['status'].toString().toRestaurantOrderStatus();
  final Map<String, dynamic> dynamicFields =
      getRestaurantOrderStatusFields(newOrdersStatus)!;
  return Notification(
      id: key,
      linkUrl: getRestaurantOrderRoute(value['orderId']),
      linkText: _i18n()['viewOrder'],
      body: dynamicFields["body"],
      imgUrl: dynamicFields["imgUrl"],
      title: dynamicFields["title"],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.OrderStatusChange,
      notificationAction:
          value["notificationAction"].toString().toNotificationAction(),
      variableParams: value);
}

// TODO: needs to be formatted for laundry
Map<String, dynamic>? getLaundryOrderStatusFields(
    LaundryOrderStatus laundryOrderStatus) {
  switch (laundryOrderStatus) {
    case LaundryOrderStatus.OtwPickup:
      return <String, dynamic>{
        "title": "${_i18n()["laundryOtwPickupTitle"]}",
        "body": "${_i18n()["laundryOtwPickupBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
      };
    case LaundryOrderStatus.PickedUp:
      return <String, dynamic>{
        "title": "${_i18n()["laundryPickedTitle"]}",
        "body": "${_i18n()["laundryPickedBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/readyOrderNotificationIcon.png",
      };
    case LaundryOrderStatus.AtLaundry:
      return <String, dynamic>{
        "title": "${_i18n()["laundryAtLaundryTitle"]}",
        "body": "${_i18n()["laundryAtLaundryBody"]}",
        "imgUrl": "assets/images/shared/notifications/atLaundry.png",
      };
    case LaundryOrderStatus.ReadyForDelivery:
      return <String, dynamic>{
        "title": "${_i18n()["laundryReadyForDeliveryTitle"]}",
        "body": "${_i18n()["laundryReadyForDeliveryBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/readyOrderNotificationIcon.png",
      };
    case LaundryOrderStatus.OtwDelivery:
      return <String, dynamic>{
        "title": "${_i18n()["laundryOtwDeliveryTitle"]}",
        "body": "${_i18n()["laundryOtwDeliveryBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
      };
    case LaundryOrderStatus.Delivered:
      return <String, dynamic>{
        "title": "${_i18n()["laundryDeliveredTitle"]}",
        "body": "${_i18n()["laundryDeliveredTitle"]}",
        "imgUrl":
            "assets/images/shared/notifications/droppedOrderNotificationIcon.png",
      };
    case LaundryOrderStatus.CancelledByAdmin:
    case LaundryOrderStatus.CancelledByCustomer:
      return <String, dynamic>{
        "title": "${_i18n()["cancelledTitle"]}",
        "body": "${_i18n()["cancelledBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/cancelledOrderNotificationIcon.png",
      };
    default:
    // do nothing
  }
  return null;
}

Map<String, dynamic>? getRestaurantOrderStatusFields(
    RestaurantOrderStatus restaurantOrderStatus) {
  switch (restaurantOrderStatus) {
    case RestaurantOrderStatus.PreparingOrder:
      return <String, dynamic>{
        "title": "${_i18n()["preparingOrderTitle"]}",
        "body": "${_i18n()["preparingOrderBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/prepareOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.ReadyForPickup:
      return <String, dynamic>{
        "title": "${_i18n()["readyForPickUpTitle"]}",
        "body": "${_i18n()["readyForPickUpBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/readyOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.OnTheWay:
      return <String, dynamic>{
        "title": "${_i18n()["onTheWayRestaurantTitle"]}",
        "body": "${_i18n()["onTheWayRestaurantBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.Delivered:
      return <String, dynamic>{
        "title": "${_i18n()["deliveredTitle"]}",
        "body": "${_i18n()["deliveredBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/droppedOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.CancelledByAdmin:
      return <String, dynamic>{
        "title": "${_i18n()["cancelledTitle"]}",
        "body": "${_i18n()["cancelledBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/cancelledOrderNotificationIcon.png",
      };
    default:
    // do nothing
  }
  return null;
}

Map<String, dynamic>? getTaxiOrderStatusFields(
    TaxiOrdersStatus taxiOrdersStatus) {
  switch (taxiOrdersStatus) {
    case TaxiOrdersStatus.OnTheWay:
      return <String, dynamic>{
        "title": "${_i18n()["taxiOnTheWayTitle"]}",
        "body": "${_i18n()["taxiOnTheWayBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.InTransit:
      return <String, dynamic>{
        "title": "${_i18n()["taxiInTransitTitle"]}",
        "body": "${_i18n()["taxiInTransitBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.DroppedOff:
      return <String, dynamic>{
        "title": "${_i18n()["taxiDroppedOffTitle"]}",
        "body": "${_i18n()["taxiDroppedOffBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/droppedOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.CancelledByTaxi:
      return <String, dynamic>{
        "title": "${_i18n()["taxiCancelledTitle"]}",
        "body": "${_i18n()["taxiCancelledBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/cancelledOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.Expired:
      return <String, dynamic>{
        "title": "${_i18n()["taxiExpiredTitle"]}",
        "body": "${_i18n()["taxiExpiredBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/cancelledOrderNotificationIcon.png",
      };

    case TaxiOrdersStatus.ForwardingToLocalCompany:
      return <String, dynamic>{
        "title": "${_i18n()["taxiFwdToCompanyTitle"]}",
        "body": "${_i18n()["taxiFwdToCompanyBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.ForwardingUnsuccessful:
      return <String, dynamic>{
        "title": "${_i18n()["taxiFwdCancelledTitle"]}",
        "body": "${_i18n()["taxiFwdCancelledBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/cancelledOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.ForwardingSuccessful:
      return <String, dynamic>{
        "title": "${_i18n()["taxiFwdSuccessTitle"]}",
        "body": "${_i18n()["taxiFwdSuccessBody"]}",
        "imgUrl":
            "assets/images/shared/notifications/droppedOrderNotificationIcon.png",
      };
    default:
    // do nothing
  }
  return null;
}

Notification newMessageNotification(String key, value) {
  return Notification(
      id: key,
      linkUrl: (value['chatId'] == null)
          ? getMessageUrl(value['orderId']!)
          : getMessageUrl(value[
              'chatId']!), // just for backwards compatibility, future make it just value['orderId']
      body: value['message'],
      imgUrl: value['sender']['image'],
      title: value['sender']['name'],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.NewMessage,
      notificationAction:
          value["notificationAction"]?.toString().toNotificationAction() ??
              NotificationAction.ShowSnackbarOnlyIfNotOnPage,
      variableParams: value);
}

String getMessageUrl(String orderId) {
  switch (Get.find<OrderController>().getOrder(orderId)!.orderType) {
    case OrderType.Restaurant:
      return getRestaurantMessagesRoute(orderId);
    case OrderType.Taxi:
      return getTaxiMessagesRoute(orderId);
    case OrderType.Laundry:
      return getTaxiMessagesRoute(orderId);
    default:
      throw Exception('Invalid OrderType');
  }
}
