import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/courier_order/hsCourierOrder.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Courier/CourierOrder.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

class CustCourierOrderViewController {
  // instances //

  HasuraDb hasuraDb = Get.find<HasuraDb>();
  // vars //
  late BuildContext context;
  Rxn<CourierOrder> _order = Rxn();
  Rxn<ChangePriceRequest> changePriceReq = Rxn();

  // getters //
  bool get hasData => _order.value != null;
  CourierOrder get order => _order.value!;
  DeliveryOrderStatus get orderStatus {
    return _order.value!.status;
  }

  // streams //
  StreamSubscription<CourierOrder?>? orderStream;
  String? subscriptionId;

  // init
  Future<void> init(
      {required int orderId, required BuildContext context}) async {
    this.context = context;
    Get.find<ForegroundNotificationsController>().clearAllOrderNotifications(
        orderType: OrderType.Courier, orderId: orderId);
    try {
      _order.value = await get_courier_order_by_id(
        orderId: orderId,
      );
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    if (_order.value == null) {
      mezDbgPrint("🚨 Can't get order $orderId 🚨 ROpOrderViewController");
    } else {
      subscriptionId = hasuraDb.createSubscription(start: () {
        orderStream = listen_on_courier_order_by_id(orderId: orderId)
            .listen((CourierOrder? event) {
          mezDbgPrint(
              "Stream triggred from order controller ✅✅✅✅✅✅✅✅✅ =====> ${event?.driverInfo}");

          if (event != null) {
            _order.value = null;
            _order.value = event;

            mezDbgPrint(
                "Order bill imaaaaaaaaggggggeeee======>${_order.value?.billImage}");

            _order.refresh();
            if (event.changePriceRequest != null &&
                event.changePriceRequest?.status ==
                    ChangePriceRequestStatus.Requested) {
              mezDbgPrint("Should Showwwww");
              showPriceReqDialog();
            }
          }
        });
      }, cancel: () {
        orderStream?.cancel();
        orderStream = null;
      });
    }
  }

  void showPriceReqDialog() {
    mezDbgPrint("Show dialog called");
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: false,
            contentPadding:
                const EdgeInsets.only(bottom: 0, top: 16, left: 16, right: 16),
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            // contentPadding:
            //     const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFECEEFF), shape: BoxShape.circle),
                    padding: const EdgeInsets.all(16),
                    child: Icon(
                      Icons.price_change_rounded,
                      size: 35,
                      color: primaryBlueColor,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Price change request",
                    style: context.textTheme.displayMedium,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text("New price",
                          style: context.textTheme.displaySmall
                              ?.copyWith(fontSize: 20)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(order.changePriceRequest?.newPrice.toPriceString() ??
                          "-"),
                      if (order.changePriceRequest?.reason != null &&
                          order.changePriceRequest!.reason.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              height: 20,
                            ),
                            Text(
                              "Reason",
                              style: context.textTheme.bodyLarge,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(order.changePriceRequest?.reason ?? "reason"),
                          ],
                        ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                  MezButton(
                    label: "Accept",
                    onClick: () async {
                      await _priceChangeResponse(accepted: true);
                      Navigator.pop(context);
                    },
                  ),
                  MezButton(
                    label: "Cancel order",
                    height: 50,
                    backgroundColor: Colors.transparent,
                    textColor: Colors.grey.shade900,
                    onClick: () async {
                      await _priceChangeResponse(accepted: false);
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> _priceChangeResponse({required bool accepted}) async {
    try {
      ChangePriceResResponse res =
          await CloudFunctions.delivery2_changeDeliveryPriceResponse(
              accepted: accepted,
              orderId: order.orderId,
              orderType: OrderType.Courier);
      if (res.success == false) {
        mezDbgPrint(res.error);
        showErrorSnackBar(errorText: res.error.toString());
      }
    } on FirebaseFunctionsException catch (e) {
      showErrorSnackBar(errorText: e.message.toString());
      mezDbgPrint(e);
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

// Order status change methods

  Future<void> addReview({
    required String comment,
    required num rate,
  }) async {
    //CloudFunctions.res
  }

  Future<bool> cancelOrder() async {
    try {
      await CloudFunctions.delivery2_cancelCourierFromCustomer(
          orderId: order.orderId);
      return true;
    } on FirebaseFunctionsException catch (e, stk) {
      showErrorSnackBar(errorText: e.message.toString());
      mezDbgPrint(stk);
      mezDbgPrint(e);
      return false;
    } catch (e) {
      mezDbgPrint(e);
      return false;
    }
  }

  void dispose() {
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    _order.close();
  }
}
