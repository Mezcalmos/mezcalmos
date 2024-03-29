import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['CustomerApp']["pages"]
        ["Restaurants"]["ViewOrderScreen"]["components"]["OrderRestaurantCard"];

class OrderRestaurantCard extends StatelessWidget {
  const OrderRestaurantCard({Key? key, required this.order}) : super(key: key);
  final RestaurantOrder order;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 3),
          child: Text(
            '${_i18n()["restaurant"]}',
            style: context.txt.bodyLarge,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      CachedNetworkImageProvider(order.restaurant.image),
                  radius: 25,
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
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            order.restaurant.name,
                            style: context.txt.bodyLarge,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.place,
                              size: 13.sp,
                              color: primaryBlueColor,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Flexible(
                              flex: 8,
                              fit: FlexFit.tight,
                              child: Text(
                                order.restaurant.location.address,
                                style: context.txt.bodyMedium,
                                overflow: TextOverflow.visible,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                MessageButton(
                  onTap: () {
                    BaseMessagingScreen.navigate(chatId: order.chatId);
                  },
                  chatId: order.chatId,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
