import 'dart:math';

import 'package:get/get.dart';
import 'package:qlevar_router/qlevar_router.dart';

extension CapExtension on String {
  String get inCaps =>
      (length > 0) ? '${this[0].toUpperCase()}${substring(1)}' : '';
  String get allInCaps => toUpperCase();
  String get capitalizeFirstofEach =>
      split(" ").map((String str) => str.capitalize).join(" ");
  String get capitalizeDays =>
      split("-").map((String str) => str.capitalize).join("-");
}

/// This Generates the first letters of the first 2 words in a String,
///
/// Ex : Mezcalmos Admin => MA
extension TwoLettersGenerator on String {
  String generateTwoFirstLetters() {
    String imageString = '';
    if (isNotEmpty) {
      final List<String> _split = split(" ");
      for (int i = 0; i < _split.length; i++) {
        if (i < 2 && _split[i].isNotEmpty) {
          imageString += _split[i][0];
        } else {
          break;
        }
      }
    }
    return imageString.toUpperCase();
  }
}

String getRandomString(int length) {
  const String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();
  return String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}

List<String> getCurrentPath() {
  var strs = <String>[];
  var xPath = QR.currentPath.contains("?")
      ? QR.currentPath.split('?')[0]
      : QR.currentPath;
  strs.add(xPath);
  var params =
      QR.currentPath.contains("?") ? "?${QR.currentPath.split('?')[1]}" : "";
  strs.add(params);
  return strs;
}

String getLangParam() {
  var param = QR.params["lang"].toString().isNotEmpty
      ? "?lang=${QR.params["lang"].toString()}"
      : "";
  return param;
}
