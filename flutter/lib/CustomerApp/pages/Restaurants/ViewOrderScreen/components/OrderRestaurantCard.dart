import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/routes/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';

class OrderRestaurantCard extends StatelessWidget {
  OrderRestaurantCard(
      {Key? key,
      required this.order,
      this.isWebVersion,
      this.textStyle,
      this.navigateMsgCallback})
      : super(key: key);
  final RestaurantOrder order;
  bool? isWebVersion = false;
  Function? navigateMsgCallback;
  TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      CachedNetworkImageProvider(order.restaurant.image),
                  radius: isWebVersion == true ? 35 : 25,
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.restaurant.name,
                          style: Get.textTheme.bodyText1!.copyWith(
                              fontSize: (isWebVersion == true) ? 16 : null,
                              fontWeight: (isWebVersion == true)
                                  ? FontWeight.w700
                                  : null),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.place,
                              size: 18,
                              color: primaryBlueColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              flex: 8,
                              fit: FlexFit.tight,
                              child: Text(
                                order.restaurant.location.address,
                                style: Get.textTheme.bodyText2!.copyWith(
                                    fontSize:
                                        (isWebVersion == true) ? 14 : null,
                                    color: (isWebVersion == true)
                                        ? Color.fromRGBO(73, 73, 73, 1)
                                        : null),
                                overflow: TextOverflow.visible,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Obx(
                  () => MessageButton(
                      showRedDot: Get.find<OrderController>()
                          .orderHaveNewMessageNotifications(order.orderId),
                      onTap: () {
                        if (navigateMsgCallback == null) {
                          Get.toNamed<void>(
                            getMessagesRoute(
                              chatId: order.orderId,
                              orderId: order.orderId,
                              recipientType: ParticipantType.Restaurant,
                            ),
                          );
                        } else {
                          navigateMsgCallback!.call();
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
