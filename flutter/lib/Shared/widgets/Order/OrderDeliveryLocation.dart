import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:sizer/sizer.dart';
//
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["OrderDeliveryLocation"];
//

class OrderDeliveryLocation extends StatelessWidget {
  const OrderDeliveryLocation(
      {super.key, required this.address, this.margin, this.titleTextStyle});
  final String address;
  final EdgeInsets? margin;
  final TextStyle? titleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_i18n()["title"]}',
            style: titleTextStyle,
          ),
          const SizedBox(
            height: 4,
          ),
          Card(
            margin: EdgeInsets.zero,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Row(
                children: [
                  Icon(
                    Icons.fmd_good,
                    color: Colors.black,
                    size: 13.sp,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      address,
                      style: Get.textTheme.bodyText1,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
