import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/DeliveryAdminAppbar.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/OrderInfoCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/OrderNoteCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/OrderShippingLocation.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/OrderTotalCostCard.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
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
  OrderController controller = Get.find<OrderController>();
  late String orderId;
  Rx<bool> hasNewMessage = false.obs;
  StreamSubscription? _orderListener;
  @override
  void initState() {
    super.initState();

    mezDbgPrint("ViewOrderScreen");
    orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId) as RestaurantOrder?;
    if (order.value == null) {
      Get.back();
    } else {
      _orderListener =
          controller.getCurrentOrderStream(orderId).listen((newOrder) {
        if (newOrder != null) {
          order.value = controller.getOrder(orderId) as RestaurantOrder?;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: new FloatingActionButton(
          focusColor: Colors.grey.shade100,
          hoverColor: Colors.grey.shade100,
          splashColor: Colors.grey.shade100,
          backgroundColor: Colors.grey.shade100,
          foregroundColor: Colors.purple.shade700,
          onPressed: () {
            Clipboard.setData(ClipboardData(text: order.value?.clipBoardText))
                .then((value) => MezSnackbar("Done :D", "Copied to clipboard.",
                    position: SnackPosition.TOP));
          },
          tooltip: 'Copy',
          child: new Icon(Icons.copy),
        ),
        appBar: deliveryAdminAppBar(AppBarLeftButtonType.Back,
            withOrder: true, function: Get.back),
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
                  //getCustomerInfoCart(),
                  OrderInfoCard(order: order),
                  //==========================>total cost=====================================
                  orderTotalCostCard(order),
                  //=========== location========================
                  orderShippingLocation(order),
                  //===============================>notes========================>
                  orderNoteCard(order)
                ],
              ),
            );
          }
        }));
  }
}
