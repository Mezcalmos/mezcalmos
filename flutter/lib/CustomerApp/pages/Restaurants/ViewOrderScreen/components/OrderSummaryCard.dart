import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    Key? key,
    required this.order,
  }) : super(key: key);
  final Order order;
  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: Text(
            'Total Cost',
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
                      'Delivery Cost',
                      style: txt.headline3,
                    ),
                    Text(
                      '\$' + order.cost.toStringAsFixed(2),
                      style: txt.headline2,
                    ),
                  ],
                ),
                Divider(
                  thickness: 0.2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: txt.headline3,
                    ),
                    Text(
                      '\$' + (4 + order.cost).toStringAsFixed(2),
                      style: txt.headline2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          margin: EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: Text(
            'Delivery location',
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
