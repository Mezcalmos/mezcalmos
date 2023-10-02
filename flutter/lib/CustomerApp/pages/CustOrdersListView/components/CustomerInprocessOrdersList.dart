import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrdersListView/controllers/CustomerOrdersListViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/CustRestaurantOrderView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/Order/MinimalOrderCard.dart';

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
      color: onGoingBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                _i18n()['orders']["onGoingOrders"],
                style: txt.bodyLarge,
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                reverse: true,
                itemCount: viewController.currentOrders.length,
                itemBuilder: (BuildContext context, int index) {
                  return MinimalOrderCard(
                    order: viewController.currentOrders[index],
                    onTap: () {
                      // todo switch case
                      switch (viewController.currentOrders[index].orderType) {
                        // case OrderType.Courier:
                        //   CustCourierOrderView.navigate(
                        //       orderId: viewController.currentOrders[index].id);
                        //   break;
                        case OrderType.Restaurant:
                          CustRestaurantOrderView.navigate(
                              orderId: viewController.currentOrders[index].id);
                          break;
                        // case OrderType.Laundry:
                        //   CustLaundryOrderView.navigate(
                        //       orderId: viewController.currentOrders[index].id);
                        //   break;
                        // case OrderType.Business:
                        //   CustOrderView.navigate(
                        //       orderId: viewController.currentOrders[index].id);
                        //   break;
                        default:
                      }
                      // if (viewController.currentOrders[index].orderType ==
                      //     OrderType.Laundry) {
                      //   CustLaundryOrderView.navigate(
                      //       orderId: viewController.currentOrders[index].id);
                      // } else {
                      //   ViewRestaurantOrderScreen.navigate(
                      //       orderId: viewController.currentOrders[index].id);
                      // }
                    },
                  );
                }),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
