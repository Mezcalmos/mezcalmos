import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class RestaurantOrder extends Order {
  RestaurantOrderStatus restaurantOrderStatus;
  int quantity;
  List<RestaurantOrderItem> items = [];
  String? notes;
  dynamic from;
  RestaurantOrder(
      {required String orderId,
      required this.restaurantOrderStatus,
      required this.quantity,
      required String serviceProviderId,
      required PaymentType paymentType,
      required DateTime orderTime,
      required num cost,
      this.notes})
      : super(
            orderId: orderId,
            orderType: OrderType.Restaurant,
            serviceProviderId: serviceProviderId,
            paymentType: paymentType,
            orderTime: orderTime,
            cost: cost);
  factory RestaurantOrder.fromData(dynamic id, dynamic data) {
    RestaurantOrder restaurantOrder = RestaurantOrder(
        orderId: id,
        restaurantOrderStatus:
            convertRestaurantOrderStatusStringToEnum(data["status"]),
        quantity: data["quantity"],
        serviceProviderId: id,
        paymentType: convertPaymentType(data["paymentType"]),
        orderTime: DateTime.parse(data["orderTime"]),
        cost: data["cost"],
        notes: data["notes"]);
    data["items"].forEach((dynamic itemId, dynamic itemData) {
      RestaurantOrderItem restaurantOrderItem = RestaurantOrderItem(
          costPerOne: itemData["costPerOne"],
          totalCost: itemData["totalCost"],
          idInCart: itemId,
          idInRestaurant: itemData["id"],
          name: itemData["name"],
          image: itemData["image"],
          quantity: itemData["quantity"],
          notes: itemData["notes"]);
      itemData["options"]["chosenManyOptions"]
          .forEach((dynamic id, dynamic data) {
        restaurantOrderItem.chooseManyOptions.add(ChooseManyOption(
            optionId: id,
            optionName: data["name"],
            chosenValueCost: data["chosenValueCost"],
            chosenOptionValue: data["chosenValue"]));
      });
      itemData["options"]["chosenOneOptions"]
          .forEach((dynamic id, dynamic data) {
        restaurantOrderItem.chooseOneOptions.add(ChooseOneOption(
            optionId: id,
            optionName: data["name"],
            chosenOptionId: data["chosenOptionId"],
            chosenOptionCost: data["chosenOptionCost"],
            chosenOptionName: data["chosenOptionName"]));
      });
      restaurantOrder.items.add(restaurantOrderItem);
    });
    return restaurantOrder;
  }

  String get restaurantId => this.serviceProviderId!;
  @override
  bool inProcess() {
    return restaurantOrderStatus == RestaurantOrderStatus.PreparingOrder ||
        restaurantOrderStatus == RestaurantOrderStatus.ReadyForPickup ||
        restaurantOrderStatus == RestaurantOrderStatus.OnTheWay;
  }
}

class RestaurantOrderItem {
  num costPerOne;
  num totalCost;
  String idInCart;
  String idInRestaurant;
  String name;
  String image;
  int quantity;
  String? notes;
  List<ChooseManyOption> chooseManyOptions = [];
  List<ChooseOneOption> chooseOneOptions = [];
  RestaurantOrderItem(
      {required this.costPerOne,
      required this.totalCost,
      required this.idInCart,
      required this.idInRestaurant,
      required this.name,
      required this.image,
      required this.quantity,
      this.notes});
}

class ChooseOneOption {
  String optionId;
  String optionName;
  String chosenOptionId;
  String chosenOptionName;
  num chosenOptionCost;
  ChooseOneOption(
      {required this.optionId,
      required this.optionName,
      required this.chosenOptionId,
      required this.chosenOptionCost,
      required this.chosenOptionName});
}

class ChooseManyOption {
  String optionId;
  String optionName;
  bool chosenOptionValue;
  num chosenValueCost;
  ChooseManyOption(
      {required this.optionId,
      required this.optionName,
      required this.chosenValueCost,
      required this.chosenOptionValue});
}

enum RestaurantOrderStatus {
  PreparingOrder,
  ReadyForPickup,
  OnTheWay,
  Delivered,
  Cancelled
}

extension ParseRestaurantOrderStatusToString on RestaurantOrderStatus {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

RestaurantOrderStatus convertRestaurantOrderStatusStringToEnum(
    String restaurantOrderStatus) {
  return RestaurantOrderStatus.values
      .firstWhere((e) => e.toFirebaseFormatString() == restaurantOrderStatus);
}
