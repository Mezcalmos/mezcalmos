import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/DeliveryAdminAppbar.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/restaurantOrderController.dart';
import 'package:mezcalmos/DeliveryAdminApp/models/Driver.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/Components/DriverCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/OrderInfoCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/OrderNoteCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/OrderTotalCostCard.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

import 'components/CurrentOrderInfo.dart';
import 'components/PastOrderInfo.dart';

final currency = new NumberFormat("#,##0.00", "en_US");
LinearGradient? buttonGraientColor;

class ViewRestaurantOrderScreen extends StatefulWidget {
  @override
  _ViewRestaurantOrderScreen createState() => _ViewRestaurantOrderScreen();
}

class _ViewRestaurantOrderScreen extends State<ViewRestaurantOrderScreen> {
  LanguageController lang = Get.find<LanguageController>();
  AuthController auth = Get.find<AuthController>();
  // Since we have alot of buttons we check loading by name

  Rxn<RestaurantOrder> order = Rxn();
  RestaurantOrderController controller = Get.find<RestaurantOrderController>();
  late String orderId;
  Rx<bool> hasNewMessage = false.obs;
  StreamSubscription? _orderListener;
  @override
  void initState() {
    super.initState();

    mezDbgPrint("ViewOrderScreen");
    orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId);
    if (order.value == null) {
      Get.back();
    } else {
      _orderListener =
          controller.getCurrentOrderStream(orderId).listen((newOrder) {
        if (newOrder != null) {
          order.value = controller.getOrder(orderId);
        } else {
          Get.back();
        }
      });
    }
  }

  @override
  void dispose() {
    _orderListener?.cancel();
    _orderListener = null;
    super.dispose();
  }

  Driver? driver;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: deliveryAdminAppBar(AppBarLeftButtonType.Back, withOrder: true),
        backgroundColor: Colors.white,
        body: Obx(() {
          if (order.value == null) {
            // Order Loading ..
            Get.back();
            return MezLogoAnimation(
              centered: true,
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  //====================Restaurant Info=======================
                  (!controller.isPast(order.value!))
                      ? CurrentOrderInfo(
                          order: order.value!,
                        )
                      : PastOrderInfo(order: order.value!),

                  //============================= Customer info====================
                  // DriverCard(
                  //   driver: driver,
                  // ),
                  //getCustomerInfoCart(),
                  OrderInfoCard(order: order),
                  //==========================>total cost=====================================

                  //=========== location========================
                  orderTotalCostCard(order),
                  //===============================>notes========================>
                  orderNoteCard(order)
                ],
              ),
            );
          }
        }));
  }
}
