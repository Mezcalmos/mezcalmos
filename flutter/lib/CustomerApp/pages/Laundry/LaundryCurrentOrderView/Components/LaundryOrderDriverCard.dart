import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
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
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Card(
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
                      backgroundImage:
                          CachedNetworkImageProvider(_getRightDriver()!.image)),
                  Positioned(
                    right: -35,
                    child: CircleAvatar(
                      radius: 23,
                      child: Icon(
                        Icons.delivery_dining,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 45,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getRightDriver()!.name,
                      style: Get.textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    if (_getTime() != null) Text(_getTime()!)
                    //  if (_getTime() != null) Text("${_getTime()}"),
                  ],
                ),
              ),
              if (_getRightChatId() != null)
                MessageButton(
                    showRedDot: Get.find<OrderController>()
                        .hasNewMessageNotification(_getRightChatId()!),
                    onTap: () {
                      Get.toNamed(getMessagesRoute(
                          chatId: _getRightChatId()!,
                          orderId: order.orderId,
                          recipientType: ParticipantType.DeliveryDriver));
                    })
            ],
          ),
        )),
      );
    } else {
      return Container();
    }
  }

  String? _getRightChatId() {
    if (order.getCurrentPhase() == LaundryOrderPhase.Pickup &&
        order.customerPickupDriverChatId != null) {
      return order.customerPickupDriverChatId;
    } else if (order.customerDropOffDriverChatId != null) {
      return order.customerDropOffDriverChatId;
    }
    return null;
  }

  String? _getTime() {
    final String userLangCode =
        Get.find<LanguageController>().userLanguageKey.toLanguageCode();
    if (order.getCurrentPhase() == LaundryOrderPhase.Pickup &&
        order.estimatedPickupFromCustomerTime != null) {
      return "${_i18n()["pickUpTime"]}:\n${DateFormat.MMMd(userLangCode).format(order.estimatedPickupFromCustomerTime!.toLocal())}, ${DateFormat("hh:mm a").format(order.estimatedPickupFromCustomerTime!.toLocal())}";
    } else if (order.estimatedDropoffAtCustomerTime != null) {
      return "${_i18n()["dropOffTime"]}:\n${DateFormat.MMMd(userLangCode).format(order.estimatedDropoffAtCustomerTime!.toLocal())}, ${DateFormat("hh:mm a").format(order.estimatedDropoffAtCustomerTime!.toLocal())}";
    } else {
      return null;
    }
  }

  DeliveryDriverUserInfo? _getRightDriver() {
    if (order.getCurrentPhase() == LaundryOrderPhase.Pickup) {
      return order.pickupDriver;
    } else {
      return order.dropoffDriver;
    }
  }
}
