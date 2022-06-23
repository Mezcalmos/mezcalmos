import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

class LaundryOrderSummary extends StatelessWidget {
  final LaundryOrder order;

  const LaundryOrderSummary({
    Key? key,
    required this.order,
  }) : super(key: key);

  dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
      ["pages"]["Orders"]["LaundryOrder"]["Components"]["LaundryOrderSummary"];

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(8),
          child: Text(
            '${_i18n()['orderSummary']}',
            style: txt.headline3,
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      _i18n()['orderWeight'],
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      (order.costsByType?.totalWeigh != null)
                          ? "${order.costsByType?.totalWeigh} kg"
                          : '-',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "${_i18n()["orderCost"]} :",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      (order.cost != 0)
                          ? '\$' + order.cost.toStringAsFixed(0)
                          : '-',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "${_i18n()["deliveryCost"]} : ",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Row(
                      children: [
                        Text(
                          order.shippingCost.toPriceString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  decoration: TextDecoration.lineThrough),
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
                const Divider(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "${_i18n()["totalCost"]} : ",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      (order.costsByType?.totalPrice != null)
                          ? order.costsByType!.totalPrice!.toPriceString()
                          : '-',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
