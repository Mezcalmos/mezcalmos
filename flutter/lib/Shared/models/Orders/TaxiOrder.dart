import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as locationLibrary;
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

enum TaxiOrdersStatus {
  DroppedOff,
  CancelledByCustomer,
  CancelledByTaxi,
  Expired,
  OnTheWay,
  InTransit,
  LookingForTaxi
}

extension ParseOrderStatusToString on TaxiOrdersStatus {
  String toFirebaseFormatString() {
    return this.toString().split('.').last;
  }
}

extension ParseStringToOrderStatus on String {
  TaxiOrdersStatus toTaxiOrderStatus() {
    return TaxiOrdersStatus.values.firstWhere(
        (e) => e.toFirebaseFormatString().toLowerCase() == this.toLowerCase());
  }
}

class RouteInformation {
  String polyline;
  RideDistance distance;
  RideDuration duration;
  RouteInformation(this.polyline, this.distance, this.duration);
}

class TaxiOrder extends Order {
  num cost;
  Location from;
  RouteInformation routeInformation;
  String? acceptRideTime;
  String? rideFinishTime;
  String? rideStartTime;
  TaxiOrdersStatus status;
  double distanceToClient = 0;
  TaxiUserInfo? get driver => this.serviceProvider as TaxiUserInfo;
  TaxiOrder(
      {required String orderId,
      required this.cost,
      required this.from,
      required Location to,
      required DateTime orderTime,
      required PaymentType paymentType,
      required this.routeInformation,
      TaxiUserInfo? driver,
      required this.acceptRideTime,
      required this.rideFinishTime,
      required this.rideStartTime,
      required this.status,
      required UserInfo customer,
      dynamic cancelledBy})
      : super(
            orderTime: orderTime,
            orderId: orderId,
            paymentType: paymentType,
            orderType: OrderType.Taxi,
            cost: 0,
            customer: customer,
            serviceProvider: driver,
            to: to);
  // Get props as list.
  List<Object> get props =>
      [orderId, from, to, orderTime, paymentType, routeInformation];

  /// Convert [TaxiOrder] object to [TaxiRequest] object.
  TaxiRequest toTaxiRequest() {
    return TaxiRequest(
        from: from,
        to: to,
        routeInformation: this.routeInformation,
        estimatedPrice: cost as int,
        paymentType: paymentType);
  }

  /// Update this model from [TaxiRequest] object
  void updateFromTaxiRequest(TaxiRequest taxiRequest) {
    this.from = taxiRequest.from!;
    this.to = taxiRequest.to!;
    this.routeInformation = RouteInformation(
        taxiRequest.routeInformation!.polyline,
        taxiRequest.routeInformation!.distance,
        taxiRequest.routeInformation!.duration);
    this.cost = taxiRequest.estimatedPrice;
    this.paymentType = taxiRequest.paymentType;
  }

  factory TaxiOrder.fromData(dynamic id, dynamic data) {
    mezDbgPrint("FROOOOOOM => ${data['from']}");
    mezDbgPrint("TOOOOOO => ${data['to']}");
    mezDbgPrint("DRIVER => ${data["driver"]}");

    TaxiOrder taxiOrder = TaxiOrder(
        orderId: id,
        driver: (data["driver"] != null)
            ? TaxiUserInfo.fromData(data["driver"])
            : null,
        customer: UserInfo.fromData(data["customer"]),
        rideFinishTime: data['rideFinishTime'],
        rideStartTime: data['rideStartTime'],
        status: data['status'].toString().toTaxiOrderStatus(),
        acceptRideTime: data['acceptRideTime'],
        cost: data['cost'],
        // from: Location("", LocationData.fromMap({"lat":})),
        from: Location.fromFirebaseData(data['from']),
        to: Location.fromFirebaseData(data['to']),
        orderTime: DateTime.parse(data["orderTime"]),
        paymentType: data["paymentType"].toString().toPaymentType(),
        routeInformation: RouteInformation(
            data['routeInformation']['polyline'],
            RideDistance.fromJson(data['routeInformation']['distance']),
            RideDuration.fromJson(data['routeInformation']['duration'])));
    return taxiOrder;
  }

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJsSon() => {
        "customer": customer,
        "estimatedPrice": cost,
        "from": from,
        "status": status,
        "to": to,
        "orderTime": orderTime,
        "paymentType": paymentType,
        "routeInformation": routeInformation,
        "distanceToClient": distanceToClient
      };

  @override
  bool inProcess() {
    return status == TaxiOrdersStatus.InTransit ||
        status == TaxiOrdersStatus.LookingForTaxi ||
        status == TaxiOrdersStatus.OnTheWay;
  }
}

class TaxiUserInfo extends UserInfo {
  String taxiNumber;
  String? sitio;
  LatLng? location;

  TaxiUserInfo(
      {required String id,
      required String name,
      required String image,
      required this.taxiNumber,
      this.sitio,
      required this.location})
      : super(id, name, image);

  factory TaxiUserInfo.fromData(dynamic data) {
    mezDbgPrint(" TaxiUserInfo.fromData ====> $data");
    LatLng? location = data["location"] != null
        ? LatLng(data["location"]["position"]["lat"],
            data["location"]["position"]["lng"])
        : null;
    return TaxiUserInfo(
        id: data["id"],
        name: data["name"],
        image: data["image"],
        taxiNumber: data["taxiNumber"],
        sitio: data["sitio"],
        location: location);
  }
}
