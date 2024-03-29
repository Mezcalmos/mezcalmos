import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrderDetails/components/DvOrderItems.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrderDetails/controllers/DvOrderDetailsViewController.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderSummaryCard.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["pages"]["OrderDetailsScreen"];

//
class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  static Future<void> navigate({required int orderId}) {
    return MezRouter.toPath(DeliveryAppRoutes.kOrderDetailsViewRoute
        .replaceAll(":orderId", orderId.toString()));
  }

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late String orderId;
  Rxn<DeliveryOrder> order = Rxn();
  DvOrderDetailsViewController viewController = DvOrderDetailsViewController();

  @override
  void initState() {
    final String orderId = MezRouter.urlArguments['orderId'].toString();
    mezDbgPrint("MezRouter.urlArguments ===> $orderId");
    if (int.tryParse(orderId) != null) {
      viewController.init(orderId: int.parse(orderId));
    }

    super.initState();
  }
 @override 
 void dispose(){
  viewController.dispose();
  super.dispose();
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        title: '${_i18n()['orderDetails']}',
        AppBarLeftButtonType.Back,
        autoBack: true,
      ),
      body: Obx(() {
        if (viewController.order.value != null) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _orderDetailsHeader(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${_i18n()['orderDetails']}",
                  style: context.txt.bodyLarge,
                ),
                SizedBox(
                  height: 5,
                ),
                Card(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (viewController.order.value!.scheduleTime != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${_i18n()["schTime"]}",
                                style: context.txt.bodyLarge,
                              ),
                              Text(viewController.order.value!.scheduleTime!
                                  .getOrderTime()),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        if (viewController.order.value!.pickupLocation != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${_i18n()["from"]}",
                                style: context.txt.bodyLarge,
                              ),
                              Text(viewController
                                      .order.value?.pickupLocation?.address ??
                                  ""),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        Text(
                          "${_i18n()["deliveredTo"]}",
                          style: context.txt.bodyLarge,
                        ),
                        Text(
                            "${viewController.order.value!.dropOffLocation.address}"),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${_i18n()["paymentMethod"]}",
                          style: context.txt.bodyLarge,
                        ),
                        Text(
                            "${_i18n()[viewController.order.value!.paymentType.toNormalString().toLowerCase()]}"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "${_i18n()['customer']}",
                  style: context.txt.bodyLarge,
                ),
                SizedBox(
                  height: 5,
                ),
                _customerCard(),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "${_i18n()['service']}",
                  style: context.txt.bodyLarge,
                ),
                SizedBox(
                  height: 5,
                ),
                _serviceCard(),
                DvOrderItems(
                  viewController: viewController,
                ),
                if (viewController.showBillAndTax)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: _billCard(context),
                  ),
                if (viewController.orderCosts != null)
                  OrderSummaryCard(
                    margin: EdgeInsets.only(top: 20),
                    costs: viewController.orderCosts!,
                    setTaxCallBack: (viewController.showBillAndTax == true)
                        ? () {
                            viewController.taxText.text =
                                viewController.tax.value?.toString() ?? "";
                            _showTaxSheet(context);
                          }
                        : null,
                    setDeliveryCallBack: (viewController.showEditPrice)
                        ? () {
                            _showPriceSheet(context);
                          }
                        : null,
                    stripeOrderPaymentInfo:
                        viewController.order.value!.stripePaymentInfo,
                  ),
                if (viewController.order.value!.status ==
                        cModels.DeliveryOrderStatus.OrderReceived &&
                    viewController.order.value!.isDriverAssigned)
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: MezButton(
                      label: '${_i18n()["cancelOrder"]}',
                      onClick: () async {
                        await showConfirmationDialog(context,
                            onYesClick: () async {
                          final bool resp = await viewController.cancelOrder();
                          if (resp) {
                            Navigator.pop(context);
                          }
                        });
                      },
                      backgroundColor: offRedColor,
                      textColor: Colors.redAccent,
                    ),
                  )
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }

  MezCard _billCard(BuildContext context) {
    return MezCard(
      contentPadding: EdgeInsets.only(bottom: 8, top: 8, right: 8),
      content: Text(
        "${_i18n()['bill']}",
        style: context.txt.bodyLarge,
      ),
      action: Container(
        child: (viewController.billLoading.isTrue)
            ? SizedBox(
                height: 30, width: 30, child: CircularProgressIndicator())
            : (viewController.newBillUrl.value == null)
                ? Flexible(
                    child: MezButton(
                      label: "${_i18n()['upload']}",
                      onClick: () async {
                        await viewController.editImage(context);
                      },
                      height: 30,
                      borderRadius: 5,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MezButton(
                        height: 5.h,
                        width: 25.w,
                        textStyle:
                            context.txt.bodyLarge?.copyWith(fontSize: 10.sp),
                        onClick: () async {
                          unawaited(showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  contentPadding: EdgeInsets.zero,
                                  content: Container(
                                    width: 70.w,
                                    height: 60.h,
                                    child: PhotoView(
                                      imageProvider: CachedNetworkImageProvider(
                                        viewController.newBillUrl.value!,
                                        //  style: context.txt.titleSmall,
                                      ),
                                    ),
                                  ),
                                );
                              }));
                        },
                        textColor: offShadeGreyColor,
                        label: '${_i18n()['viewImage']}',
                        backgroundColor: Colors.transparent,
                      ),
                      MezIconButton(
                        elevation: 0,
                        onTap: () async {
                          await viewController.editImage(context);
                        },
                        backgroundColor: Colors.transparent,
                        icon: Icons.delete_outlined,
                        iconColor: redAccentColor,
                      )
                    ],
                  ),
        // CachedNetworkImage(
        //     imageUrl: viewController.newBillUrl.value!,
        //     width: 70,
        //     height: 40,
        //   ),
      ),
    );
  }

  Container _orderDetailsHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            viewController.order.value!.orderTime.toLocal().getEstimatedTime(),
            style: context.txt.bodyLarge,
          ),
          Text(
              viewController.order.value!.isCanceled()
                  ? "${_i18n()["cancelled"]}"
                  : "${_i18n()["approved"]}",
              style: context.txt.bodyLarge?.copyWith(
                  color: viewController.order.value!.isCanceled()
                      ? Colors.red
                      : primaryBlueColor))
        ],
      ),
    );
  }

  Card _customerCard() {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  viewController.order.value!.customer.image),
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${viewController.order.value!.customer.name}",
                    style: context.txt.bodyLarge,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.history,
                        color: Colors.black,
                        size: 15.sp,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        '${viewController.customerOrdersCount.value?.toString() ?? '-'} ${_i18n()['order'].toString().toPlural(isPlural: viewController.customerOrdersCount.value != 1)}',
                        style: context.txt.bodyMedium
                            ?.copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.star,
                        color: primaryBlueColor,
                        size: 18.sp,
                      ),
                      Text(
                        "${viewController.customerReview.value?.toStringAsFixed(1) ?? '-'}",
                        style: context.txt.bodyMedium
                            ?.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (viewController.order.value!.isDriverAssigned &&
                viewController.order.value!.customerDriverChatId != null)
              MessageButton(
                  chatId: viewController.order.value!.customerDriverChatId!,
                  onTap: () {
                    BaseMessagingScreen.navigate(
                        chatId:
                            viewController.order.value!.customerDriverChatId!);
                  })
          ],
        ),
      ),
    );
  }

  Card _serviceCard() {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  viewController.order.value!.serviceProvider.image),
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${viewController.order.value!.serviceProvider.name}",
                    style: context.txt.bodyLarge,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.history,
                        color: Colors.black,
                        size: 15.sp,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        "${viewController.serviceOrdersCount.value?.toString() ?? "-"} ${_i18n()['order'].toString().toPlural(isPlural: viewController.serviceOrdersCount.value != 1)}",
                        style: context.txt.bodyMedium
                            ?.copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.star,
                        color: primaryBlueColor,
                        size: 18.sp,
                      ),
                      Text(
                        "${viewController.serviceReview.value?.toStringAsFixed(1) ?? '-'}",
                        style: context.txt.bodyMedium
                            ?.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (viewController.order.value!.isDriverAssigned &&
                viewController.order.value!.serviceProviderDriverChatId != null)
              MessageButton(
                  chatId:
                      viewController.order.value!.serviceProviderDriverChatId!,
                  onTap: () {
                    BaseMessagingScreen.navigate(
                        chatId: viewController
                            .order.value!.serviceProviderDriverChatId!);
                  })
          ],
        ),
      ),
    );
  }

  String _getOrderType() {
    switch (viewController.order.value!.orderType) {
      case cModels.OrderType.Restaurant:
        return "${_i18n()["restaurant"]}";
      case cModels.OrderType.Laundry:
        return "${_i18n()["laundry"]}";
      case cModels.OrderType.Courier:
        return "Courier";

      default:
        return "";
    }
  }

  Future<dynamic> _showTaxSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
            child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${_i18n()['addTax']}",
                        style: context.txt.bodyLarge,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: viewController.taxText,
                      style: context.txt.bodyLarge,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        prefixIcon: Icon(
                          Icons.attach_money_rounded,
                          color: Colors.black,
                        ),
                      ),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: MezButton(
                            height: 45,
                            label: "${_i18n()['cancel']}",
                            backgroundColor: offRedColor,
                            textColor: Colors.red,
                            onClick: () async {
                              await MezRouter.back();
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: MezButton(
                            height: 45,
                            label: "${_i18n()['save']}",
                            onClick: () async {
                              await viewController.editTax();
                              await MezRouter.back();
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                )),
          );
        });
  }

  Future<dynamic> _showPriceSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
            child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Form(
                  key: viewController.updatePriceFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${_i18n()['updateTitle']}",
                          style: context.txt.bodyLarge,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      if (viewController.orderCosts?.deliveryCost != 0)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${_i18n()['updateReason']}"),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: viewController.openOrderReasonText,
                              style: context.txt.bodyLarge,
                              validator: (String? v) {
                                if (v == null || v.isEmpty) {
                                  return "${_i18n()['required']}";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      Text("${_i18n()['updatePrice']}",
                          style: context.txt.bodyLarge),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: viewController.openOrderPriceText,
                        style: context.txt.bodyLarge,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.attach_money_rounded,
                            color: Colors.black,
                          ),
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                        ],
                        validator: (String? v) {
                          if (v == null || v.isEmpty) {
                            return "${_i18n()['required']}";
                          } else if (double.tryParse(v) == null) {
                            return "${_i18n()['notValid']}";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MezButton(
                              height: 45,
                              label: "${_i18n()['save']}",
                              onClick: () async {
                                await viewController.requestPriceChange(ctx);
                                // await viewController.editTax();
                                // await MezRouter.back();
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: MezButton(
                              height: 45,
                              label: "${_i18n()['cancel']}",
                              backgroundColor: offRedColor,
                              textColor: Colors.red,
                              onClick: () async {
                                Navigator.pop(context);
                                // await MezRouter.back();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          );
        });
  }
}
