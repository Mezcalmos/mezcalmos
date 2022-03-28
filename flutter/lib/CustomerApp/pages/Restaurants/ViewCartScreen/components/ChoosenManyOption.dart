import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/TitlesComponent.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
    ["Restaurants"]["ViewCartScreen"]["components"]["ChoosenManyOption"];

List<Widget> choosenManyOption(
    List<CartChooseManyItem> cartChooseManyItems, BuildContext context) {
  LanguageType userLanguage = Get.find<LanguageController>().userLanguageKey;
  final txt = Theme.of(context).textTheme;

  List<Widget> myWidgets = [
    SizedBox(
      height: 5,
    ),
    MenuTitles(
      title: _i18n()["options"],
      textTheme: txt.subtitle1!
          .copyWith(fontSize: 13, color: Color.fromRGBO(33, 33, 33, 0.8)),
    ),
  ];

  cartChooseManyItems.forEach((cartChooseManyItem) {
    if (cartChooseManyItem.chosen) {
      myWidgets.add(
        Container(
          width: Get.width,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 25, top: 5),
          child: Text(
              "${cartChooseManyItem.optionDetails.name[userLanguage]}"
                  .inCaps,
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
  if (cartChooseManyItems.length == 0) {
    return [];
  } else {
    return myWidgets;
  }
}
