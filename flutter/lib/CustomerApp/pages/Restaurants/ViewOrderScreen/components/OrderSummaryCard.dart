import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:sizer/sizer.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    Key? key,
    required this.order,
  }) : super(key: key);
  final RestaurantOrder order;
  @override
  Widget build(BuildContext context) {
    LanguageController lang = Get.find<LanguageController>();
    final txt = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          alignment: Alignment.centerLeft,
          child: Text(
            '${lang.strings["customer"]["restaurant"]["cart"]["totalCost"]}',
            style: txt.headline3,
          ),
        ),
        Card(
          child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${lang.strings["customer"]["restaurant"]["cart"]["deliveryCost"]}',
                      style: txt.headline3,
                    ),
                    Text('\$' + order.shippingCost.toString(),
                        style: txt.headline2!),
                  ],
                ),
                Divider(
                  thickness: 0.2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${lang.strings["customer"]["restaurant"]["cart"]["total"]}',
                      style: txt.headline3,
                    ),
                    Text(
                      '\$' + (order.cost).toStringAsFixed(0),
                      style: txt.headline2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: Text(
            '${lang.strings["customer"]["restaurant"]["cart"]["deliveryLocation"]}',
            style: txt.headline3,
          ),
        ),
        Card(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(
                  Icons.place,
                  color: Theme.of(context).primaryColorLight,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Flexible(
                  child: Text(
                    order.to.address,
                    style: txt.bodyText2,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
