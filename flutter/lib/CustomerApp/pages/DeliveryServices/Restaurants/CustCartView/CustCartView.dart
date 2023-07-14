// ignore_for_file: unawaited_futures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/DropDownLocationList.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustCartView/components/BuildItems.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustCartView/components/CartIsEmptyScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustCartView/components/DeliveryTimePicker.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustCartView/components/OrderSummaryCard.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustCartView/controllers/CustCartViewController.dart';
import 'package:mezcalmos/CustomerApp/router/restaurantRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/OrderDeliverySelector/MezOrderDeliverySelector.dart';

class ViewCartScreen extends StatefulWidget {
  static Future<void> navigate() {
    return MezRouter.toNamed(RestaurantRoutes.cartRoute);
  }

  @override
  _ViewCartScreenState createState() => _ViewCartScreenState();
}

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewCartScreen"]["ViewCartScreen"];

class _ViewCartScreenState extends State<ViewCartScreen> {
  CustCartViewController viewController = CustCartViewController();

  @override
  void initState() {
    viewController.init();
    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint(
        "🇲🇽 View cart screen is building=======>${viewController.cart.restaurant?.isOpen}");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        title: "${_i18n()["myCart"]}",
      ),
      body: Obx(() {
        if (viewController.hasData.isFalse) {
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        } else if (viewController.cart.cartItems.length > 0) {
          return SingleChildScrollView(
            reverse: false,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (viewController.cart.quantity() >= 1)
                  CartItemsBuilder(
                    viewController: viewController,
                  ),

                Form(
                  key: viewController.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DeliveryTimePicker(
                        deliveryTime: viewController.cart.deliveryTime,
                        fixed7days: !viewController.cart.isSpecial,
                        isServiceOpen: viewController.cart.restaurant!.isOpen,
                        numberOfDays: viewController.cart.isSpecial ? 1 : 7,
                        onValue: (DateTime? value) {
                          viewController.setDeliveryTime(value);
                        },
                        onClear: () {
                          viewController.setDeliveryTime(null);
                        },
                        periodOfTime: viewController.cart.cartPeriod,
                        schedule: viewController.cart.restaurant!.schedule,
                      ),
                      _deliveryLocation(),
                    ],
                  ),
                ),

                // Container(
                //   child: PaymentMethodPicker(
                //     viewCartController: viewController,
                //   ),
                // ),

                Obx(
                  () => CustOrderDeliverySelector(
                    onSelectionUpdate: (List<int> value) {
                      viewController.selectedCompanies = value;
                    },
                    distanceInKm: viewController.orderDistanceInKm.value,
                    onEstDeliveryPriceChange: (double value) {
                      viewController.setShippingCost(value);
                    },
                  ),
                ),

                CardSummaryCard(
                  controller: viewController,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  //alignment: Alignment.centerLeft,
                  child: Text("${_i18n()['notesTitle']}",
                      style: context.txt.bodyLarge),
                ),
                SizedBox(
                  height: 8,
                ),
                _notesComponent(context),
                bigSeperator,
                bigSeperator,
                bigSeperator,
              ],
            ),
          );
        } else {
          return CartIsEmptyScreen();
        }
      }),
      bottomSheet: _footerButton(),
    );
  }

  Widget _deliveryLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 15),
          alignment: Alignment.centerLeft,
          child: Text(
            "${_i18n()["deliveryLocation"]}",
            style: context.txt.bodyLarge,
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 9),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 1,
                  offset: Offset(0, .5))
            ]),
            child: DropDownLocationList(
              elevation: 1,
              onValueChangeCallback: (MezLocation location) {
                viewController.switchLocation(location);
              },
              bgColor: Colors.white,
              checkDistance: true,
              ensureVisible: false,
              serviceProviderLocation:
                  viewController.cart.restaurant?.info.location,
            ),
          ),
        ),
      ],
    );
  }

  Widget _notesComponent(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: TextFormField(
          style: context.txt.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
          controller: viewController.noteText,
          maxLines: 7,
          minLines: 4,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom / 5,
            ),
            hintText: "${_i18n()["notes"]}",
            fillColor: Colors.white,
            hintStyle: context.txt.titleMedium,
          ),
        ),
      ),
    );
  }

  Widget _footerButton() {
    return Obx(
      () {
        mezDbgPrint("Can order from view =========>${viewController.canOrder}");
        if (viewController.cart.cartItems.length > 0) {
          return MezButton(
            label: (viewController.cart.restaurant?.isOpen == false)
                ? '${_i18n()["scheduleOrder"]}'
                : '${_i18n()["orderNow"]}',
            //  enabled: viewController.canOrder,
            withGradient: true,
            borderRadius: 0,
            height: 50,
            onClick: () async {
              if (viewController.formKey.currentState?.validate() == true &&
                  viewController.canOrder) {
                await viewController.checkoutActionButton();
              }
            },
          );
        } else
          return SizedBox();
      },
    );
  }
}
