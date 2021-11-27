import 'dart:convert';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'dart:math' show cos, sqrt, sin, pi, atan2, pow;
import 'package:http/http.dart' as http;
import 'package:mezcalmos/Shared/models/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

typedef LocationChangesNotifier = void Function(LocModel.Location? location);
enum SearchComponentType { From, To, None }

class RideDistance {
  String distanceStringInKm;
  int distanceInMeters;
  RideDistance(this.distanceStringInKm, this.distanceInMeters);

  Map<String, dynamic> toJson() {
    return {
      "distance": {
        "text": this.distanceStringInKm,
        "value": this.distanceInMeters
      }
    };
  }

  RideDistance.fromJson(Map<String, dynamic> data)
      : this.distanceStringInKm = data['text'],
        this.distanceInMeters = data['value'];
}

class RideDuration {
  String daysHoursString;
  int seconds;
  RideDuration(this.daysHoursString, this.seconds);
  Map<String, dynamic> toJson() {
    return {
      "duration": {"text": this.daysHoursString, "value": this.seconds}
    };
  }

  RideDuration.fromJson(Map<String, dynamic> data)
      : this.daysHoursString = data['text'],
        this.seconds = data['value'];
}

class MapHelper {
  static int getEstimatedRidePriceInPesos(int distanceInMeteres) {
    // 35 is always the minimum possible price !
    return 35;
  }

  static Future<LocModel.Location> getCurrentLocation() async {
    LocationData res = (await Location().getLocation());
    mezDbgPrint("Got current loc ====> $res");
    return LocModel.Location("", res);
  }

  /// This is for AutoComplete location Search !
  static Future<Map<String, String>> getLocationsSuggestions(
      String search) async {
    LanguageController _lang = Get.find<LanguageController>();
    String url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&language=${_lang.userLanguageKey}&components=country:mx&key=$placesApikey";

    http.Response resp = await http.get(Uri.parse(url));
    Map<String, dynamic> respJson = json.decode(resp.body);
    Map<String, String> _returnedPredictions = <String, String>{};

    if (respJson["status"] == "OK") {
      respJson["predictions"].forEach((pred) {
        if (pred["description"].toLowerCase().contains(search.toLowerCase())) {
          _returnedPredictions[pred["place_id"]] = pred["description"];
        }
      });
    }

    return _returnedPredictions;
  }

  /// This calls Places API with a [PlaceID] that can be fetched through [getLocationsSuggestions()] and returns [Location] !
  static Future<LocModel.Location?> getLocationFromPlaceId(
      String placeId) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=$placesApikey";
    http.Response resp = await http.get(Uri.parse(url));
    Map<String, dynamic> respJson = json.decode(resp.body);

