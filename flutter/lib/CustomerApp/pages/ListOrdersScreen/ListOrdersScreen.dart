import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/CustomerApp_appbar.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/pages/ListOrdersScreen/components/OldOrderCard.dart';
import 'package:mezcalmos/CustomerApp/pages/ListOrdersScreen/components/OngoingOrderCard.dart';
import 'package:mezcalmos/CustomerApp/pages/ListOrdersScreen/ordersListScreen.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';

import 'components/OngoingOrderCard.dart';

final f = new DateFormat('MM.dd.yyyy');
final currency = new NumberFormat("#,##0.00", "en_US");

class ListOrdersScreen extends StatefulWidget {
  @override
  _ListOrdersScreen createState() => _ListOrdersScreen();
}

class _ListOrdersScreen extends State<ListOrdersScreen> {
  MyPopupMenuController _popUpController = MyPopupMenuController();
  LanguageController _lang = Get.find<LanguageController>();
  OrderController controller = Get.find<OrderController>();
  AuthController auth = Get.find<AuthController>();

  @override
  void dispose() {
    _popUpController.hideMenu();
    _popUpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Scaffold(
        appBar: CustomerAppBar(
          title: 'Orders',
          autoBack: true,
        ),
        body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'Ongoing orders',
                          style: txt.headline3,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Obx(
                        () => Column(
                          children: List.generate(
                              controller.currentOrders().length,
                              (index) => OngoingOrderCard(
                                  order: controller.currentOrders()[index])),
                        ),
                      ),
                    ],
                  ),
                ),

                FilterOrders(),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: List.generate(
                          controller.pastOrders().length,
                          (index) => OldOrderCard(
                              order: controller.pastOrders()[index]
                                  as RestaurantOrder)),
                    ),
                  ),
                ),
                // Obx(() => buildInProcessOrders(controller.currentOrders())),
                // SizedBox(height: 20),
                // Obx(() => buildPastOrders(controller.pastOrders()))
              ],
            )));
  }
}
