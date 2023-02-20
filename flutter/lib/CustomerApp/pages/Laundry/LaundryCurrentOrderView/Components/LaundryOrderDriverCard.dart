import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';

//
dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]["Laundry"]
        ["LaundryCurrentOrderView"]["Components"]["LaundryOrderDriverCard"];
//

class LaundryOrderDriverCard extends StatelessWidget {
  const LaundryOrderDriverCard({Key? key, required this.order})
      : super(key: key);
  final LaundryOrder order;

  @override
  Widget build(BuildContext context) {
    if (_getRightDriver() != null && order.inProcess()) {
      return Card(
          margin: const EdgeInsets.only(top: 15),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                        radius: 23,
                        backgroundImage: CachedNetworkImageProvider(
                            _getRightDriver()!.image)),
                    Positioned(
                      right: -35,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CircleAvatar(
                              radius: 23,
                              child: Icon(
                                Icons.delivery_dining,
                                size: 30,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ),
                    // Positioned(
                    //   right: -35,
                    //   child: CircleAvatar(
                    //     radius: 23,
                    //     child: Icon(
                    //       Icons.delivery_dining,
                    //       size: 30,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
                SizedBox(
                  width: 45,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    _getRightDriver()!.name,
                    style: Get.textTheme.bodyText1,
                  ),
                ),
                if (_getRightChatId() != null)
                  MessageButton(
                    onTap: () {
                      MezRouter.toNamed(
                        getMessagesRoute(
                          chatId: _getRightChatId()!,
                          recipientType: ParticipantType.DeliveryDriver,
                          orderType: OrderType.Laundry,
                          orderId: order.orderId,
                        ),
                      );
                    },
                    chatId: _getRightChatId()!,
                  ),
              ],
            ),
          ));
    } else {
      return Container();
    }
  }

  int? _getRightChatId() {
    if (order.getCurrentPhase() == LaundryOrderPhase.Pickup &&
        order.customerPickupDriverChatId != null) {
      return order.customerPickupDriverChatId;
    } else if (order.customerDropOffDriverChatId != null) {
      return order.customerDropOffDriverChatId;
    }
    return null;
  }

  DeliveryDriverUserInfo? _getRightDriver() {
    if (order.getCurrentPhase() == LaundryOrderPhase.Pickup) {
      return order.pickupDriver;
    } else {
      return order.dropoffDriver;
    }
  }
}
