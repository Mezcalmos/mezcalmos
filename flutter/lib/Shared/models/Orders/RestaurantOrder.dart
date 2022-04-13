import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/User.dart';

//ignore_for_file:constant_identifier_names
enum RestaurantOrderStatus {
  OrderReceieved,
  PreparingOrder,
  ReadyForPickup,
  OnTheWay,
  Delivered,
  CancelledByAdmin,
  CancelledByCustomer
}

extension ParseRestaurantOrderStatusToString on RestaurantOrderStatus {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToRestaurantOrderStatus on String {
  RestaurantOrderStatus toRestaurantOrderStatus() {
    return RestaurantOrderStatus.values.firstWhere(
        (RestaurantOrderStatus e) => e.toFirebaseFormatString() == this);
  }
}

class RestaurantOrder extends DeliverableOrder {
  int quantity;
  num itemsCost;
  num shippingCost;
  List<RestaurantOrderItem> items = <RestaurantOrderItem>[];
  String? notes;
  RestaurantOrderStatus status;
  ServiceInfo get restaurant => serviceProvider! as ServiceInfo;
  RestaurantOrder(
      {required String orderId,
      required this.status,
      required this.quantity,
      required String serviceProviderId,
      required PaymentType paymentType,
      required DateTime orderTime,
      required num cost,
      required ServiceInfo restaurant,
      required UserInfo customer,
      required Location to,
      DeliveryDriverUserInfo? dropoffDriver,
      String? dropOffDriverChatId,
      required this.itemsCost,
      required this.shippingCost,
      this.notes})
      : super(
            orderId: orderId,
            orderType: OrderType.Restaurant,
            serviceProviderId: serviceProviderId,
            paymentType: paymentType,
            orderTime: orderTime,
            cost: cost,
            customer: customer,
            serviceProvider: restaurant,
            to: to,
            dropoffDriver: dropoffDriver,
            dropOffDriverChatId: dropOffDriverChatId);

  //ignore_for_file:avoid_annotating_with_dynamic
  factory RestaurantOrder.fromData(dynamic id, dynamic data) {
    final RestaurantOrder restaurantOrder = RestaurantOrder(
        orderId: id,
        status: data["status"].toString().toRestaurantOrderStatus(),
        quantity: data["quantity"],
        serviceProviderId: data["serviceProviderId"],
        paymentType: data["paymentType"].toString().toPaymentType(),
        orderTime: DateTime.parse(data["orderTime"]),
        cost: data["cost"],
        notes: data["notes"],
        to: Location.fromFirebaseData(data['to']),
        restaurant: ServiceInfo.fromData(data["restaurant"]),
        customer: UserInfo.fromData(data["customer"]),
        itemsCost: data['itemsCost'],
        shippingCost: data['shippingCost'],
        dropoffDriver: (data["dropoffDriver"] != null)
            ? DeliveryDriverUserInfo.fromData(data["dropoffDriver"])
            : null,
        dropOffDriverChatId: data['secondaryChats']
            ?['deliveryAdminDropOffDriver']);
    data["items"].forEach((dynamic itemId, dynamic itemData) {
      final RestaurantOrderItem restaurantOrderItem = RestaurantOrderItem(
          costPerOne: itemData["costPerOne"],
          totalCost: itemData["totalCost"],
          idInCart: itemId,
          idInRestaurant: itemData["id"],
          name: convertToLanguageMap(itemData["name"]),
          image: itemData["image"],
          quantity: itemData["quantity"],
          notes: itemData["notes"]);
      itemData["options"]?["chosenManyOptions"]
          ?.forEach((dynamic id, dynamic data) {
        restaurantOrderItem.chooseManyOptions.add(ChooseManyOption(
            optionId: id,
            optionName: convertToLanguageMap(data["name"]),
            chosenValueCost: data["chosenValueCost"],
            chosenOptionValue: data["chosenValue"]));
      });
      itemData["options"]?["chosenOneOptions"]
          ?.forEach((dynamic id, dynamic data) {
        restaurantOrderItem.chooseOneOptions.add(ChooseOneOption(
            optionId: id,
            optionName: convertToLanguageMap(data["name"]),
            chosenOptionId: data["chosenOptionId"],
            chosenOptionCost: data["chosenOptionCost"],
            chosenOptionName: convertToLanguageMap(data["chosenOptionName"])));
      });
      restaurantOrder.items.add(restaurantOrderItem);
    });
    return restaurantOrder;
  }

  String get restaurantId => serviceProviderId!;

  @override
  bool isCanceled() {
    return status == RestaurantOrderStatus.CancelledByCustomer ||
        status == RestaurantOrderStatus.CancelledByAdmin;
  }

  @override
  bool inProcess() {
    return status == RestaurantOrderStatus.OrderReceieved ||
        status == RestaurantOrderStatus.PreparingOrder ||
        status == RestaurantOrderStatus.ReadyForPickup ||
        status == RestaurantOrderStatus.OnTheWay;
  }

  bool inDeliveryPhase() {
    return status == RestaurantOrderStatus.ReadyForPickup ||
        status == RestaurantOrderStatus.OnTheWay;
  }

  String clipBoardText(LanguageType languageType) {
    String text = "";
    text += "${restaurant.name}\n";
    text +=
        items.fold<String>("", (String mainString, RestaurantOrderItem item) {
      mainString +=
          "  ${item.name[languageType]} x${item.quantity} ${item.totalCost}\n";
      mainString += item.chooseOneOptions.fold("",
          (String secondString, ChooseOneOption chooseOneOption) {
        return "$secondString    ${chooseOneOption.optionName[languageType]}: ${chooseOneOption.chosenOptionName[languageType]}\n";
      });
      mainString += item.chooseManyOptions.fold("",
          (String secondString, ChooseManyOption chooseManyOption) {
        mezDbgPrint(chooseManyOption.optionName[languageType]);
        return "$secondString    ${chooseManyOption.optionName[languageType]}\n";
      });
      mainString += "    ${item.notes}\n";
      return mainString;
    });
    text += "$notes\n";
    text += "$cost\n";
    text += "${customer.name}\n";
    text += "${to.address}\n";
    text +=
        "https://www.google.com/maps/dir/?api=1&destination=${to.latitude},${to.longitude}";
    mezDbgPrint(text);
    return text;
  }
}

class RestaurantOrderItem {
  num costPerOne;
  num totalCost;
  String idInCart;
  String idInRestaurant;
  Map<LanguageType, String> name;
  String image;
  int quantity;
  String? notes;
  List<ChooseManyOption> chooseManyOptions = <ChooseManyOption>[];
  List<ChooseOneOption> chooseOneOptions = <ChooseOneOption>[];
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
  Map<LanguageType, String> optionName;
  String chosenOptionId;
  Map<LanguageType, String> chosenOptionName;
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
  Map<LanguageType, String> optionName;
  bool chosenOptionValue;
  num chosenValueCost;
  ChooseManyOption(
      {required this.optionId,
      required this.optionName,
      required this.chosenValueCost,
      required this.chosenOptionValue});
}
