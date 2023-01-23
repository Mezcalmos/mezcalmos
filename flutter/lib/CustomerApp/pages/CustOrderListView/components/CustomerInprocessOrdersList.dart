import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrderListView/components/CustomerOrderCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrderListView/controllers/CustomerOrdersListViewController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['ListOrdersScreen']['ListOrdersScreen'];

class CustomerInprocessOrdersList extends StatelessWidget {
  const CustomerInprocessOrdersList({
    Key? key,
    required this.txt,
    required this.viewController,
  }) : super(key: key);

  final TextTheme txt;
  final CustomerOrdersListViewController viewController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.withOpacity(0.3),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
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
                itemCount: viewController.currentOrders.value!.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomerOrderCard(
                      order: viewController.currentOrders.value![index]);
                }),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}