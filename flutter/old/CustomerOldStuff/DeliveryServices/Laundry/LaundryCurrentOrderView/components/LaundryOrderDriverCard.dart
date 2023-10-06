import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]["Laundry"]
        ["LaundryCurrentOrderView"]["Components"]["LaundryOrderDriverCard"];

class LaundryOrderDriverCard extends StatelessWidget {
  const LaundryOrderDriverCard({Key? key, required this.order})
      : super(key: key);
  final LaundryOrder order;

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("Calling ======================>>>>>${_getRightDriver()}");
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
                  ],
                ),
                SizedBox(
                  width: 45,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    _getRightDriver()!.name,
                    style: context.txt.bodyLarge,
                  ),
                ),
                if (_getRightChatId() != null)
                  MessageButton(
                    onTap: () {
                      BaseMessagingScreen.navigate(chatId: _getRightChatId()!);
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
    } else if (order.customerDriverChatId != null) {
      return order.customerDriverChatId;
    }
    return null;
  }

  UserInfo? _getRightDriver() {
    if (order.getCurrentPhase() == LaundryOrderPhase.Pickup) {
      return order.pickupDriver;
    } else {
      return order.driverInfo;
    }
  }
}
