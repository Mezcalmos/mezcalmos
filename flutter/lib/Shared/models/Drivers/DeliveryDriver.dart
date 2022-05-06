import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/User.dart';

class DeliveryDriverState {
  bool isAuthorized;
  bool isOnline;
  DeliveryDriverState({required this.isAuthorized, required this.isOnline});

  factory DeliveryDriverState.fromSnapshot(data) {
    final bool isAuthorized =
        data == null ? false : data['authorizationStatus'] == "authorized";
    final bool isOnline = data == null ? false : data['isOnline'] == true;
    return DeliveryDriverState(isAuthorized: isAuthorized, isOnline: isOnline);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        "authorizationStatus": isAuthorized,
        "isOnline": isOnline,
      };
}

// used by delivery admin app
class DeliveryDriver {
  DeliveryDriverState deliveryDriverState;
  DeliveryDriverUserInfo driverInfo;
  LatLng driverLocation;
  DateTime? lastLocationUpdateTime;
  String deliveryDriverId;

  DeliveryDriver(
      {required this.deliveryDriverState,
      required this.driverLocation,
      required this.lastLocationUpdateTime,
      required this.deliveryDriverId,
      required this.driverInfo});

  factory DeliveryDriver.fromData(String deliveryDriverId, deliveryDriverData) {
    final DeliveryDriverState deliveryDriverState =
        DeliveryDriverState.fromSnapshot(deliveryDriverData['state']);
    final DeliveryDriverUserInfo deliveryDriverUserInfo =
        DeliveryDriverUserInfo.fromData(deliveryDriverData['info']);
    final dynamic driverLocation = deliveryDriverData['location'] == null
        ? null
        : LatLng(deliveryDriverData["location"]["position"]["lat"],
            deliveryDriverData["location"]["position"]["lng"]);
    final DateTime? lastLocationUpdateTime =
        deliveryDriverData['location'] == null
            ? null
            : DateTime.parse(deliveryDriverData['location']['lastUpdateTime']);
    return DeliveryDriver(
        deliveryDriverId: deliveryDriverId,
        deliveryDriverState: deliveryDriverState,
        driverLocation: driverLocation,
        lastLocationUpdateTime: lastLocationUpdateTime,
        driverInfo: deliveryDriverUserInfo);
  }

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => {
        "authorizationStatus": deliveryDriverState.isAuthorized,
        "isOnline": deliveryDriverState.isOnline,
        "driverLocation": driverLocation.toJson(),
        "lastLocationUpdateTime":
            lastLocationUpdateTime?.toUtc().toIso8601String()
      };
}

class DeliveryDriverUserInfo extends UserInfo {
  LatLng? location;

  DeliveryDriverUserInfo(
      {required String id,
      required String name,
      required String image,
      this.location,
      LanguageType? language})
      : super(id: id, name: name, image: image, language: language);

  factory DeliveryDriverUserInfo.fromData(data) {
    final LatLng? location = data["location"] != null
        ? LatLng(data["location"]["position"]["lat"],
            data["location"]["position"]["lng"])
        : null;
    final LanguageType? language = data["language"] != null
        ? data["language"].toString().toLanguageType()
        : null;
    return DeliveryDriverUserInfo(
        id: data["id"],
        name: data["name"],
        image: data["image"],
        location: location ?? null,
        language: language);
  }
}

// ignore: constant_identifier_names
enum DeliveryDriverType { Pickup, DropOff }

extension ParseDeliveryDriverTypeToString on DeliveryDriverType {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1).toLowerCase();
  }
}

extension ParseStringToDeliveryDriverType on String {
  DeliveryDriverType toDeliveryDriverType() {
    return DeliveryDriverType.values.firstWhere((DeliveryDriverType e) =>
        e.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}
