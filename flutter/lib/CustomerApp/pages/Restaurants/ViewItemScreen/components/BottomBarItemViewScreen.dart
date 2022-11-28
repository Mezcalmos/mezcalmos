import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/ViewItemScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/DialogRequiredSignIn.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/IncrementalComponent.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]["Restaurants"]["ViewItemScreen"]["components"]
    ["BottomBarItemViewScreen"];

class BottomBarItemViewScreen extends StatefulWidget {
  const BottomBarItemViewScreen({
    Key? key,
    required this.cartItem,
    required this.mode,
    this.currentRestaurantId,
  }) : super(key: key);

  final Rxn<CartItem> cartItem;
  final ViewItemScreenMode mode;
  final String? currentRestaurantId;

  @override
  _BottomBarItemViewScreenState createState() =>
      _BottomBarItemViewScreenState();
}

class _BottomBarItemViewScreenState extends State<BottomBarItemViewScreen> {
  RestaurantController restaurantCartController =
      Get.find<RestaurantController>();
  AuthController auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;

    return addItemToCartButton(txt);
  }

  Widget restaurantClosedNow() {
    return Container(
      height: 60,
      width: Get.width,
      color: Color(0xFFF9D8D6),
      child: Center(
        child: Text(
          "${_i18n()["notAvailable"]}",
          style: Get.textTheme.bodyText1?.copyWith(color: Colors.red),
        ),
      ),
    );
  }

  Widget addItemToCartButton(TextTheme txt) {
    return Container(
      height: 60,
      padding: EdgeInsets.only(bottom: 16, right: 5, left: 5, top: 5),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 5),
          IncrementalComponent(
            btnColors: primaryBlueColor,
            onMinValueBtnColor: Colors.grey.shade300,
            incrementCallback: () {
              widget.cartItem.value!.quantity++;
              widget.cartItem.refresh();
            },
            decrementCallback: () {
              widget.cartItem.value!.quantity--;
              widget.cartItem.refresh();
            },
            minVal: 1,
            value: widget.cartItem.value!.quantity,
          ),
          const Spacer(),
          Container(
            child: Center(
              child: Text(
                "\$${widget.cartItem.value!.totalCost().toInt()} ",
                style: txt.headline3,
              ),
            ),
          ),
          const Spacer(),
          Flexible(
            flex: 6,
            fit: FlexFit.tight,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              onPressed: (restaurantCartController.cart.value
                          .canAddSpecial(item: widget.cartItem.value!) ==
                      false)
                  ? () async {
                      await _addSpecialItemCallBack();
                    }
                  : () async {
                      if (auth.fireAuthUser != null) {
                        if (ViewItemScreenMode.AddItemMode == widget.mode) {
                          if (restaurantCartController
                                  .associatedRestaurant?.info.firebaseId !=
                              null) {
                            if (restaurantCartController
                                    .associatedRestaurant?.info.firebaseId ==
                                widget.currentRestaurantId) {
                              mezDbgPrint(
                                  "the first id is ${restaurantCartController.associatedRestaurant?.info.firebaseId} and the scond is ${widget.currentRestaurantId}");
                              await restaurantCartController
                                  .addItem(widget.cartItem.value!);
                              await Get.offNamed<void>(kCartRoute);
                            } else {
                              mezDbgPrint(
                                  "not true ${restaurantCartController.associatedRestaurant?.info.firebaseId} and the other is ${widget.currentRestaurantId}");

                              await showStatusInfoDialog(
                                context,
                                bottomRightIcon: Icons.shopping_cart,
                                btnRightIconBgColor: secondaryLightBlueColor,
                                primaryImageUrl: restaurantCartController
                                    .associatedRestaurant?.info.image,
                                btnRightIconColor: primaryBlueColor,
                                status: restaurantCartController
                                        .associatedRestaurant?.info.name ??
                                    "",
                                primaryClickTitle: _i18n()["rightBtn"],
                                secondaryClickTitle: _i18n()["leftBtn"],
                                description: _i18n()["subtitle"],
                                secondaryCallBack: () async {
                                  Get.back<void>();
                                  await Get.toNamed<void>(kCartRoute);
                                },
                                primaryCallBack: () async {
                                  Get.back<void>();
                                  await restaurantCartController
                                      .addItem(widget.cartItem.value!);
                                  await Get.offNamed<void>(kCartRoute);
                                },
                              );
                            }
                          } else {
                            if (restaurantCartController.cart.value
                                        .canAddSpecial(
                                            item: widget.cartItem.value!) !=
                                    null &&
                                restaurantCartController.cart.value
                                        .canAddSpecial(
                                            item: widget.cartItem.value!) ==
                                    false) {
                              mezDbgPrint("Error");
                              MezSnackbar("Error", "Special time error");
                            } else {
                              await restaurantCartController
                                  .addItem(widget.cartItem.value!);
                              await Get.offNamed<void>(kCartRoute);
                            }
                          }
                        } else {
                          await restaurantCartController
                              .addItem(widget.cartItem.value!);
                          Get.back<void>();
                        }
                      } else {
                        dialogRequiredSignIn();
                      }
                    },
              child: Text(
                widget.mode == ViewItemScreenMode.AddItemMode
                    ? _i18n()['addToCart']
                    : _i18n()['modifyItem'],
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _addSpecialItemCallBack() async {
    await showStatusInfoDialog(
      context,
      bottomRightIcon: Icons.shopping_cart,
      btnRightIconBgColor: secondaryLightBlueColor,
      primaryImageUrl:
          restaurantCartController.cart.value.getFirstSpecialItem?.item.image,
      btnRightIconColor: primaryBlueColor,
      status: restaurantCartController.associatedRestaurant?.info.name ?? "",
      primaryClickTitle: _i18n()["rightBtn"],
      secondaryClickTitle: _i18n()["leftBtn"],
      description: _i18n()["specialSubtitle"],
      secondaryCallBack: () async {
        Get.back<void>();
        await Get.toNamed<void>(kCartRoute);
      },
      primaryCallBack: () async {
        mezDbgPrint("OVERIDDDING CART WITH NEW SPECIAL");
        restaurantCartController.clearCart();
        await restaurantCartController.saveCart();
        mezDbgPrint(
            "Clearing cart =============================>>>>>${restaurantCartController.cart.value.cartItems}");
        await restaurantCartController.addItem(widget.cartItem.value!);
        await Get.offNamed<void>(kCartRoute);
      },
    );
  }
}
