import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/CustAddReviewButton.dart';
import 'package:mezcalmos/CustomerApp/controllers/custBusinessCartController.dart';
import 'package:mezcalmos/CustomerApp/models/BusinessCartItem.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/components/EventCartItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/components/HomeCartItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/components/ProductCartItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/components/RentalCartItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/components/ServiceCartItemCard.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessOrderHelper.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustOrderView']['CustOrderView'];

class CustOrderView extends StatefulWidget {
  const CustOrderView({super.key});

  @override
  State<CustOrderView> createState() => _CustOrderViewState();

  static Future<void> navigate({required int orderId}) {
    return MezRouter.toPath(CustBusinessRoutes.custOrderViewRoute,
        arguments: {"orderId": orderId});
  }
}

class _CustOrderViewState extends State<CustOrderView> {
  final CustBusinessCartController custBusinessCartController =
      Get.find<CustBusinessCartController>();

  late int orderId;

  @override
  void initState() {
    orderId = MezRouter.bodyArguments!["orderId"] as int;
    custBusinessCartController.setCurrentOrderInView(orderId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        title: (custBusinessCartController.currentOrderInView.value == null)
            ? '${_i18n()['order']}'
            : "${custBusinessCartController.currentOrderInView.value!.getBusinessName()}",
      ),
      bottomNavigationBar: Obx(() {
        if (custBusinessCartController.currentOrderInView.value!.status ==
                BusinessOrderRequestStatus.Confirmed ||
            custBusinessCartController.currentOrderInView.value!.status ==
                BusinessOrderRequestStatus.Completed) {
          return CustAddReviewButton(
            orderId: custBusinessCartController.currentOrderInView.value!.id!,
            toEntityId: custBusinessCartController
                .currentOrderInView.value!.businessId!
                .toInt(),
            toEntityType: ServiceProviderType.Business,
          );
        } else {
          return SizedBox.shrink();
        }
      }),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: bottomButtons(context),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: (custBusinessCartController.currentOrderInView.value == null)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      orderStatusCard(),
                      smallSepartor,
                      MezCard(
                          content: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(getBusinessImage()),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                getBusinessName(),
                                style: context.textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          MessageButton(
                            chatId: custBusinessCartController
                                .currentOrderInView.value!.chatId!
                                .toInt(),
                            onTap: () async {
                              await BaseMessagingScreen.navigate(
                                  chatId: custBusinessCartController
                                      .currentOrderInView.value!.chatId!
                                      .toInt());
                            },
                          ),
                        ],
                      )),
                      if (custBusinessCartController
                          .currentOrderInView.value!.items.isNotEmpty)
                        smallSepartor,
                      if (custBusinessCartController
                          .currentOrderInView.value!.items.isNotEmpty)
                        ...custBusinessCartController
                            .currentOrderInView.value!.items
                            .asMap()
                            .entries
                            .map(
                          (data) {
                            final int index = data.key;
                            final BusinessCartItem item = data.value;
                            switch (item.offeringType) {
                              case OfferingType.Home:
                                return HomeCartItemCard(
                                  index: index,
                                  item: item,
                                  controller: custBusinessCartController,
                                  isEditable: false,
                                );
                              case OfferingType.Rental:
                                return RentalCartItemCard(
                                  index: index,
                                  item: item,
                                  controller: custBusinessCartController,
                                  isEditable: false,
                                );
                              case OfferingType.Event:
                                return EventCartItemCard(
                                  index: index,
                                  item: item,
                                  controller: custBusinessCartController,
                                  isEditable: false,
                                );
                              case OfferingType.Service:
                                return ServiceCartItemCard(
                                  index: index,
                                  item: item,
                                  controller: custBusinessCartController,
                                  isEditable: false,
                                );
                              case OfferingType.Product:
                                return ProductCartItemCard(
                                  index: index,
                                  item: item,
                                  controller: custBusinessCartController,
                                  isEditable: false,
                                );
                            }
                          },
                        ).toList(),
                      smallSepartor,
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          '${_i18n()['notes']}',
                          style: context.textTheme.bodyLarge,
                        ),
                      ),
                      smallSepartor,
                      TextFormField(
                        maxLines: 5,
                        minLines: 3,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: '${_i18n()['writeNotesHere']}',
                        ),
                      ),
                      smallSepartor,
                      MezCard(
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${_i18n()['summary']}',
                              style: context.textTheme.bodyLarge,
                            ),
                            smallSepartor,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${_i18n()['orderCost']}',
                                  style: context.textTheme.bodyMedium,
                                ),
                                Text(
                                  "\$${custBusinessCartController.currentOrderInView.value?.cost.toDouble().toStringAsFixed(0)}",
                                  style: context.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // smallSepartor,
                      // bottomButtons(context),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  String getBusinessImage() {
    switch (custBusinessCartController
        .currentOrderInView.value!.items.first.offeringType) {
      case OfferingType.Rental:
        return custBusinessCartController
            .currentOrderInView.value!.items.first.rental!.business.image;
      case OfferingType.Event:
        return custBusinessCartController
            .currentOrderInView.value!.items.first.event!.business.image;
      case OfferingType.Service:
        return custBusinessCartController
            .currentOrderInView.value!.items.first.service!.business.image;
      case OfferingType.Product:
        return custBusinessCartController
            .currentOrderInView.value!.items.first.product!.business.image;
      case OfferingType.Home:
        return custBusinessCartController
            .currentOrderInView.value!.items.first.home!.business.image;
    }
  }

  String getBusinessName() {
    switch (custBusinessCartController
        .currentOrderInView.value!.items.first.offeringType) {
      case OfferingType.Rental:
        return custBusinessCartController
            .currentOrderInView.value!.items.first.rental!.business.name;
      case OfferingType.Event:
        return custBusinessCartController
            .currentOrderInView.value!.items.first.event!.business.name;
      case OfferingType.Service:
        return custBusinessCartController
            .currentOrderInView.value!.items.first.service!.business.name;
      case OfferingType.Product:
        return custBusinessCartController
            .currentOrderInView.value!.items.first.product!.business.name;
      case OfferingType.Home:
        return custBusinessCartController
            .currentOrderInView.value!.items.first.home!.business.name;
    }
  }

  Widget bottomButtons(BuildContext context) {
    if (custBusinessCartController.currentOrderInView.value!.status ==
            BusinessOrderRequestStatus.CancelledByCustomer ||
        custBusinessCartController.currentOrderInView.value!.status ==
            BusinessOrderRequestStatus.CancelledByBusiness) {
      return SizedBox.shrink();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (custBusinessCartController.currentOrderInView.value!.status !=
                BusinessOrderRequestStatus.Confirmed &&
            custBusinessCartController.currentOrderInView.value!.status !=
                BusinessOrderRequestStatus.Completed)
          MezCard(
            content: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.info_outline,
                    color: primaryBlueColor,
                  ),
                ),
                if (custBusinessCartController
                        .currentOrderInView.value!.status ==
                    BusinessOrderRequestStatus.RequestReceived)
                  Expanded(
                    child: Text(
                      '${_i18n()['notComfirmed']}',
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: primaryBlueColor,
                      ),
                    ),
                  ),
                if (custBusinessCartController
                        .currentOrderInView.value!.status ==
                    BusinessOrderRequestStatus.ModificationRequestByBusiness)
                  Expanded(
                    child: Text(
                      '${_i18n()['businessModifications']}',
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: primaryBlueColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        if (custBusinessCartController.currentOrderInView.value!.status ==
            BusinessOrderRequestStatus.ModificationRequestByBusiness)
          MezButton(
            label: '${_i18n()['acceptChange']}',
            onClick: () async {
              await custBusinessCartController.acceptOrderRequest();
            },
          ),
        smallSepartor,
        if (custBusinessCartController.currentOrderInView.value!.status ==
                BusinessOrderRequestStatus.RequestReceived ||
            custBusinessCartController.currentOrderInView.value!.status ==
                BusinessOrderRequestStatus.ModificationRequestByBusiness)
          MezButton(
            label: '${_i18n()['cancelRequest']}',
            textColor: Colors.red,
            backgroundColor: Colors.red.shade100,
            onClick: () async {
              await custBusinessCartController.cancelOrderRequest();
            },
          ),
      ],
    );
  }

  Widget orderStatusCard() {
    return MezCard(
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(
              custBusinessCartController.currentOrderInView.value!.status!
                  .getIcon(),
              color: custBusinessCartController.isCanceled
                  ? redAccentColor
                  : primaryBlueColor,
            ),
            Expanded(
              child: Text(
                custBusinessCartController.currentOrderInView.value!.status!
                    .toReadableString(),
                style: context.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
