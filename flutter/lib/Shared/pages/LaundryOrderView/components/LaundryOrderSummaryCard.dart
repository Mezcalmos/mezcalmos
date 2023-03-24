import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['OrderView']['Components']['LaundryOpOrderSummaryCard'];

class LaundryOrderSummaryCard extends StatelessWidget {
  final LaundryOrder order;
  const LaundryOrderSummaryCard({Key? key, required this.order})
      : super(key: key);

  // TODO FIX LANG

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "${_i18n()["orderSummary"]}",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Divider(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${_i18n()["orderCost"]} :",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  (order.costsByType?.weighedCost != null)
                      ? '${order.cost - 50} \$'
                      : '-',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${_i18n()["deliveryCost"]} :",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "50 \$",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${_i18n()["totalCost"]} :",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  (order.costsByType?.weighedCost != null)
                      ? '${order.cost} \$'
                      : '-',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            Divider(
              height: 25,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "${_i18n()["deliveryLocation"]} :",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.place_rounded,
                  color: Theme.of(context).primaryColorLight,
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(child: Text(order.to.address, maxLines: 1)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Card laundryPricingCard(BuildContext context, LaundryOrder order) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              _i18n()['laundryPricing'],
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Divider(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _i18n()['fixedRate'],
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  (order.cost != 0)
                      ? '\$' + order.cost.toStringAsFixed(0)
                      : '-',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _i18n()['orderWeight'],
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  (order.costsByType?.weighedCost != null)
                      ? "${order.costsByType?.weighedCost} /kg"
                      : '-',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${_i18n()["totalCost"]} :",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  (order.cost != 0)
                      ? '\$' + order.cost.toStringAsFixed(0)
                      : '-',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            if (order.costsByType?.weighedCost == null)
              Column(
                children: [
                  Divider(
                    height: 25,
                  ),
                ],
              ),
            Row(
              children: [
                Icon(
                  Icons.help_outline_rounded,
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                    child: Text(_i18n()['laundryPricingNote'], maxLines: 3)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
