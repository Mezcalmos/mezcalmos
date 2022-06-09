import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';

class OrderLaundryCard extends StatelessWidget {
  const OrderLaundryCard({Key? key, required this.order}) : super(key: key);
  final LaundryOrder order;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  CachedNetworkImageProvider(order.laundry?.image ?? ""),
              radius: 23,
            ),
            SizedBox(
              width: 7,
            ),
            Flexible(
                fit: FlexFit.tight,
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.laundry?.name ?? "",
                      style: Get.textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.place,
                          size: 18,
                          color: Theme.of(context).primaryColorLight,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Flexible(child: Text(order.to.address, maxLines: 1)),
                      ],
                    )
                  ],
                )),
            Spacer(),
            Obx(
              () => MessageButton(
                showRedDot: Get.find<OrderController>()
                    .orderHaveNewMessageNotifications(order.orderId),
                onTap: () {
                  Get.toNamed<void>(getMessagesRoute(
                      orderId: order.orderId,
                      chatId: order.orderId,
                      recipientType: ParticipantType.DeliveryAdmin));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _messageButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.toNamed<void>(getMessagesRoute(
            orderId: order.orderId,
            chatId: order.orderId,
            recipientType: ParticipantType.DeliveryAdmin));
      },
      icon: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            //  margin: EdgeInsets.all(12),
            child: Icon(
              Icons.textsms,
              color: primaryBlueColor,
            ),
          ),
          Obx(
            () => Get.find<OrderController>()
                    .orderHaveNewMessageNotifications(order.orderId)
                ? Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 13,
                      height: 13,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color(0xfff6efff), width: 2),
                          color: const Color(0xffff0000)),
                    ),
                  )
                : Container(),
          )
        ],
      ),
    );
  }
}