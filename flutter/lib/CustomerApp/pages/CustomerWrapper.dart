import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
// import 'package:mezcalmos/CustomerApp/pages/Orders/MakeOrderScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';

class CustomerWrapper extends GetWidget<AuthController> {
  SideMenuDraweController _sideMenuDrawerController =
      Get.find<SideMenuDraweController>();
  CustomerAuthController _customerAuthController =
      Get.find<CustomerAuthController>();
  // pop Point!
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _sideMenuDrawerController.getNewKey(),
        drawer: MezSideMenu(),
        backgroundColor: Colors.white,
        appBar: MezcalmosSharedWidgets.mezcalmosAppBar(
            "menu", _sideMenuDrawerController.openMenu),
        body: _getNextView());
  }

  Widget _getNextView() {
    print(controller.user?.data);
    return ListRestaurantsScreen();
  }
}
