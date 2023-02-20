import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrderListView/controllers/CustomerOrdersListViewController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/Order/MinimalOrderCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['ListOrdersScreen']['ListOrdersScreen'];

class CustomerPastOrdersList extends StatelessWidget {
  const CustomerPastOrdersList({
    Key? key,
    required this.txt,
    required this.viewController,
  }) : super(key: key);

  final TextTheme txt;
  final CustomerOrdersListViewController viewController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Obx(
        () => viewController.pastOrders.length >= 1
            ? pastOrdersWidget()
            : _noPastOrdersWidget(context),
      ),
    );
  }

  Column pastOrdersWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GroupedListView<MinimalOrder, DateTime>(
          shrinkWrap: true,
          elements: viewController.pastOrders,
          groupBy: (MinimalOrder element) => DateTime(element.orderTime.year,
              element.orderTime.month, element.orderTime.day),
          groupComparator: (DateTime value1, DateTime value2) =>
              value2.compareTo(value1),
          itemComparator: (MinimalOrder element1, MinimalOrder element2) =>
              element2.orderTime.compareTo(element1.orderTime),
          physics: NeverScrollableScrollPhysics(),
          groupHeaderBuilder: (MinimalOrder element) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                (calculateDifference(element.orderTime) == 0)
                    ? _i18n()["shared"]["notification"]["today"]
                    : (calculateDifference(element.orderTime) == -1)
                        ? _i18n()["shared"]["notification"]["yesterday"]
                        : DateFormat('dd MMM yyyy').format(element.orderTime),
                style: txt.displaySmall,
              ),
            );
          },
          separator: SizedBox(
            height: 5,
          ),
          itemBuilder: (BuildContext context, MinimalOrder element) {
            return MinimalOrderCard(
              order: element,
              forCustomer: true,
              onTap: () {
                if (element.orderType == OrderType.Laundry) {
                  MezRouter.toNamed(getLaundryOrderRoute(element.id));
                } else {
                  MezRouter.toNamed(getRestaurantOrderRoute(element.id));
                }
              },
            );
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
                .bodyLarge!
                .copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

int calculateDifference(DateTime date) {
  final DateTime now = DateTime.now();
  return DateTime(date.year, date.month, date.day)
      .difference(DateTime(now.year, now.month, now.day))
      .inDays;
}
