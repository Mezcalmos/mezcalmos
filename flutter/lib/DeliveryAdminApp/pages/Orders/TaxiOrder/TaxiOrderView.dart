import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/taxiController.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/components/TaxiOpenOrderBottomCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/components/TaxiOrderBottomCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/components/TaxiOrderMapComponent.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["Orders"]["TaxiOrder"]["TaxiOrderView"];

class TaxiOrderView extends StatefulWidget {
  const TaxiOrderView({Key? key}) : super(key: key);

  @override
  _TaxiOrderViewState createState() => _TaxiOrderViewState();
}

class _TaxiOrderViewState extends State<TaxiOrderView> {
  /// taxiOrderController
  TaxiOrderController taxiOrderController = Get.find<TaxiOrderController>();

  /// order
  Rxn<TaxiOrder> order = Rxn<TaxiOrder>();

  /// orderId
  late String orderId;

  /// _orderListener
  StreamSubscription<dynamic>? _orderListener;

  @override
  void initState() {
    mezDbgPrint("ViewOrderScreen");
    orderId = Get.parameters['orderId']!;

    order.value = taxiOrderController.getOrder(orderId);
    if (order.value == null) {
      Get.back<void>();
    } else if (order.value!.isOpenOrder()) {
      mezDbgPrint("open order stream ---------------------------");

      _orderListener = taxiOrderController
          .getOpenOrderStream(orderId)
          .listen((TaxiOrder? newOrder) {
        if (newOrder != null) {
          order.value = taxiOrderController.getOrder(orderId);
        } else {
          Get.back<void>();
        }
      });
    } else if (order.value!.inProcess()) {
      mezDbgPrint("process order stream ---------------------------");

      _orderListener = taxiOrderController
          .getInProcessOrderStream(orderId)
          .listen((TaxiOrder? newOrder) {
        if (newOrder != null) {
          order.value = taxiOrderController.getOrder(orderId);
        } else {
          Get.back<void>();
        }
      });
    } else {
      mezDbgPrint("past order stream ---------------------------");
      _orderListener = taxiOrderController
          .getPastOrderStrem(orderId)
          .listen((TaxiOrder? pastOrder) {
        if (pastOrder != null) {
          order.value = taxiOrderController.getOrder(orderId);
        } else {
          Get.back<void>();
        }
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    _orderListener?.cancel();
    _orderListener = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('${_i18n()["order"]}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TaxiOrderMapComponent(order: order.value!),
              (order.value!.isOpenOrder())
                  ? TaxiOpenOrderBottomCard(order: order.value!)
                  : TaxiOrderBottomCard(order: order.value!),
            ],
          ),
        ),
      ),
    );
  }
}
