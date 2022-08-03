import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/basicCellComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/restaurantOrderController.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/ChangeStatusButtons.dart';
//import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/ChangeStatusButtons.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/RestaurantOrderItems.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["DeliveryAdminApp"]["pages"]
        ["Orders"]["ViewRestaurantOrderScreen"]["components"]["OrderInfoCard"];
//Display the order customer and items

class OrderInfoCard extends StatefulWidget {
  final Rxn<RestaurantOrder> order;

  const OrderInfoCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderInfoCard> createState() => _OrderInfoCardState();
}

class _OrderInfoCardState extends State<OrderInfoCard> {
  RestaurantOrderController controller = Get.find<RestaurantOrderController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.centerLeft,
          child: Text("Customer",
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.left),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.symmetric(
              //       horizontal: 10,
              ),
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: const Color(0xffececec), width: 0.5),
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              BasicCellComponent(
                url: (widget.order.value)!.customer.image,
                title: (widget.order.value)!.customer.name,
                traillingIcon: Container(
                  child: Stack(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.chat_bubble_outline,
                          color: Color(0xff5c7fff),
                        ),
                        onPressed: () {
                          Get.toNamed(
                            getMessagesRoute(
                                orderType: OrderType.Restaurant,
                                chatId: widget.order.value?.orderId ?? '',
                                orderId: widget.order.value!.orderId,
                                recipientType: ParticipantType.Customer),
                          );
                        },
                      ),
                      Positioned(
                        left: 28,
                        top: 10,
                        child: (controller.orderHaveNewMessageNotifications(
                                widget.order.value!.orderId))
                            ? Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: const Color(0xfff6efff), width: 2),
                                  color: const Color(0xffff0000),
                                ),
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: Get.width,
                height: 1,
                decoration: BoxDecoration(
                  color: const Color(0xffececec),
                ),
              ),
              if (widget.order.value?.inProcess() ?? false)
                Container(
                  margin: EdgeInsets.all(5),
                  child: Column(
                    children: buildRestOrderButtons(widget.order),
                  ),
                )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),

        Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.centerLeft,
          child: Text("${_i18n()["orderItems"]}",
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.left),
        ),
        RestaurantOrderItemsComponent(items: widget.order.value!.items),
        // buildOrdersItems(widget.order.value!.items),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
