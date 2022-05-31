import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/MyExpensionPanelComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/Components/itemChosenChoices.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/ItemInformationCart.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/IncrementalComponent.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';

final NumberFormat currency = new NumberFormat("#,##0.00", "en_US");

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewCartScreen"]["components"]["BuildItems"];

class CartItemsBuilder extends StatelessWidget {
  const CartItemsBuilder({Key? key}) : super(key: key);

  /// RestaurantController
  static final RestaurantController _restaurantController =
      Get.find<RestaurantController>();

  /// LanguageType
  static final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: _restaurantController.cart.value.cartItems.fold<List<Widget>>(
            <Widget>[], (List<Widget> children, CartItem cartItem) {
          // final Rx<num> counter = cartItem.totalCost().obs;
          children.add(Container(
            margin: const EdgeInsets.all(5),
            child: MyExpansionPanelComponent(
              child: Flexible(
                  child: ItemInformationCart(
                imageUrl: cartItem.item.image,
                itemName: cartItem.item.name[userLanguage]![0].toUpperCase() +
                    cartItem.item.name[userLanguage]!.substring(1),
                restaurantName:
                    _restaurantController.associatedRestaurant?.info.name ?? "",
                itemsPrice: cartItem.totalCost().toStringAsFixed(0),
              )),
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IncrementalComponent(
                              minVal: 1,
                              btnColors: SecondaryLightBlueColor,
                              alignment: MainAxisAlignment.start,
                              onMinValueBtnColor: Colors.grey.shade400,
                              incrementCallback: () {
                                // counter.value =
                                //     counter.value + cartItem.costPerOne();
                                //print("${cartItem.item.id}");
                                _restaurantController.incrementItem(
                                    cartItem.idInCart!, 1);
                                mezDbgPrint(
                                    "quant ttttttoooooo${_restaurantController.cart.value.cartItems.first.quantity}");
                                _restaurantController.refresh();
                              },
                              onChangedToZero: () async {
                                final YesNoDialogButton yesNoResult =
                                    await cancelAlertDialog(
                                        title: _i18n()["deleteItem"],
                                        body: _i18n()["deleteItemConfirm"],
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
                                  _restaurantController
                                      .deleteItem(cartItem.idInCart!);
                                  if (_restaurantController.cart.value
                                          .quantity() ==
                                      0) {
                                    _restaurantController.clearCart();
                                    Get.until((Route route) =>
                                        route.settings.name == kHomeRoute);
                                  }
                                  // controller.refresh();

                                }
                              },
                              value: cartItem.quantity,
                              decrementCallback: () {
                                // counter.value =
                                //     counter.value + cartItem.costPerOne();
                                _restaurantController.incrementItem(
                                    cartItem.idInCart!, -1);
                                _restaurantController.refresh();
                              }),
                          Text(
                            "\$${cartItem.totalCost()}",
                            style: Get.textTheme.headline3,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: buildChoices(cartItem.chosenChoices),
                      ),
                    ],
                  ),
                ),
                if (cartItem.notes != null)
                  _itemNotesComponent(cartItem, context),
                SizedBox(
                  height: 10,
                ),
              ],
              onEdit: () {
                mezDbgPrint(
                    " the data inside the expansion ${cartItem.toFirebaseFunctionFormattedJson()}");
                Get.toNamed(editCartItemRoute("${cartItem.idInCart}"));
              },
            ),
          ));
          return children;
        }),
      ),
    );
  }

  Container _itemNotesComponent(CartItem cartItem, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("${_i18n()["itemNotes"]}"),
          ),
          Container(
            child: Text(
              cartItem.notes!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildChoices(Map<String, List<Choice>> choices) {
    final List<Widget> viewWidgets = [];
    choices.forEach((String key, List<Choice> value) {
      viewWidgets.add(ItemChosenChoiceComponent(
        choices: value,
        optionName: key,
      ));
    });
    return viewWidgets;
  }
}
