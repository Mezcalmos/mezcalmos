import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/IncrementalComponent.dart';
import 'package:mezcalmos/CustomerApp/components/MyExpensionPanelComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/ChoosenManyOption.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';

import 'ChoosenOneOption.dart';
import 'ItemInformationCart.dart';

final currency = new NumberFormat("#,##0.00", "en_US");

class CartItemsBuilder extends StatelessWidget {
  final RestaurantController controller = Get.find<RestaurantController>();
  final LanguageController lang = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: controller.cart.value.cartItems.fold<List<Widget>>(<Widget>[],
          (children, cartItem) {
        var counter = cartItem.totalCost().obs;
        children.add(Container(
          margin: const EdgeInsets.all(5),
          child: MyExpensionPanelComponent(
            child: Flexible(
                child: Obx(
              () => ItemInformationCart(
                imageUrl: cartItem.item.image!,
                itemName:
                    cartItem.item.name[lang.userLanguageKey]![0].toUpperCase() +
                        cartItem.item.name[lang.userLanguageKey]!.substring(1),
                restaurantName: controller.associatedRestaurant!.name,
                itemsPrice: counter.value.toStringAsFixed(0),
              ),
            )),
            children: choosenOneOption(cartItem.cartChooseOneItems, context) +
                choosenManyOption(cartItem.cartChooseManyItems, context) +
                [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    width: Get.width,
                    height: 0.5,
                    decoration: BoxDecoration(
                      color: const Color(0xffececec),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        children: [
                          Spacer(),
                          IncrementalComponent(
                              minVal: 0,
                              increment: () {
                                counter.value =
                                    counter.value + cartItem.costPerOne();
                                print("${cartItem.item.id}");
                                controller.incrementItem(cartItem.id!, 1);
                                controller.refresh();
                              },
                              onChangedToZero: (isZero) async {
                                if (isZero) {
                                  controller.refresh();
                                  YesNoDialogButton yesNoResult =
                                      await cancelAlertDialog(
                                          title: lang.strings["customer"]
                                                  ["restaurant"]["cart"]
                                              ["deleteItem"],
                                          body: lang.strings["customer"]
                                                  ["restaurant"]["cart"]
                                              ["deleteItemConfirm"],
                                          icon: Container(
                                            child: Icon(
                                              Icons.highlight_off,
                                              size: 65,
                                              color: Color(0xffdb2846),
                                            ),
                                          ));
                                  mezDbgPrint(
                                      " the returend value from the dailog $yesNoResult");
                                  if (yesNoResult == YesNoDialogButton.Yes) {
                                    controller.deleteItem(cartItem.id!);
                                    if (controller.cart.value.quantity() == 0) {
                                      controller.clearCart();
                                      Get.until((route) =>
                                          route.settings.name == kHomeRoute);
                                    }
                                    // controller.refresh();
                                  }
                                }
                              },
                              value: cartItem.quantity,
                              decrement: () {
                                if (cartItem.quantity <= 1) {
                                } else {
                                  counter.value =
                                      counter.value + cartItem.costPerOne();
                                  controller.incrementItem(cartItem.id!, -1);
                                  controller.refresh();
                                }
                              }),
                        ],
                      )),
                ],
            onEdit: () {
              mezDbgPrint(
                  " the data inside the expansion ${cartItem.toFirebaseFunctionFormattedJson()}");
              Get.toNamed(editCartItemRoute("${cartItem.id}"));
            },
          ),
        ));
        return children;
      }),
    );
  }
}
