import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustItemView/components/DialogRequiredSignIn.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustItemView/controllers/CustItemViewController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/IncrementalComponent.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]["Restaurants"]["ViewItemScreen"]["components"]
    ["BottomBarItemViewScreen"];

class ItemViewBottomBar extends StatefulWidget {
  const ItemViewBottomBar({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  final CustItemViewController viewController;

  @override
  _ItemViewBottomBarState createState() => _ItemViewBottomBarState();
}

class _ItemViewBottomBarState extends State<ItemViewBottomBar> {
  AuthController auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.only(bottom: 16, right: 5, left: 5, top: 5),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 5),
          IncrementalComponent(
            btnColors: primaryBlueColor,
            onMinValueBtnColor: Colors.grey.shade300,
            incrementCallback: () async {
              widget.viewController.updateItemQuantity(inc: true);
            },
            decrementCallback: () async {
              widget.viewController.updateItemQuantity(inc: false);
            },
            onChangedToZero: !widget.viewController.isAdding
                ? () async {
                    await showConfirmationDialog(context,
                        title: "${_i18n()['rmItemTitle']}",
                        helperText: "${_i18n()['rmItemHelper']}",
                        primaryButtonText: "${_i18n()['rmItemButton']}",
                        onYesClick: () async {
                      bool res = await widget.viewController.removeItem();
                      if (res) {
                        MezRouter.untill(
                            (Route p0) => Get.currentRoute == kCartRoute);
                      }
                    });
                  }
                : null,
            minVal: 1,
            value: widget.viewController.cartItem.value!.quantity,
          ),
          const Spacer(),
          Container(
            child: Center(
              child: Text(
                "\$${widget.viewController.cartItem.value!.totalCost().toInt()} ",
                style: Get.textTheme.displaySmall,
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
                textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              onPressed: () async {
                await _handleAddButton();
              },
              child: Text(
                widget.viewController.currentMode ==
                        ViewItemScreenMode.AddItemMode
                    ? _i18n()['addToCart']
                    : _i18n()['modifyItem'],
                textAlign: TextAlign.center,
                style: Get.textTheme.headlineLarge
                    ?.copyWith(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          )
        ],
      ),
    );
  }

  Widget restaurantClosedNow() {
    return Container(
      height: 60,
      width: Get.width,
      color: Color(0xFFF9D8D6),
      child: Center(
        child: Text(
          "${_i18n()["notAvailable"]}",
          style: Get.textTheme.bodyLarge?.copyWith(color: Colors.red),
        ),
      ),
    );
  }

  Future<void> _handleAddButton() async {
    if (auth.fireAuthUser == null) {
      dialogRequiredSignIn();
    } else {
      if (widget.viewController.isAdding) {
        if (widget.viewController.checkAddSpecialItemConflict()) {
          await _addSpecialItemCallBack();
        } else if (widget.viewController.differentRestaurantIds()) {
          await _overriteCart();
        } else {
          try {
            await widget.viewController
                .handleAddItem()
                .whenComplete(() => MezRouter.toNamed(kCartRoute));
          } catch (e, stk) {
            mezDbgPrint(e);
            mezDbgPrint(stk);
          }
        }
      } else {
        try {
          await widget.viewController
              .handleEditItem()
              .whenComplete(() => MezRouter.toNamed(kCartRoute));
        } catch (e, stk) {
          mezDbgPrint(e);
          mezDbgPrint(stk);
        }
      }
    }
  }

  Future<void> _overriteCart() async {
    await showStatusInfoDialog(
      context,
      bottomRightIcon: Icons.shopping_cart,
      btnRightIconBgColor: secondaryLightBlueColor,
      primaryImageUrl: widget.viewController.cart.value?.restaurant?.info.image,
      btnRightIconColor: primaryBlueColor,
      status: "${_i18n()["rightBtn"]}?",
      primaryClickTitle: _i18n()["rightBtn"],
      secondaryClickTitle: _i18n()["leftBtn"],
      description:
          '${_i18n()["subtitle"]} ${widget.viewController.cart.value?.restaurant?.info.name ?? ""} ${_i18n()["overwriteText"]} ',
      secondaryCallBack: () async {
        MezRouter.popDialog<void>();
        await MezRouter.toNamed<void>(kCartRoute);
      },
      primaryCallBack: () async {
        await widget.viewController.handleAddItem();
        MezRouter.popDialog<void>();

        await MezRouter.offNamed<void>(kCartRoute);
      },
    );
  }

  Future<void> _addSpecialItemCallBack() async {
    await showStatusInfoDialog(
      context,
      bottomRightIcon: Icons.shopping_cart,
      btnRightIconBgColor: secondaryLightBlueColor,
      primaryImageUrl:
          widget.viewController.cart.value?.getFirstSpecialItem?.item.image,
      btnRightIconColor: primaryBlueColor,
      status: widget.viewController.restaurant.value?.info.name ?? "",
      primaryClickTitle: _i18n()["rightBtn"],
      secondaryClickTitle: _i18n()["leftBtn"],
      description: _i18n()["specialSubtitle"],
      secondaryCallBack: () async {
        MezRouter.popDialog<void>();
        await MezRouter.toNamed<void>(kCartRoute);
      },
      primaryCallBack: () async {
        mezDbgPrint("OVERIDDDING CART WITH NEW SPECIAL");
        await widget.viewController.cartController?.clearCart();
        await widget.viewController.handleAddItem();
        await MezRouter.offNamed<void>(kCartRoute);
      },
    );
  }
}
