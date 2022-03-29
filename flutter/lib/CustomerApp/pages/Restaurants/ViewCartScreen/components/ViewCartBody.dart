import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/BuildCart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/BuildItems.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/OrderSummaryCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/TextFieldComponent.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Location.dart';

final NumberFormat currency = new NumberFormat("#,##0.00", "en_US");

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewCartScreen"]["components"]["ViewCartBody"];

class ViewCartBody extends StatefulWidget {
  final void Function({Location? location})? setLocationCallBack;
  final TextEditingController notesTextController;

  const ViewCartBody({
    required this.notesTextController,
    Key? key,
    this.setLocationCallBack,
  }) : super(key: key);

  @override
  _ViewCartBodyState createState() => _ViewCartBodyState();
}

class _ViewCartBodyState extends State<ViewCartBody> {
  RestaurantController controller = Get.find<RestaurantController>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => Column(
          children: <Widget>[
            (controller.cart.value.quantity() >= 1)
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      CartBuilder(),
                      SizedBox(height: 10),
                      CartItemsBuilder()
                    ],
                  )
                : Container(),
            SizedBox(
              height: 10,
            ),
            Obx(() => OrderSummaryCard(
                  setLocationCallBack: widget.setLocationCallBack,
                  deliveryCost:
                      controller.cart.value.shippingCost.toStringAsFixed(0),
                  orderCost:
                      controller.cart.value.itemsCost().toStringAsFixed(0),
                  totalCost:
                      controller.cart.value.totalCost().toStringAsFixed(0),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.centerLeft,
              child: Text("${_i18n()['notes']}",
                  style: const TextStyle(
                      color: const Color(0xff000f1c),
                      fontFamily: "psb",
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                  textAlign: TextAlign.left),
            ),
            SizedBox(
              height: 15,
            ),
            TextFieldComponent(
              textController: widget.notesTextController,
              hint: _i18n()["notes"],
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
