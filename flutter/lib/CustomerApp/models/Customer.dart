import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';

class Customer {
  // List<Order> currentOrders = [];
  String? appVersion;
  dynamic notificationInfo;
  List<SavedLocation> savedLocations = <SavedLocation>[];
  dynamic data;

  Customer.fromSnapshotData(dynamic data) {
    appVersion = data?["versionNumber"] ?? null;
    notificationInfo = data?["notificationInfo"];
    final List<SavedLocation> newSavedLocations = <SavedLocation>[];

    mezDbgPrint("SavedLocations ===> ${data?["savedLocations"]}");
    if (data["savedLocations"] != null) {
      Map<String, dynamic>.from(data?["savedLocations"])
          .entries
          .forEach((entry) {
        savedLocations.add(
          SavedLocation.fromData(id: entry.key, data: entry.value),
        );
      });
    }
    // for (var locationId in ) {
    //   dynamic locationData = data["savedLocations"][locationId];
    //   newSavedLocations
    //       .add(SavedLocation.fromData(id: locationId, data: locationData));
    // }
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{"notificationInfo": notificationInfo};
  }

  SavedLocation? getLocation(String locationId) {
    try {
      return savedLocations.firstWhere(
        (SavedLocation savedLocation) => savedLocation.id == locationId,
      );
    } on StateError {
      return null;
    }
  }
}

class SavedLocation {
  String name;
  String? id;
  Location? location;

  SavedLocation({
    required this.name,
    this.location,
    this.id,
  });

  factory SavedLocation.fromData({
    required String id,
    required dynamic data,
  }) {
    return SavedLocation(
      name: data["name"],
      location: Location.fromFirebaseData(data),
      id: id,
    );
  }

  Map<String, dynamic> toFirebaseFormattedJson() {
    final Map<String, dynamic> json = (location != null)
        ? location!.toFirebaseFormattedJson()
        : <String, dynamic>{};

    json["name"] = name;
    return json;
  }
}
