import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';

Notification customerNotificationHandler(String key, dynamic value) {
  NotificationType notificationType =
      value['notificationType'].toString().toNotificationType();
  switch (notificationType) {
    case NotificationType.NewMessage:
      return newMessageNotification(key, value);
    case NotificationType.OrderStatusChange:
      OrderType orderType = value['orderType'].toString().toOrderType();
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

Notification laundryOrderStatusChangeNotificationHandler(
    String key, dynamic value) {
  LaundryOrderStatus newOrdersStatus =
      value['status'].toString().toLaundryOrderStatus();
  mezDbgPrint(newOrdersStatus);
  Map<String, dynamic> dynamicFields =
      getLaundryOrderStatusFields(newOrdersStatus)!;
  mezDbgPrint(dynamicFields);
  return Notification(
      id: key,
      linkUrl: getTaxiOrderRoute(value['orderId']),
      linkText: Get.find<LanguageController>().strings['shared']['notification']
          ['viewOrder'],
      body: dynamicFields["body"],
      imgUrl: dynamicFields["imgUrl"],
      title: dynamicFields["title"],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.OrderStatusChange,
      notificationAction:
          value["notificationAction"].toString().toNotificationAction(),
      variableParams: value);
}

Notification taxiOrderStatusChangeNotificationHandler(
    String key, dynamic value) {
  TaxiOrdersStatus newOrdersStatus =
      value['status'].toString().toTaxiOrderStatus();
  mezDbgPrint(
      'notif nuuuuuuuuuuuuuuuuuuuuuuuuuuuul :' + newOrdersStatus.toString());
  Map<String, dynamic> dynamicFields =
      getTaxiOrderStatusFields(newOrdersStatus)!;
  mezDbgPrint(dynamicFields);
  return Notification(
      id: key,
      linkUrl: getTaxiOrderRoute(value['orderId']),
      linkText: Get.find<LanguageController>().strings['shared']['notification']
          ['viewOrder'],
      body: dynamicFields["body"],
      imgUrl: dynamicFields["imgUrl"],
      title: dynamicFields["title"],
      timestamp: DateTime.parse(value['time']),
      notificationType: NotificationType.OrderStatusChange,
      notificationAction:
          value["notificationAction"].toString().toNotificationAction(),
      variableParams: value);
}

Notification restaurantOrderStatusChangeNotificationHandler(
    String key, dynamic value) {
  RestaurantOrderStatus newOrdersStatus =
      value['status'].toString().toRestaurantOrderStatus();
  Map<String, dynamic> dynamicFields =
      getRestaurantOrderStatusFields(newOrdersStatus)!;
  return Notification(
      id: key,
      linkUrl: getRestaurantOrderRoute(value['orderId']),
      linkText: Get.find<LanguageController>().strings['shared']['notification']
          ['viewOrder'],
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
  LanguageController lang = Get.find<LanguageController>();
  switch (laundryOrderStatus) {
    case LaundryOrderStatus.OrderReceieved:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["preparingOrder"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["preparingOrder"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/prepareOrderNotificationIcon.png",
      };
    case LaundryOrderStatus.OtwPickup:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["readyForPickup"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["readyForPickup"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/readyOrderNotificationIcon.png",
      };
    case LaundryOrderStatus.PickedUp:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["onTheWayRestaurant"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["onTheWayRestaurant"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
      };
    case LaundryOrderStatus.AtLaundry:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["delivered"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["delivered"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/droppedOrderNotificationIcon.png",
      };
    case LaundryOrderStatus.ReadyForDelivery:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["preparingOrder"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["preparingOrder"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/prepareOrderNotificationIcon.png",
      };
    case LaundryOrderStatus.OtwDelivery:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["readyForPickup"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["readyForPickup"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/readyOrderNotificationIcon.png",
      };
    case LaundryOrderStatus.Delivered:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["onTheWayRestaurant"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["onTheWayRestaurant"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
      };
    case LaundryOrderStatus.CancelledByAdmin:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["cancelled"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["cancelled"]["body"]}",
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
  LanguageController lang = Get.find<LanguageController>();
  switch (restaurantOrderStatus) {
    case RestaurantOrderStatus.PreparingOrder:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["preparingOrder"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["preparingOrder"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/prepareOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.ReadyForPickup:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["readyForPickup"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["readyForPickup"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/readyOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.OnTheWay:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["onTheWayRestaurant"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["onTheWayRestaurant"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.Delivered:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["delivered"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["delivered"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/droppedOrderNotificationIcon.png",
      };
    case RestaurantOrderStatus.CancelledByAdmin:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["cancelled"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["cancelled"]["body"]}",
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
  LanguageController lang = Get.find<LanguageController>();
  switch (taxiOrdersStatus) {
    case TaxiOrdersStatus.OnTheWay:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["onTheWayTaxi"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["onTheWayTaxi"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.InTransit:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["inTransit"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["inTransit"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.DroppedOff:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["droppedOff"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["droppedOff"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/droppedOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.CancelledByTaxi:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["cancelled"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["cancelled"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/cancelledOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.Expired:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["expired"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["expired"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/cancelledOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.ForwardingToLocalCompany:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["fwdCompany"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["fwdCompany"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/onTheWayOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.ForwardingUnsuccessful:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["fwdCancelled"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["fwdCancelled"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/cancelledOrderNotificationIcon.png",
      };
    case TaxiOrdersStatus.ForwardingSuccessful:
      return <String, dynamic>{
        "title":
            "${lang.strings["shared"]["notification"]["notificationType"]["fwdSuccess"]["title"]}",
        "body":
            "${lang.strings["shared"]["notification"]["notificationType"]["fwdSuccess"]["body"]}",
        "imgUrl":
            "assets/images/shared/notifications/droppedOrderNotificationIcon.png",
      };
    default:
    // do nothing
  }
  return null;
}

Notification newMessageNotification(String key, dynamic value) {
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
