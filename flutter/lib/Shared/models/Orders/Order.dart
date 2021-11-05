import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

abstract class Order {
  String orderId;
  OrderType orderType;
  String? serviceProviderId;
  PaymentType paymentType;
  DateTime orderTime;
  num cost;
  Order(
      {required this.orderId,
      required this.orderType,
      this.serviceProviderId,
      required this.paymentType,
      required this.orderTime,
      required this.cost});
  bool inProcess();
  // Order.orderFromData(dynamic orderId, dynamic orderData){

}

enum OrderType { Taxi, Restaurant, Laundry, Water }

extension ParseOrderTypeToString on OrderType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

OrderType convertOrderTypeStringToEnum(String orderType) {
  return OrderType.values
      .firstWhere((e) => e.toFirebaseFormatString().toLowerCase() == orderType);
}

enum PaymentType { Cash, Card }

extension ParsePaymentTypeToString on PaymentType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

PaymentType convertPaymentType(String paymentType) {
  return PaymentType.values.firstWhere((e) =>
      e.toFirebaseFormatString().toLowerCase() == paymentType.toLowerCase());
}

class ServiceProviderInfo {
  String id;
  String name;
  String image;
  ServiceProviderInfo(this.id, this.name, this.image);
  factory ServiceProviderInfo.fromData(dynamic data) {
    return ServiceProviderInfo(data["id"], data["name"], data["image"]);
  }
}
