import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAvatar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpOrderView"]["components"]["ROpOrderCustomer"];

class ROpOrderCustomer extends StatelessWidget {
  const ROpOrderCustomer({Key? key, required this.order}) : super(key: key);
  final RestaurantOrder order;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_i18n()["customer"]}',
            style: Get.textTheme.bodyLarge,
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (order.customer.image.isURL)
                    MezAvatar(
                      raduis: 25,
                      imageUrl: order.customer.image,
                      showDefaultImageOnError: true,
                      imagePlaceholderAsset: aDefaultAvatar,
                    ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      order.customer.name,
                      style: Get.theme.textTheme.bodyLarge,
                    ),
                  ),
                  MessageButton(
                    onTap: () {
                      MezRouter.toNamed(getMessagesRoute(
                          chatId: order.chatId,
                          recipientType: ParticipantType.DeliveryDriver,
                          orderId: order.orderId));
                    },
                    chatId: order.chatId,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
