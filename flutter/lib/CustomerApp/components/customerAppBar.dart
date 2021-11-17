import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/components/actionIconsComponents.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantCartController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/fbNotificationsController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';

MyPopupMenuController _popUpController = MyPopupMenuController();

AppBar customerAppBar(AppBarLeftButtonType leftBtnType,
    {bool withCart = false}) {
  return mezcalmosAppBar(leftBtnType, actionIcons: [
    // Obx(() =>
    //),
    // ActionIconsComponents.orderIcon(),
    // SizedBox(
    //     height: 30,
    //     width: 30,
    //     child: withCart &&
    //             Get.find<RestaurantCartController>().cart.value.items.length > 0
    //         ? ActionIconsComponents.cartIcon()
    //         : Container())
    getIcons(withCart)
  ]);
}

Widget getIcons(bool withCart) {
  return Obx(() {
    //Get.find<FBNotificationsController>().notifications.value.length > 0 &&
    //  withCart &&
    if (Get.find<RestaurantCartController>().cart.value.items.length > 0) {
      return Row(
        children: [
          ActionIconsComponents.orderIcon(
              Get.find<OrderController>().currentOrders.value.length > 0
                  ? true
                  : false),
          MyPopupMenu(
            controller: _popUpController,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Image.network(
                  "${Get.find<AuthController>().user!.image}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            menuBuilder: (context) => ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                  color: Colors.transparent,
                  child: IntrinsicWidth(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InkWell(
                            onTap: () {
                              _popUpController.hideMenu();
                            },
                            child: ActionIconsComponents.notificationIcon(
                                true, EdgeInsets.symmetric(horizontal: 5), () {
                              _popUpController.hideMenu();
                            }, ButtonColorType.ButtonDarkColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              _popUpController.hideMenu();
                            },
                            child: ActionIconsComponents.cartIcon(
                                EdgeInsets.symmetric(horizontal: 5), () {
                              _popUpController.hideMenu();
                            }, ButtonColorType.ButtonDarkColor),
                          )
                        ]),
                  )),
            ),
            pressType: PressType.singleClick,
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Get.find<FBNotificationsController>().notifications.value.length > 0
              ? ActionIconsComponents.notificationIcon(true)
              : SizedBox(),
          ActionIconsComponents.orderIcon(
              Get.find<OrderController>().currentOrders.value.length > 0
                  ? true
                  : false),
          withCart &&
                  Get.find<RestaurantCartController>().cart.value.items.length >
                      0
              ? ActionIconsComponents.cartIcon(EdgeInsets.only(right: 0))
              : Container()
        ],
      );
    }
  });
}
