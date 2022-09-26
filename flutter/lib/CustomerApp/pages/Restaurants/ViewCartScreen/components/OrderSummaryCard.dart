import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/DropDownLocationList.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/widgets/ShippingCostComponent.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewCartScreen"]["components"]["OrderSummaryCard"];

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    Key? key,
    required this.orderCost,
    required this.deliveryCost,
    required this.setLocationCallBack,
    required this.totalCost,
    this.serviceLoc,
    this.stripeFees,
    required this.showStripeFees,
  }) : super(key: key);

  final String orderCost;
  final num? deliveryCost;
  final num? stripeFees;
  final bool showStripeFees;
  final String totalCost;
  final Location? serviceLoc;
  final void Function({Location? location})? setLocationCallBack;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
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
              child: Text("${_i18n()["orderSummary"]}", style: txt.bodyText1),
            ),
            const SizedBox(height: 20),
            //==================Order cost :==================
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              width: Get.width,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text("${_i18n()["orderCost"]} :",
                          style: txt.bodyText2),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(orderCost),
                    ),
                  )
                ],
              ),
            ),
            //=======================Delivery cost :===============
            Container(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text("${_i18n()["deliveryCost"]} :",
                          style: txt.bodyText2),
                    ),
                  ),
                  (deliveryCost != null)
                      ? Flexible(
                          child: ShippingCostComponent(
                          alignment: MainAxisAlignment.end,
                          shippingCost: deliveryCost!,
                        ))
                      : Text(
                          "To be calculated",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        )
                ],
              ),
            ),
            //=======================Stripe fees :=============== //
            if (stripeFees != null && showStripeFees)
              Container(
                padding: EdgeInsets.only(
                  bottom: 10,
                ),
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Text("${_i18n()["stripeFees"]} :",
                            style: txt.bodyText2),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(stripeFees!.toPriceString()),
                      ),
                    )
                  ],
                ),
              ),
            //=======================Total cost : ==================
            Container(
              padding: EdgeInsets.only(bottom: 10, top: 3),
              width: Get.width,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text("${_i18n()["totalCost"]} :",
                          style: txt.bodyText1),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(totalCost, style: txt.bodyText1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //=======================Delivery location :===========
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "${_i18n()["deliveryLocation"]} :",
                style: txt.bodyText1,
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 10),
            DropDownLocationList(
              onValueChangeCallback: setLocationCallBack,
              checkDistance: true,
              serviceProviderLocation: serviceLoc,
              bgColor: secondaryLightBlueColor,
            ),
          ],
        ),
      ),
    );
  }
}
