import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:sizer/sizer.dart';

// Displays the order costs [delivery + total]

final NumberFormat currency = new NumberFormat("#,##0.00", "en_US");

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
        ["pages"]["Orders"]["ViewRestaurantOrderScreen"]["components"]
    ["OrderTotalCostCard"];

Widget orderTotalCostCard(Rxn<RestaurantOrder> order) {
  return Column(
    children: <Widget>[
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.centerLeft,
        child: Text(
          "${_i18n()['totalCost']}",
          style: TextStyle(
            color: const Color(0xff000f1c),
            fontFamily: "psb",
            fontStyle: FontStyle.normal,
            fontSize: 14.0,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      const SizedBox(height: 10),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: Get.width,
        height: 113,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: const Color(0xffececec), width: 0.5),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      "${_i18n()['deliveryCost']}",
                      style: const TextStyle(
                        color: Color(0xff000f1c),
                        fontFamily: "psr",
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          order.value!.shippingCost.toPriceString(),
                          style: Get.textTheme.bodyText1?.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${_i18n()["free"]}",
                          style: Get.textTheme.bodyText1
                              ?.copyWith(color: primaryBlueColor),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: Get.width,
              height: 0.5,
              decoration: BoxDecoration(
                color: const Color(0xffececec),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: <Widget>[
                    // Total
                    Text(
                      "${_i18n()['total']}",
                      style: const TextStyle(
                        color: Color(0xff000f1c),
                        fontFamily: "psr",
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const Spacer(),
                    Text(
                      "  \$${currency.format(order.value!.cost)}",
                      style: TextStyle(
                        color: const Color(0xff000f1c),
                        fontFamily: "psb",
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0.sp,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 20),
    ],
  );
}
