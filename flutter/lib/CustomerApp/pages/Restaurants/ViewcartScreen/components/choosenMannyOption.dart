import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/components/titlesComponent.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:get/get.dart';

List<Widget> choosenMannyOption(
    Map<dynamic, dynamic> data, BuildContext context) {
  LanguageController lang = Get.find<LanguageController>();
  final txt = Theme.of(context).textTheme;

  List<Widget> myWidgets = [
    SizedBox(
      height: 5,
    ),
    MenuTitles(
      title: lang.strings["customer"]["restaurant"]["cart"]["options"],
      textTheme: txt.subtitle1!
          .copyWith(fontSize: 13, color: Color.fromRGBO(33, 33, 33, 0.8)),
    ),
  ];

  data.forEach((key, value) {
    if (value == true) {
      myWidgets.add(
        Container(
          width: Get.width,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 25, top: 5),
          child: Text("${key}".inCaps,
              style: const TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  fontFamily: "ProductSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 17.0),
              textAlign: TextAlign.left),
        ),
      );
    }
  });
  return myWidgets;
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}
