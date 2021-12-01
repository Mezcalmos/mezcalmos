import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/incrementalComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

import '../../../../router.dart';
import '../ViewItemScreen.dart';

class BottomBarItemViewScreen extends StatefulWidget {
  BottomBarItemViewScreen(
      {Key? key, required this.cartItem, required this.mode})
      : super(key: key);
  final Rxn<CartItem> cartItem;
  final ViewItemScreenMode mode;

  @override
  _BottomBarItemViewScreenState createState() =>
      _BottomBarItemViewScreenState();
}

class _BottomBarItemViewScreenState extends State<BottomBarItemViewScreen> {
  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    LanguageController lang = Get.find<LanguageController>();
    RestaurantController restaurantCartController =
        Get.find<RestaurantController>();

    return Container(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      height: 60,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: IncrementalComponent(
                increment: () {
                  widget.cartItem.value!.quantity++;
                  widget.cartItem.refresh();
                },
                decrement: () {
                  // if(widget.cartItem.value!.quantity<=1){

                  // }
                  widget.cartItem.value!.quantity--;
                  widget.cartItem.refresh();
                },
                minVal: 1,
                value: widget.cartItem.value!.quantity,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              //price thing
              child: Center(
                  child: Text(
                "${currency.format(widget.cartItem.value!.totalCost())} \$",
                style: txt.headline2,
              )),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(172, 89, 252, 1),
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  child: Center(
                    child: Text(
                      widget.mode == ViewItemScreenMode.AddItemMode
                          ? lang.strings['customer']['restaurant']['menu']
                              ['addToCart']
                          : lang.strings['customer']['restaurant']['menu']
                              ['modifyItem'],
                      style: txt.headline2!
                          .copyWith(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
                onTap: () {
                  if (ViewItemScreenMode.AddItemMode == widget.mode) {
                    restaurantCartController.addItem(widget.cartItem.value!);
                    Get.offNamed(kCartRoute);
                  } else {
                    restaurantCartController.addItem(widget.cartItem.value!);
                    Get.back();
                  }
                },
              ),
            ),
          )
        ],
      ),
    ));
  }
}
