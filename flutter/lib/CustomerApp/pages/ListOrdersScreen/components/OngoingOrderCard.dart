import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';

class OngoingOrderCard extends StatelessWidget {
  const OngoingOrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    LanguageController lang = Get.find<LanguageController>();
    final txt = Theme.of(context).textTheme;
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                    radius: 35,
                    backgroundImage:
                        // #question @jam what is the point of null check if you are going to override it like this
                        // taxi orders dont have service provider image when they are looking for orders
                        // in that case show the logo, it will not work as NetworkImage, so please change to load asset image
                        NetworkImage(order.serviceProvider != null
                            ? order.serviceProvider!.image
                            : "https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/logo%402x.png?alt=media&token=4a18a710-e267-40fd-8da7-8c12423cc56d")),
                SizedBox(width: 5.w),
                Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.serviceProvider?.name ?? "Unavailable",
                        style: txt.headline3,
                      ),
                      Text(
                        order.to.address,
                        style: txt.subtitle1,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Material(
                  color: Theme.of(context).primaryColorLight,
                  shape: CircleBorder(),
                  child: InkWell(
                    onTap: () {
                      switch (order.orderType) {
                        case OrderType.Restaurant:
                          Get.toNamed(getRestaurantOrderRoute(order.orderId));
                          break;
                        case OrderType.Taxi:
                          Get.toNamed(getTaxiOrderRoute(order.orderId));
                          break;
                        default:
                      }
                    },
                    customBorder: CircleBorder(),
                    child: Container(
                      margin: EdgeInsets.all(16),
                      child: Icon(
                        Icons.launch,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                )
              ],
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${lang.strings["customer"]["restaurant"]["cart"]["totalCost"]} : ${order.cost} \$",
                  ),
                  Text(
                    "${DateFormat.jm().format(DateFormat("hh:mm").parse("${order.orderTime.toLocal().hour}:${order.orderTime.toLocal().minute}"))}",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
