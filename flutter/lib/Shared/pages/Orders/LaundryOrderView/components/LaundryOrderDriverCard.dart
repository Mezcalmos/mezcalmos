import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/pages/Orders/LaundryOrderView/controllers/LaundryOrderViewController.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/PickDriverView/PickDriverView.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezIconButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["LaundryApp"]["pages"]
    ["OrderView"]["Components"]["LaundryOpOrderDriverCard"];

class LaundryOrderDriverCard extends StatelessWidget {
  const LaundryOrderDriverCard({Key? key, required this.viewController})
      : super(key: key);
  final LaundryOrderViewController viewController;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: (_isDriverExist())
              ? Row(children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                          radius: 23,
                          backgroundImage:
                              CachedNetworkImageProvider(_getDriver()!.image)),
                      Positioned(
                        right: -30,
                        child: CircleAvatar(
                          radius: 23,
                          child: Icon(
                            Icons.delivery_dining,
                            size: 32,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getDriver()!.name,
                          style: context.txt.bodyLarge,
                        ),
                        if (_getTime() != null) Text(_getTime()!)
                      ],
                    ),
                  ),
                  Spacer(),
                  if (viewController.order.isSelfDelivery())
                    MezIconButton(
                      icon: Icons.edit,
                      onTap: () {
                        PickDriverView.navigate(
                            deliveryOrderId:
                                viewController.order.deliveryOrderId,
                            showForwardButton: false);
                      },
                    ),
                  Obx(
                    () => MessageButton(
                        chatId: _getCorrectChatId(),
                        onTap: () {
                          BaseMessagingScreen.navigate(
                              chatId: _getCorrectChatId());
                        }),
                  )
                ])
              : Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 23,
                          backgroundColor: Color(0xFFEDEDED),
                        ),
                        Positioned(
                          right: -30,
                          child: CircleAvatar(
                            radius: 23,
                            child: Icon(
                              Icons.delivery_dining,
                              size: 32,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        "${_i18n()["noDriver"]}",
                        style: context.txt.bodyLarge,
                      ),
                    ),
                    if (viewController.order.isSelfDelivery())
                      MezIconButton(
                        icon: Icons.add,
                        onTap: () {
                          PickDriverView.navigate(
                              deliveryOrderId:
                                  viewController.order.deliveryOrderId,
                              showForwardButton: false);
                        },
                      )
                  ],
                )),
    );
  }

  String? _getTime() {
    final String userLangCode =
        Get.find<LanguageController>().userLanguageKey.toLanguageCode();
    if (viewController.order.getCurrentPhase() == LaundryOrderPhase.Pickup &&
        viewController.order.estimatedPickupFromCustomerTime != null) {
      return "${_i18n()["pickUpTime"]}:\n${DateFormat.MMMd(userLangCode).format(viewController.order.estimatedPickupFromCustomerTime!.toLocal())} ${DateFormat("hh:mm a").format(viewController.order.estimatedPickupFromCustomerTime!.toLocal())}";
    } else if (viewController.order.estimatedArrivalAtDropoff != null &&
        viewController.order.status !=
            cModels.LaundryOrderStatus.PickedUpFromLaundry) {
      return "${_i18n()["dropOffTime"]}:\n${DateFormat.MMMd(userLangCode).format(viewController.order.estimatedArrivalAtDropoff!.toLocal())} ${DateFormat("hh:mm a").format(viewController.order.estimatedArrivalAtDropoff!.toLocal())}";
    } else {
      return null;
    }
  }

  bool _isDriverExist() {
    if (viewController.order.getCurrentPhase() == LaundryOrderPhase.Pickup) {
      return viewController.order.pickupDriver != null;
    } else {
      return viewController.order.driverInfo != null;
    }
  }

  int _getCorrectChatId() {
    if (viewController.order.getCurrentPhase() == LaundryOrderPhase.Pickup) {
      return viewController.order.serviceProviderPickupDriverChatId!;
    } else {
      return viewController.order.serviceProviderDriverChatId!;
    }
  }

  UserInfo? _getDriver() {
    if (viewController.order.getCurrentPhase() == LaundryOrderPhase.Pickup) {
      return viewController.order.pickupDriver;
    } else {
      return viewController.order.driverInfo;
    }
  }

  void _handleMessageRouting() {
    if (viewController.order.getCurrentPhase() == LaundryOrderPhase.Pickup) {
      _laundryPickupDriverMessageRoute();
    } else {
      _laundryDropOffDriverMessageRoute();
    }
  }

  void _laundryDropOffDriverMessageRoute() {
    BaseMessagingScreen.navigate(
      chatId: viewController.order.serviceProviderDriverChatId!,
    );
  }

  void _laundryPickupDriverMessageRoute() {
    BaseMessagingScreen.navigate(
      chatId: viewController.order.serviceProviderPickupDriverChatId!,
    );
  }
}
