import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/controllers/CustCartViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/customer/restaurantCart/hsRestaurantCart.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewCartScreen"]["components"]["BuildCart"];

class CartItemsHeader extends StatelessWidget {
  const CartItemsHeader({Key? key, required this.viewController})
      : super(key: key);
  final CustCartViewController viewController;

  /// RestaurantController

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Text("${_i18n()["inCart"]}", style: txt.bodyLarge),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: <Widget>[
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: InkWell(
                          onTap: () async {
                            await showConfirmationDialog(context,
                                title: _i18n()["clearCart"],
                                helperText: _i18n()["clearCartConfirm"],
                                primaryButtonText: _i18n()["yesClear"],
                                secondaryButtonText: _i18n()["no"],
                                onYesClick: () async {
                              await clear_customer_cart(
                                customer_id:
                                    Get.find<AuthController>().user!.hasuraId,
                              );

                              await viewController.cartController.clearCart();

                              await MezRouter.back();
                            });
                          },
                          child: const Icon(
                            Icons.delete_outline,
                            size: 22,
                            color: offLightShadeGreyColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
