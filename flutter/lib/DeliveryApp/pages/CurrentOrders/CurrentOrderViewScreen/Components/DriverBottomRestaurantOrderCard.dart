import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/controllers/restaurantController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Components/RestaurantControllButtons.dart';
import 'package:sizer/sizer.dart';

import '../../../../../Shared/models/Orders/RestaurantOrder.dart';

class DriverBottomRestaurantOrderCard extends StatelessWidget {
  final RestaurantOrder order;
  DriverBottomRestaurantOrderCard({Key? key, required this.order})
      : super(key: key);
  RestaurantOrderController restaurantOrderController =
      Get.find<RestaurantOrderController>();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _getOrderStatus(),
                style: textTheme.bodyText2,
              ),
              Divider(),
              _orderHeaderInfo(context, textTheme),
              Divider(),
              // From to component
              _orderFromToComponent(textTheme),
              Divider(),
              // Order bottom card footer component (to be refactored)
              RestaurantControllButtons(order: order),
            ],
          ),
        ),
      ),
    );
  }

// Order info (order type and time and chat icon)
  Widget _orderHeaderInfo(BuildContext context, TextTheme textTheme) {
    return Row(
      children: [
        Icon(
          Icons.food_bank,
          size: 40.sp,
          color: Theme.of(context).primaryColorLight,
        ),
        Flexible(
          flex: 4,
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Restaurant Delivery',
                style: textTheme.headline3!.copyWith(fontSize: 13.sp),
              ),
              Row(
                children: [
                  Icon(
                    Icons.schedule,
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    DateFormat('dd MMM yy h:m').format(order.orderTime),
                    style: textTheme.subtitle1,
                  )
                ],
              )
            ],
          ),
        ),
        Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.textsms_rounded,
              color: Theme.of(context).primaryColorLight,
            )),
      ],
    );
  }

// Order start point and destination component
  Widget _orderFromToComponent(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: CachedNetworkImageProvider(
                  order.serviceProvider?.image ?? ''),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  order.serviceProvider?.name ?? 'Restaunat',
                  style: textTheme.bodyText1,
                ),
              ],
            )
          ],
        ),
        Container(
          height: 30,
          width: 3,
          margin: EdgeInsets.only(left: 16),
          color: Colors.grey.shade500,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: CachedNetworkImageProvider(order.customer.image),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.customer.name,
                    style: textTheme.bodyText1,
                  ),
                  Text(
                    order.to.address,
                    style: textTheme.subtitle1,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

// get order status readable title
  String _getOrderStatus() {
    switch (order.status) {
      case RestaurantOrderStatus.OrderReceieved:
        return 'Waiting for preparing the order';
      case RestaurantOrderStatus.PreparingOrder:
        return 'Order is being prepared';
      case RestaurantOrderStatus.ReadyForPickup:
        return 'Order is ready and waiting for you';
      case RestaurantOrderStatus.OnTheWay:
        return 'Order on the way';
      case RestaurantOrderStatus.Delivered:
        return 'Order Delivered';

      default:
        return '';
    }
  }
}