    if (respJson["status"] == "OK") {
      double lat = respJson["result"]["geometry"]["location"]["lat"];
      double lng = respJson["result"]["geometry"]["location"]["lng"];
      String address = respJson["result"]["formatted_address"];

      return LocModel.Location.fromFirebaseData(
          {"address": address, "lat": lat, "lng": lng});
    } else {
      return null;
      // in case there is a problem on request!
      // _controller.clear();
    }
  }

  /// Get Address [String] from Lat , Lng!
  static Future<String?> getAdressFromLatLng(LatLng latlng) async {
    //TODO: ALL HTTP CALLS MUST BE IMPLEMENTED INSIDE OF A TRY CATCH BLOCK!
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${latlng.latitude},${latlng.longitude}&key=$placesApikey";

    mezDbgPrint(url);

    http.Response resp = await http.get(Uri.parse(url));
    Map<String, dynamic> respJson = json.decode(resp.body);

    if (respJson["status"] == "OK") {
      mezDbgPrint(respJson);
      String address = respJson["results"][0]["formatted_address"];
      return address;
    } else {
      return null;
    }
  }

  /// returns a Map {"distance" : { "text" : [in km] , "value": [in Meters]} , "duration": {"text" : [in days:h] , value : [in Seconds]}}
  static Future<Map<String, dynamic>> getDurationAndDistance(
      LocModel.Location from, LocModel.Location to) async {
    //units=metric => this is so we can get distances in km , cuz default is miles !
    /// Note : distance.text is in [KM] while distance.value is in [M]!
    String url =
        "https://maps.googleapis.com/maps/api/directions/json?units=metric&region=mx&destination=${to.latitude}%2C${to.longitude}&origin=${from.latitude}%2C${from.longitude}&key=$placesApikey";
    http.Response resp = await http.get(Uri.parse(url));
    Map<String, dynamic> respJson = json.decode(resp.body);

    if (respJson["status"] == "OK") {
      var distance = respJson["routes"]?[0]?["legs"]?[0]?["distance"] ?? {};
      var duration = respJson["routes"]?[0]?["legs"]?[0]?["duration"] ?? {};

      return {"distance": distance, "duration": duration};
    } else {
      return {};
      // in case there is a problem on request!
      // _controller.clear();
    }
  }

  /// Calculate Distance between To [LocationData] , return is in KM!
  static double calculateDistance(LocationData from, LocationData to) {
    var R = 6371;
    var dLat = (to.latitude! - from.latitude!) * pi / 180;
    var dLon = (to.longitude! - from.longitude!) * pi / 180;

    var a = sin(dLat / 2) * sin(dLat / 2) +
        cos(from.latitude! * pi / 180) *
            cos(to.latitude! * pi / 180) *
            sin(dLon / 2) *
            sin(dLon / 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    var res = R * c; // this is in km

    return res;
  }

  /// Don't use thid directly , Use [encodePolyLine()]!
  static String _encode(double current, double previous, int factor) {
    final _current = (current * factor).round();
    final _previous = (previous * factor).round();

    var coordinate = _current - _previous;
    coordinate <<= 1;
    if (_current - _previous < 0) {
      coordinate = ~coordinate;
    }

    var output = '';
    while (coordinate >= 0x20) {
      output += String.fromCharCode((0x20 | (coordinate & 0x1f)) + 63);
      coordinate >>= 5;
    }
    output += String.fromCharCode(coordinate + 63);
    return output;
  }

  /// we use this to Encode our polyline a.k.a List<LatLng> so we can save it in our db!
  /// Google have a great clean doc in [https://developers.google.com/maps/documentation/utilities/polylinealgorithm]!
  static String encodePolyline(List<List<double>> coordinates, int precision) {
    if (coordinates.isEmpty) {
      return '';
    }

    int factor = pow(10, precision is int ? precision : 5) as int;
    var output = _encode(coordinates[0][0], 0, factor) +
        _encode(coordinates[0][1], 0, factor);

    for (var i = 1; i < coordinates.length; i++) {
      var a = coordinates[i], b = coordinates[i - 1];
      output += _encode(a[0], b[0], factor);
      output += _encode(a[1], b[1], factor);
    }

    return output;
  }

  /// decode a String encoded polyline!
  static List<LatLng> loadUpPolyline(String? polyline) {
    // Polylines stuff.
    if (polyline == null) return <LatLng>[];
    List<LatLng> pLineCoords = [];

    List<PointLatLng> res = PolylinePoints().decodePolyline(polyline);

    res.forEach((PointLatLng point) =>
        pLineCoords.add(LatLng(point.latitude, point.longitude)));

    return pLineCoords;
  }

  /// To create our LatLngBounds , used so we can fit Map Componenets in the map depending on LatLng!
  static LatLngBounds createMapBounds(List<LatLng> positions) {
    final southwestLat = positions.map((p) => p.latitude).reduce(
        (value, element) =>
            value < element ? value : element); //  snallest value
    final southwestLon = positions
        .map((p) => p.longitude)
        .reduce((value, element) => value < element ? value : element);
    final northeastLat = positions.map((p) => p.latitude).reduce(
        (value, element) => value > element ? value : element); // biggest value
    final northeastLon = positions
        .map((p) => p.longitude)
        .reduce((value, element) => value > element ? value : element);
    // mapReady.value = true;
    return LatLngBounds(
        southwest: LatLng(southwestLat, southwestLon),
        northeast: LatLng(northeastLat, northeastLon));
  }
}
