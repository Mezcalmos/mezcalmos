class AuthResponse {
  String? token;
  AuthResponse(this.token);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "token": token};
  }
factory AuthResponse.fromFirebaseFormattedJson(dynamic json) { 
   return AuthResponse(json["token"]);
  }
}

enum OrderType { Taxi, Restaurant, Laundry, Water }
extension ParseOrderTypeToString on OrderType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

class PaymentIntentResponse {
  String? paymentIntent;
  String? ephemeralKey;
  String? customer;
  String publishableKey;
  String stripeAccountId;
  PaymentIntentResponse(this.paymentIntent, this.ephemeralKey, this.customer, this.publishableKey, this.stripeAccountId);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "paymentIntent": paymentIntent,
      "ephemeralKey": ephemeralKey,
      "customer": customer,
      "publishableKey": publishableKey,
      "stripeAccountId": stripeAccountId};
  }
factory PaymentIntentResponse.fromFirebaseFormattedJson(dynamic json) { 
   return PaymentIntentResponse(json["paymentIntent"], json["ephemeralKey?"], json["customer?"], json["publishableKey"], json["stripeAccountId"]);
  }
}

class AddCardResponse {
  String cardId;
  AddCardResponse(this.cardId);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "cardId": cardId};
  }
factory AddCardResponse.fromFirebaseFormattedJson(dynamic json) { 
   return AddCardResponse(json["cardId"]);
  }
}

class ChargeCardResponse {
  String? paymentIntent;
  String customer;
  String publishableKey;
  String stripeAccountId;
  ChargeCardResponse(this.paymentIntent, this.customer, this.publishableKey, this.stripeAccountId);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "paymentIntent": paymentIntent,
      "customer": customer,
      "publishableKey": publishableKey,
      "stripeAccountId": stripeAccountId};
  }
factory ChargeCardResponse.fromFirebaseFormattedJson(dynamic json) { 
   return ChargeCardResponse(json["paymentIntent"], json["customer"], json["publishableKey"], json["stripeAccountId"]);
  }
}

class SetupResponse {
  String object;
  num created;
  num expires_at;
  String url;
  SetupResponse(this.object, this.created, this.expires_at, this.url);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "object": object,
      "created": created,
      "expires_at": expires_at,
      "url": url};
  }
factory SetupResponse.fromFirebaseFormattedJson(dynamic json) { 
   return SetupResponse(json["object"], json["created"], json["expires_at"], json["url"]);
  }
}

enum ParticipantType { Customer, Taxi, DeliveryOperator, DeliveryDriver, LaundryOperator, RestaurantOperator, MezAdmin }
extension ParseParticipantTypeToString on ParticipantType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

class CallUserResponse {
  num uid;
  String token;
  String? name;
  String? image;
  String expirationTime;
  ParticipantType participantType;
  NotificationInfo? notificationInfo;
  CallUserResponse(this.uid, this.token, this.name, this.image, this.expirationTime, this.participantType, this.notificationInfo);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "uid": uid,
      "token": token,
      "name": name,
      "image": image,
      "expirationTime": expirationTime,
      "participantType": participantType,
      "notificationInfo": notificationInfo};
  }
factory CallUserResponse.fromFirebaseFormattedJson(dynamic json) { 
   return CallUserResponse(json["uid"], json["token"], json["name?"], json["image?"], json["expirationTime"], json["participantType"], json["notificationInfo"]);
  }
}

class Location {
  num lat;
  num lng;
  String? address;
  Location(this.lat, this.lng, this.address);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "lat": lat,
      "lng": lng,
      "address": address};
  }

}

class DeliveryDetails {
  num minimumCost;
  num costPerKm;
  num radius;
  num? freeDeliveryMinimumCost;
  num? freeDeliveryKmRange;
  DeliveryDetails(this.minimumCost, this.costPerKm, this.radius, this.freeDeliveryMinimumCost, this.freeDeliveryKmRange);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "minimumCost": minimumCost,
      "costPerKm": costPerKm,
      "radius": radius,
      "freeDeliveryMinimumCost": freeDeliveryMinimumCost,
      "freeDeliveryKmRange": freeDeliveryKmRange};
  }

}

enum Language { EN, ES }
extension ParseLanguageToString on Language {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

enum CustomerAppType { Native, Web }
extension ParseCustomerAppTypeToString on CustomerAppType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

enum PaymentType { Cash, Card, BankTransfer }
extension ParsePaymentTypeToString on PaymentType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

enum DeliveryType { Pickup, Delivery }
extension ParseDeliveryTypeToString on DeliveryType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

class CheckoutResponse {
  num orderId;
  CheckoutResponse(this.orderId);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "orderId": orderId};
  }
factory CheckoutResponse.fromFirebaseFormattedJson(dynamic json) { 
   return CheckoutResponse(json["orderId"]);
  }
}

class NotificationInfo {
  String token;
  bool turnOffNotifications;
  AppType appType;
  NotificationInfo(this.token, this.turnOffNotifications, this.appType);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "token": token,
      "turnOffNotifications": turnOffNotifications,
      "appType": appType};
  }

}

class ReqLaundryResponse {
  num orderId;
  ReqLaundryResponse(this.orderId);
Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "orderId": orderId};
  }
factory ReqLaundryResponse.fromFirebaseFormattedJson(dynamic json) { 
   return ReqLaundryResponse(json["orderId"]);
  }
}

enum DeliveryOrderStatus { OrderReceived, OnTheWayToPickup, PackageReady, AtPickup, OnTheWayToDropoff, AtDropoff, Delivered, CancelledByCustomer, CancelledByDeliverer, CancelledByServiceProvider }
extension ParseDeliveryOrderStatusToString on DeliveryOrderStatus {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

enum AppType { Customer, RestaurantApp, DeliveryApp, DeliveryAdmin, MezAdmin, LaundryApp }
extension ParseAppTypeToString on AppType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

