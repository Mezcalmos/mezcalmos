import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustCartView/controllers/CustCartViewController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewCartScreen"]["components"]["OrderSummaryCard"];

class CardSummaryCard extends StatelessWidget {
  const CardSummaryCard({
    Key? key,
    required this.controller,
    this.serviceLoc,
  }) : super(key: key);

  final MezLocation? serviceLoc;

  final CustCartViewController controller;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Obx(
      () => Card(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //=======================Order summary================
              Container(
                alignment: Alignment.centerLeft,
                width: Get.width,
                child: Text(
                  "${_i18n()["orderSummary"]}",
                  style: context.txt.bodyLarge,
                ),
              ),
              SizedBox(height: 4),
              //==================Order cost :==================
              Container(
                padding: const EdgeInsets.only(bottom: 4),
                width: Get.width,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Text("${_i18n()["orderCost"]}",
                            style: txt.bodyMedium),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(controller.cart.itemsCost().toPriceString(),
                            style: txt.bodyMedium),
                      ),
                    )
                  ],
                ),
              ), //==================Order cost :==================
              Container(
                padding: const EdgeInsets.only(bottom: 4),
                width: Get.width,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child:
                            Text("${_i18n()["pFees"]}", style: txt.bodyMedium),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(controller.pFees.toPriceString(),
                            style: txt.bodyMedium),
                      ),
                    )
                  ],
                ),
              ),
              //=======================Delivery cost :===============
              if (controller.showDelivery)
                Container(
                  padding: EdgeInsets.only(
                    bottom: 4,
                  ),
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Text("${_i18n()["deliveryCost"]}",
                              style: txt.bodyMedium),
                        ),
                      ),
                      Row(
                        children: [
                          Text('-',
                              style: txt.bodyMedium
                                  ?.copyWith(fontStyle: FontStyle.italic)),
                        ],
                      )
                    ],
                  ),
                ),
              //=======================Stripe fees :=============== //
              if (controller.showFees)
                Container(
                  padding: EdgeInsets.only(
                    bottom: 4,
                  ),
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Text("${_i18n()["stripeFees"]}",
                              style: txt.bodyMedium),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                              controller.cart.stripeFees.toPriceString(),
                              style: txt.bodyMedium),
                        ),
                      )
                    ],
                  ),
                ),
              //=======================Total cost : ==================
              Container(
                padding: EdgeInsets.only(bottom: 4, top: 3),
                width: Get.width,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Text(
                          "${_i18n()["totalCost"]}",
                          style: txt.headlineMedium,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                            (controller.cart.itemsCost() + controller.pFees)
                                .toPriceString(),
                            style: txt.headlineSmall),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 8,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
