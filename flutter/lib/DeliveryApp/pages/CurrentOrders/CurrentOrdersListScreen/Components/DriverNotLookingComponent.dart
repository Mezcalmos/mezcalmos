import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/constants/assets.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:sizer/sizer.dart';

class DriverNotLookingComponent extends StatelessWidget {
  ///  Shows an image from assets and text telling the drive he is offline

  const DriverNotLookingComponent({Key? key}) : super(key: key);
  dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
          ["pages"]["CurrentOrders"]["CurrentOrdersListScreen"]["Components"]
      ["DriverNotLookingComponent"];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
          height: 20.h,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(turnOn_asset))),
        ),
        SizedBox(
          height: 15,
        ),
        Column(
          children: [
            Obx(
              () => Text(
                _i18n()["toggleTitle"],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.5.sp, fontFamily: 'psr'),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Obx(
              () => Text(
                _i18n()["toggleDesc"],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'psr',
                    color: Color.fromARGB(255, 168, 168, 168)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
