import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/components/ButtonComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/ViewCartBody.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/CartIsEmptyScreen.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

// ignore: constant_identifier_names
enum DropDownResult { Null, String }

class ViewCartScreen extends StatefulWidget {
  @override
  _ViewCartScreenState createState() => _ViewCartScreenState();
}

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewCartScreen"]["ViewCartScreen"];

class _ViewCartScreenState extends State<ViewCartScreen> {
  RestaurantController controller = Get.find<RestaurantController>();
  bool _clickedOrderNow = false;
  DropDownResult ddResult = DropDownResult.Null;

  TextEditingController textcontoller = TextEditingController();
  CustomerAuthController customerAuthController =
      Get.find<CustomerAuthController>();
  var listOfSavedLoacations = <SavedLocation>[];
  SavedLocation? dropDownListValue;
  Location? orderToLocation;
  int nbClicks = 0;
  @override
  void initState() {
    super.initState();
    // check if cart empty
    // if yes redirect to home page
    controller.cart.value.cartItems.map((item) {
      mezDbgPrint(
          "+++ From ViewCartScreen ==> ${item.id} <= notes => ${item.notes}");
    });
  }

  @override
  void dispose() {
    textcontoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppBar(
        autoBack: true,
        title: "${_i18n()["myCart"]}",
      ),
      body: Obx(() {
        mezDbgPrint("@sa@d@: ${controller.cart.value.cartItems.length}");
        if (controller.cart.value.cartItems.length > 0) {
          return SingleChildScrollView(
              child: ViewCartBody(
            setLocationCallBack: ({Location? location}) {
              setState(() {
                orderToLocation = location;
              });
            },
            notesTextController: textcontoller,
          ));
        } else {
          return CartIsEmptyScreen();
        }
      }),
      bottomNavigationBar: ButtonComponent(
          bgColor: getTheRightButtonColor(),
          widget: Center(
              child: getTheRightWidgetForOrderNowButton(_clickedOrderNow)),
          function: !_clickedOrderNow ? checkoutActionButton : () {}),
    );
  }

  Color getTheRightButtonColor() {
    // it returns the pruple or the grey color for the order now button

    if (orderToLocation == null ||
        !checkRestaurantAvailability(
            schedule: controller.associatedRestaurant?.schedule)) {
      return Color(0xdddddddd);
    } else {
      return Color(0xffac59fc);
    }
  }

  Widget getTheRightWidgetForOrderNowButton(bool clicked) {
    if (!checkRestaurantAvailability(
        schedule: controller.associatedRestaurant?.schedule)) {
      return Text("${_i18n()["notAvailable"]}",
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.black));
    }
    if (clicked) {
      return Container(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 1,
        ),
      );
    } else {
      return Text("${_i18n()['orderNow']}",
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.white));
    }
  }

  /// Call this right after customer presses Checkout
  /// Uses : Make sure that the order has been successfully written to database + already consumed by the listener.
  Future<void> avoidCheckoutRaceCondition(String orderId) async {
    if (Get.find<OrderController>().getOrder(orderId) == null) {
      await Get.find<OrderController>()
          .getCurrentOrderStream(orderId)
          .firstWhere((Order? order) => order != null);
    }
  }

//itemviewscreen
  Future<void> checkoutActionButton() async {
    if (nbClicks == 0) {
      if (orderToLocation != null) {
        setState(() {
          _clickedOrderNow = true;
        });
        controller.cart.value.toLocation = orderToLocation;
        controller.cart.value.notes = textcontoller.text;

        final ServerResponse response = await controller.checkout();

        if (response.success) {
          await avoidCheckoutRaceCondition(response.data["orderId"]);

          controller.clearCart();
          popEverythingAndNavigateTo(
              getRestaurantOrderRoute(response.data["orderId"]));
        } else {
          print(response);
          if (response.errorCode == "serverError") {
            // do something
          } else if (response.errorCode == "inMoreThanThreeOrders") {
            // do something
          } else if (response.errorCode == "restaurantClosed") {
            // do something
          } else {
            // do something
          }
        }

        setState(() {
          _clickedOrderNow = false;
        });
      }
    }
    nbClicks++;
  }

  bool checkRestaurantAvailability({Schedule? schedule}) {
    final String dayNane = DateFormat('EEEE').format(DateTime.now());
    final DateTime _timeNow = DateTime.now();

    if (schedule != null) {
      bool isOpen = false;
      schedule.openHours.forEach((Weekday key, OpenHours value) {
        if (key.toFirebaseFormatString() == dayNane.toLowerCase()) {
          final DateTime dateOfStart = DateTime(
            _timeNow.year,
            _timeNow.month,
            _timeNow.day,
            value.from[0],
            value.from[1],
          );
          final DateTime dateOfClose = DateTime(
            _timeNow.year,
            _timeNow.month,
            _timeNow.day,
            value.to[0],
            value.to[1],
          );
          mezDbgPrint(dateOfStart.toString());
          mezDbgPrint(dateOfClose.toString());
          if (dateOfStart.isBefore(_timeNow) && dateOfClose.isAfter(_timeNow)) {
            mezDbgPrint("Today is $dayNane");
            isOpen = true;
          }
        }
      });
      return isOpen;
    } else {
      return true;
    }
  }
}
