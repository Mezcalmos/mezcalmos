import 'package:get/get.dart';

extension CapExtension on String {
  String get inCaps =>
      (this.length > 0) ? '${this[0].toUpperCase()}${this.substring(1)}' : '';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}
