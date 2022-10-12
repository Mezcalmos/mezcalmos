import 'dart:math';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

extension CapExtension on String {
  String removeLast() {
    String str = this;
    if (length > 0) {
      str = str.substring(0, str.length - 1);
    }
    return str;
  }

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

LanguageType userLanguage = Get.find<LanguageController>().userLanguageKey;
String getRandomString(int length) {
  const String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();
  return String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
