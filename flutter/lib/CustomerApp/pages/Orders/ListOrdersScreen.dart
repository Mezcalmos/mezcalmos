import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/pages/Orders/components/LaundryOngoingOrderCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Orders/components/LaundryPastOrderCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Orders/components/RestaurantOngoingOrderCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Orders/components/RestaurantPastOrderCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Orders/components/TaxiPastOrderCard.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';

import 'components/RestaurantOngoingOrderCard.dart';
import 'components/TaxiOrderOngoingCard.dart';

final DateFormat f = new DateFormat('MM.dd.yyyy');
final NumberFormat currency = new NumberFormat("#,##0.00", "en_US");

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['ListOrdersScreen']['ListOrdersScreen'];

class ListOrdersScreen extends StatefulWidget {
  const ListOrdersScreen({Key? key}) : super(key: key);

  @override
  _ListOrdersScreen createState() => _ListOrdersScreen();
}

class _ListOrdersScreen extends State<ListOrdersScreen> {
  /// GEt OrderController
  OrderController controller = Get.put(OrderController());

  /// GEt AuthController
  AuthController auth = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    mezDbgPrint(
      "ListOrdersScreen: onInit current : ${controller.currentOrders.length} past : ${controller.pastOrders.length}",
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomerAppBar(
        title: '${_i18n()["title"]}',
        autoBack: true,
      ),
      body: Obx(
        () => controller.currentOrders.length + controller.pastOrders.length > 0
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (controller.currentOrders.isNotEmpty)
                      OngoingOrderList(txt: txt, controller: controller),
                    if (controller.pastOrders.isNotEmpty)
                      PastOrderList(txt: txt, controller: controller),
                  ],
                ),
              )
            : _noOrdersWidget(),
      ),
    );
  }

  Center _noOrdersWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.error, color: Colors.black, size: 30),
          Text(
            _i18n()['orders']['noOrders'],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class PastOrderList extends StatelessWidget {
  const PastOrderList({
    Key? key,
    required this.txt,
    required this.controller,
  }) : super(key: key);

  final TextTheme txt;
  final OrderController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Obx(
        () => controller.pastOrders().length >= 1
            ? pastOrdersWidget()
            : _noPastOrdersWidget(context),
      ),
    );
  }

  Column pastOrdersWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GroupedListView<Order, DateTime>(
          shrinkWrap: true,
          elements: controller.pastOrders(),
          groupBy: (Order element) => DateTime(element.orderTime.year,
              element.orderTime.month, element.orderTime.day),
          groupComparator: (DateTime value1, DateTime value2) =>
              value2.compareTo(value1),
          itemComparator: (Order element1, Order element2) =>
              element2.orderTime.compareTo(element1.orderTime),
          physics: const NeverScrollableScrollPhysics(),
          groupHeaderBuilder: (Order element) {
            return Container(
              margin: const EdgeInsets.all(8),
              child: Text(
                (calculateDifference(element.orderTime) == 0)
                    ? _i18n()["shared"]["notification"]["today"]
                    : (calculateDifference(element.orderTime) == -1)
                        ? _i18n()["shared"]["notification"]["yesterday"]
                        : DateFormat('dd MMM yyyy').format(element.orderTime),
                style: txt.headline3,
              ),
            );
          },
          separator: const SizedBox(height: 5),
          itemBuilder: (_, Order element) {
            switch (element.orderType) {
              case OrderType.Taxi:
                return TaxiPastOrderCard(order: element as TaxiOrder);
              case OrderType.Restaurant:
                return RestaurantPastOrderCard(
                  order: element as RestaurantOrder,
                );
              case OrderType.Laundry:
                return LaundryPastOrderCard(order: element as LaundryOrder);
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }

  Center _noPastOrdersWidget(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Icon(Icons.error, color: Colors.white),
          Text(
            _i18n()['orders']['noOrders'],
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class OngoingOrderList extends StatelessWidget {
  const OngoingOrderList({
    Key? key,
    required this.txt,
    required this.controller,
  }) : super(key: key);

  final TextTheme txt;
  final OrderController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.withOpacity(0.3),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Obx(
        () => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              _i18n()['orders']["onGoingOrders"],
              style: txt.headline3,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            reverse: true,
            itemCount: controller.currentOrders().length,
            itemBuilder: (_, int index) {
              switch (controller.currentOrders()[index].orderType) {
                case OrderType.Taxi:
                  return TaxiOngoingOrderCard(
                    order: controller.currentOrders()[index],
                  );
                case OrderType.Restaurant:
                  return RestaurantOngoingOrderCard(
                    order: controller.currentOrders()[index],
                  );
                case OrderType.Laundry:
                  return LaundryOngoigOrderCard(
                    order: controller.currentOrders()[index] as LaundryOrder,
                  );

                default:
                  return const SizedBox.shrink();
              }
            },
          ),
          const SizedBox(height: 10)
        ]),
      ),
    );
  }
}

int calculateDifference(DateTime date) {
  DateTime now = DateTime.now();
  return DateTime(date.year, date.month, date.day)
      .difference(DateTime(now.year, now.month, now.day))
      .inDays;
}
