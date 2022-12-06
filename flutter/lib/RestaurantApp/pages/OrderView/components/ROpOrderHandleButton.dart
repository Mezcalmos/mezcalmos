import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpOrderView']["components"]["ROpOrderHandleButton"];

class ROpOrderHandleButton extends StatefulWidget {
  const ROpOrderHandleButton({Key? key, required this.order}) : super(key: key);
  final RestaurantOrder order;

  @override
  State<ROpOrderHandleButton> createState() => _ROpOrderHandleButtonState();
}

class _ROpOrderHandleButtonState extends State<ROpOrderHandleButton> {
  ROpOrderController orderController = Get.find<ROpOrderController>();

  @override
  Widget build(BuildContext context) {
    if (_showBtn) {
      return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: MezButton(
          onClick: handleClick,
          label: getBtnTitle!,
        ),
      );
    } else
      return Container();
  }

  Future<void> handleClick() async {
    if (widget.order.status == RestaurantOrderStatus.OrderReceived) {
      await orderController.prepareOrder(int.parse(widget.order.orderId));
    } else if (widget.order.status == RestaurantOrderStatus.PreparingOrder) {
      await orderController
          .setReadyForDelivery(int.parse(widget.order.orderId));
    }
  }

  String? get getBtnTitle {
    if (widget.order.status == RestaurantOrderStatus.OrderReceived) {
      return '${_i18n()["prepareOrder"]}';
    } else if (widget.order.status == RestaurantOrderStatus.PreparingOrder) {
      return '${_i18n()["orderReady"]}';
    }
    return null;
  }

  bool get _showBtn {
    return widget.order.status == RestaurantOrderStatus.OrderReceived ||
        widget.order.status == RestaurantOrderStatus.PreparingOrder;
  }
}
