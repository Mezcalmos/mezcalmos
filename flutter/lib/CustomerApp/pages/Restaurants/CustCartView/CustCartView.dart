// ignore_for_file: unawaited_futures

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/CustDeliveryTypePicker.dart';
import 'package:mezcalmos/CustomerApp/components/DropDownLocationList.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/components/BuildItems.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/components/CartIsEmptyScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/components/DeliveryTimePicker.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/components/OrderSummaryCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/controllers/CustCartViewController.dart';
import 'package:mezcalmos/CustomerApp/router/restaurantRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/LoadingWidgets/MezLoadingOverlay.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewCartScreen"]["ViewCartScreen"];

class ViewCartScreen extends StatefulWidget {
  static Future<void> navigate() {
    return MezRouter.toNamed(RestaurantRoutes.cartRoute);
  }

  @override
  _ViewCartScreenState createState() => _ViewCartScreenState();
}

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
    return Obx(
      () => MezLoadingOverlay(
        isLoading: viewController.showRedirectText.value,
        label: "${_i18n()['redirectText']}",
        labelStyle: context.textTheme.bodyMedium?.copyWith(color: Colors.white),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: MezcalmosAppBar(
            AppBarLeftButtonType.Back,
            onClick: () {
              if (viewController.orderSentToRest.value) {
                MezRouter.popEverythingTillBeforeHome();
              } else
                MezRouter.back();
            },
            title: "${_i18n()["myCart"]}",
          ),
          body: Obx(() {
            if (viewController.orderSentToRest.value) {
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle_rounded,
                      color: primaryBlueColor,
                      size: 50.mezSp,
                    ),
                    meduimSeperator,
                    Text(
                      "${_i18n()['sentTitle']}",
                      style: context.textTheme.bodyLarge
                          ?.copyWith(color: primaryBlueColor),
                    ),
                    smallSepartor,
                    Text(
                      "${_i18n()['sentSubtitle']}",
                      textAlign: TextAlign.center,
                    ),
                    bigSeperator
                  ],
                ),
              );
            }
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
                    smallSepartor,
                    Text(
                      "${_i18n()['restaurant']}",
                      style: context.textTheme.bodyLarge,
                    ),
                    smallSepartor,
                    MezCard(
                      radius: 20,
                      onClick: viewController.routeToRestaurant,
                      firstAvatarBgImage: CachedNetworkImageProvider(
                          viewController.cart.restaurant!.info.image),
                      content: Text(
                        viewController.cart.restaurant!.info.name,
                        style: context.textTheme.bodyLarge,
                      ),
                      action: Icon(
                        Icons.open_in_new,
                        color: primaryBlueColor,
                      ),
                    ),
                    Form(
                      key: viewController.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DeliveryTimePicker(
                            deliveryTime: viewController.cart.deliveryTime,
                            fixed7days: !viewController.cart.isSpecial,
                            isServiceOpen:
                                viewController.cart.restaurant!.isOpen,
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
                          CustDeliveryTypeSelector(
                            types: viewController.dvTypes,
                            onDeliveryTypeChanged: (DeliveryType value) {
                              viewController.switchDeliveryType(type: value);
                              mezDbgPrint(
                                  "Changed from parent callback ==>$value");
                            },
                          ),
                          if (viewController.showDelivery) _deliveryLocation(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Container(
                    //   child: PaymentMethodPicker(
                    //     viewCartController: viewController,
                    //   ),
                    // ),
                    Container(
                      //alignment: Alignment.centerLeft,
                      child: Text("${_i18n()['notesTitle']}",
                          style: context.txt.bodyLarge),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    _notesComponent(context),
                    SizedBox(
                      height: 20,
                    ),
                    CardSummaryCard(
                      controller: viewController,
                    ),
                    smallSepartor,
                    if (viewController.showDelivery)
                      MezCard(
                          firstAvatarIcon: Icons.delivery_dining,
                          firstAvatarIconColor: primaryBlueColor,
                          firstAvatarBgColor: secondaryLightBlueColor,
                          content: Text("${_i18n()['dvHelper']}")),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
              );
            } else {
              return CartIsEmptyScreen();
            }
          }),
          bottomSheet: _footerButton(),
        ),
      ),
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
              checkDistance: false,
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
          minLines: 2,
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
        if (viewController.cart.cartItems.length > 0 &&
            viewController.orderSentToRest.value == false) {
          return MezButton(
            label: '${_i18n()["orderNow"]}',
            withGradient: true,
            borderRadius: 0,
            height: 50,
            onClick: () async {
              if (viewController.formKey.currentState?.validate() == true &&
                  viewController.canOrder) {
                mezDbgPrint("Called");
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
