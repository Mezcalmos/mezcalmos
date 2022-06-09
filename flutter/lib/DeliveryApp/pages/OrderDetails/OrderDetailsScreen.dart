import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late String orderId;
  Rxn<Order> order = Rxn();
  StreamSubscription<Order?>? _orderListener;
  OrderController controller = Get.find<OrderController>();

  @override
  void initState() {
    final String orderId = Get.parameters['orderId']!;
    mezDbgPrint("Get.parameters ===> $orderId");
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId);
    mezDbgPrint("order.value.id ===> ${order.value?.orderId}");
    _orderListener =
        controller.getOrderStream(orderId).listen((Order? newOrderEvent) {
      if (newOrderEvent != null) {
        order.value = newOrderEvent;

        order.refresh();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: Get.back,
      ),
      body: Obx(() {
        if (order.value != null) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _orderDetailsHeader(),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "From",
                  style: Get.textTheme.bodyText1,
                ),
                if (_getOrderFromLocation() != null)
                  Text(_getOrderFromLocation()!),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Delivered to",
                  style: Get.textTheme.bodyText1,
                ),
                Text("${order.value!.to.address}"),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Payment method",
                  style: Get.textTheme.bodyText1,
                ),
                Text(order.value!.paymentType.toNormalString()),
                SizedBox(
                  height: 15,
                ),
                _serviceProviderCard(),
                _customerCard(),
                Divider(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery Cost",
                      style: Get.textTheme.bodyText1,
                    ),
                    Text(
                      "\$50",
                      style: Get.textTheme.bodyText1,
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }

  Container _orderDetailsHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat("dd MMMM, hh:mm a")
                .format(order.value!.orderTime.toLocal()),
            style: Get.textTheme.bodyText1,
          ),
          Text(order.value!.isCanceled() ? "Cancelled" : "Approved",
              style: Get.textTheme.bodyText1?.copyWith(color: primaryBlueColor))
        ],
      ),
    );
  }

  Card _customerCard() {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  CachedNetworkImageProvider(order.value!.customer.image),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "${order.value!.customer.name}",
              style: Get.textTheme.bodyText1,
            ),
            Spacer(),
            Text("Customer")
          ],
        ),
      ),
    );
  }

  Card _serviceProviderCard() {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  _getOrderServiceProvider()?.image ?? defaultUserImgUrl),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "${_getOrderServiceProvider()?.name ?? ""}",
              style: Get.textTheme.bodyText1,
            ),
            Spacer(),
            Text(_getOrderType())
          ],
        ),
      ),
    );
  }

  String _getOrderType() {
    switch (order.value!.orderType) {
      case OrderType.Restaurant:
        return "Restaurant";
      case OrderType.Laundry:
        return "Laundry";

      default:
        return "";
    }
  }

  ServiceInfo? _getOrderServiceProvider() {
    switch (order.value!.orderType) {
      case OrderType.Restaurant:
        return (order.value as RestaurantOrder).restaurant;
      case OrderType.Laundry:
        return (order.value as LaundryOrder).laundry;

      default:
        return null;
    }
  }

  String? _getOrderFromLocation() {
    if (order.value!.orderType == OrderType.Restaurant) {
      return (order.value as RestaurantOrder).restaurant.location.address;
    } else {
      if ((order.value as LaundryOrder).getCurrentPhase() ==
          LaundryOrderPhase.Pickup) {
        return (order.value as LaundryOrder).to.address;
      } else {
        return (order.value as LaundryOrder).laundry!.location.address;
      }
    }
  }
}