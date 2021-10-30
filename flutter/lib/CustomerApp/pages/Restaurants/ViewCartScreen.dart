import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/components/ItemComponent.dart';
import 'package:mezcalmos/CustomerApp/components/actionIconsComponents.dart';
import 'package:mezcalmos/CustomerApp/components/appbarComponent.dart';
import 'package:mezcalmos/CustomerApp/components/buttonComponent.dart';
import 'package:mezcalmos/CustomerApp/components/dailogComponent.dart';
import 'package:mezcalmos/CustomerApp/components/incrementalComponent.dart';
import 'package:mezcalmos/CustomerApp/components/myExpensionPanelComponent.dart';
import 'package:mezcalmos/CustomerApp/components/textFieldComponent.dart';
import 'package:mezcalmos/CustomerApp/components/titlesComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantCartController.dart';
import 'package:mezcalmos/CustomerApp/models/cart.dart';
import 'package:intl/intl.dart';

import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final currency = new NumberFormat("#,##0.00", "en_US");

class ViewCartScreen extends GetView<RestaurantCartController> {
  LanguageController lang = Get.find<LanguageController>();

  TextEditingController textcontoller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Scaffold(
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar("back", () => Get.back(),
          actionIcons: [
            ActionIconsComponents.notificationIcon(),
            ActionIconsComponents.orderIcon()
          ]),
      body: GetBuilder<RestaurantCartController>(
        // specify type as Controller
        init: RestaurantCartController(), // intialize with the Controller
        builder: (restaurant) => Obx(
          () {
            mezDbgPrint(
                controller.cart.value.toFirebaseFormattedJson().toString() +
                    "hhhhhhhhhhhhhh");
            return SingleChildScrollView(
              child: Column(
                children: [
                  (controller.cart.value != null)
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            buildCart(controller.cart.value),
                            SizedBox(
                              height: 15,
                            ),
                            buildItems(controller.cart.value.items),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        )
                      : Container(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "${lang.strings['customer']['restaurant']['cart']['totalCost']}",
                        style: const TextStyle(
                            color: const Color(0xff000f1c),
                            fontFamily: "psb",
                            fontSize: 14.0),
                        textAlign: TextAlign.left),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    width: Get.width,
                    height: 113,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border: Border.all(
                          color: const Color(0xffececec), width: 0.5),
                      color: const Color(0x80ffffff),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Text(
                                    "${lang.strings['customer']['restaurant']['cart']['deliveryCost']}",
                                    style: const TextStyle(
                                        color: const Color(0xff000f1c),
                                        fontFamily: "psr",
                                        fontSize: 20.0),
                                    textAlign: TextAlign.left),
                                Spacer(),
                                Text(" \$${currency.format(40.00)}",
                                    style: TextStyle(
                                        color: const Color(0xff000f1c),
                                        fontFamily: "psb",
                                        fontSize: 20.0.sp),
                                    textAlign: TextAlign.right)
                              ],
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            width: Get.width,
                            height: 0.5,
                            decoration:
                                BoxDecoration(color: const Color(0xffececec))),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                // Total
                                Text(
                                    "${lang.strings['customer']['restaurant']['cart']['total']}",
                                    style: const TextStyle(
                                        color: const Color(0xff000f1c),
                                        fontFamily: "psr",
                                        fontSize: 20.0),
                                    textAlign: TextAlign.left),
                                Spacer(),
                                Obx(
                                  () => Text(
                                      (controller.cart.value
                                                      .toFirebaseFormattedJson()[
                                                  "cost"] !=
                                              null)
                                          ? "  \$ ${currency.format(controller.cart.value.toFirebaseFormattedJson()["cost"] as dynamic)}"
                                          : "0",
                                      style: TextStyle(
                                          color: const Color(0xff000f1c),
                                          fontFamily: "psb",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 20.0.sp),
                                      textAlign: TextAlign.right),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "${lang.strings['customer']['restaurant']['cart']['deliveryLocation']}",
                        style: const TextStyle(
                            color: const Color(0xff000f1c),
                            fontFamily: "psb",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        textAlign: TextAlign.left),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        border: Border.all(
                            color: const Color(0xffececec), width: 0.5),
                        color: const Color(0x80ffffff)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: null,
                        isDense: true,
                        isExpanded: true,
                        hint: Text(
                            "${lang.strings['customer']['restaurant']['cart']['pickLocation']}",
                            style: const TextStyle(
                                color: const Color(0xff000f1c),
                                fontFamily: "psr",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0),
                            textAlign: TextAlign.left),
                        icon: Icon(Icons.expand_more),
                        items: [
                          DropdownMenuItem(child: Text("home"), value: "home"),
                          DropdownMenuItem(
                              child: Text("office"), value: "office"),
                          DropdownMenuItem(
                              child: Text("Pick New Location"),
                              value: "pickNewLocation"),
                        ],
                        onChanged: (newValue) async {
                          if (newValue == "pickNewLocation") {
                            controller.cart.value.toLocation =
                                await Get.toNamed<Location?>(kPickToLocation);
                          }
                          // } else {
                          // assing to already saved location
                          // }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "${lang.strings['customer']['restaurant']['menu']['notes']}",
                        style: const TextStyle(
                            color: const Color(0xff000f1c),
                            fontFamily: "psb",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        textAlign: TextAlign.left),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFieldComponent(
                    textController: textcontoller,
                    hint: "Write Notes",
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ButtonComponent(
                      widget: Center(
                        child: Text(
                            "${lang.strings['customer']['restaurant']['cart']['orderNow']}",
                            style: TextStyle(
                                color: const Color(0xffffffff),
                                fontFamily: "psb",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.center),
                      ),
                      function: () async {
                        controller.cart.value.notes = textcontoller.text;
                        mezDbgPrint(controller.cart.value
                            .toFirebaseFormattedJson()
                            .toString());

                        dynamic response = await controller.checkout();
                        print(response["errorCode"].toString());
                        if (response["status"] == "Success") {
                          controller.clearCart();
                          popEverythingAndNavigateTo(
                              getCurrentRestaurantOrderRoute(
                                  response["orderId"]));
                        } else {
                          print(response);
                          if (response["errorCode"] == "serverError") {
                            // do something
                          } else if (response["errorCode"] ==
                              "inMoreThanThreeOrders") {
                            // do something
                          } else if (response["errorCode"] ==
                              "restaurantClosed") {
                            // do something
                          } else {
                            // do something
                          }
                        }
                      }),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildCart(Cart cart) {
    return Column(
      children: [
        SizedBox(
          height: 15.sp,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Text("${lang.strings['customer']['restaurant']['cart']['cart']}",
                  style: TextStyle(
                      color: const Color(0xff1d1d1d),
                      fontFamily: "psr",
                      fontSize: 45.0.sp),
                  textAlign: TextAlign.left),
              Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  gradient: LinearGradient(
                    begin: Alignment(0.1689453125, 0),
                    end: Alignment(1, 1),
                    colors: [
                      const Color(0xff5582ff).withOpacity(0.05000000074505806),
                      const Color(0xffc54efc).withOpacity(0.05000000074505806)
                    ],
                  ),
                ),
                child:
                    Text((cart.quantity() != null) ? "${cart.quantity()}" : "0",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: const Color(0xff5c7fff),
                          fontFamily: "psr",
                          fontSize: 30.0.sp,
                        ),
                        textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Container(
                child: Text(
                    "${lang.strings['customer']['restaurant']['cart']['inCart']}",
                    style: TextStyle(
                        color: const Color(0xff000f1c),
                        // fontWeight: FontWeight.w700,
                        fontFamily: "psb",
                        fontSize: 14.0),
                    textAlign: TextAlign.left),
              ),
              Spacer(),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0x33c5c5c5),
                          offset: Offset(0, 10),
                          blurRadius: 10,
                          spreadRadius: 0)
                    ],
                    color: const Color(
                      0xffffffff,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete_outline,
                        size: 20.sp,
                        color: Color(0xffdb2846),
                      ),
                      Text(
                        "${lang.strings['customer']['restaurant']['cart']['clear']}",
                        style: TextStyle(
                            color: const Color(0xffdb2846),
                            fontWeight: FontWeight.w500,
                            fontFamily: "psr",
                            fontSize: 12.0.sp),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  dailogComponent(
                      "Clear Cart", "Are you sure you want \nto clear cart?",
                      () {
                    controller.clearCart();
                    Get.back();
                  }, () {
                    Get.back();
                  });
                },
              )
            ],
          ),
        ),
        // SizedBox(
        //   height: 15,
        // ),
      ],
    );
  }

  List<Widget> choosenOneOption(Map<dynamic, dynamic> data) {
    List<Widget> myWidgets = [
      SizedBox(
        height: 15,
      )
    ];

    data.forEach((key, value) {
      myWidgets.add(MenuTitles(
        title: "${key}".toUpperCase(),
      ));

      myWidgets.addAll([
        Container(
          width: Get.width,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 25, top: 5),
          child: Text("${data["${key}"].toString().inCaps}",
              style: TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  fontFamily: "psr",
                  fontStyle: FontStyle.normal,
                  fontSize: 17.0.sp),
              textAlign: TextAlign.left),
        ),
        SizedBox(
          height: 10,
        )
      ]);
    });
    return myWidgets;
  }

  List<Widget> choosenMannyOption(Map<dynamic, dynamic> data) {
    List<Widget> myWidgets = [
      SizedBox(
        height: 5,
      ),
      MenuTitles(title: "OPTIONS"),
    ];

    data.forEach((key, value) {
      if (value == true) {
        myWidgets.add(
          Container(
            width: Get.width,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 25, top: 5),
            child: Text("${key}".inCaps,
                style: const TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "ProductSans",
                    fontStyle: FontStyle.normal,
                    fontSize: 17.0),
                textAlign: TextAlign.left),
          ),
        );
      }
    });
    return myWidgets;
  }

  Widget buildItems(List<CartItem> cartItems) {
    print(cartItems.toString());
    return Column(
      children: cartItems.fold<List<Widget>>(<Widget>[], (children, element) {
        var counter = element.totalCost().obs;
        print("${element.toFirebaseFunctionFormattedJson()}");
        mezDbgPrint("${element.id}");
        children.add(
          Container(
            padding: const EdgeInsets.only(bottom: 15),
            margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: const Color(0xffececec), width: 0.5),
              color: const Color(0x80ffffff),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyExpensionPanelComponent(
                    child: Container(
                      // width: 200,

                      child: ItemComponent(
                        imgUrl: "${element.item.image}",
                        title: "${element.item.name?.inCaps}",
                      ),
                    ),
                    children: choosenOneOption(element.chosenOneOptions) +
                        choosenMannyOption(element.chosenManyOptions),
                    onEdit: () {
                      print(
                          " the data inside the expansion ${element.toFirebaseFunctionFormattedJson()}");
                      Get.toNamed(editCartItemRoute("${element.id}"));
                    }),
                SizedBox(
                  height: 15,
                ),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        IncrementalComponent(
                          minVal: 1,
                          increment: () {
                            counter.value =
                                counter.value + element.costPerOne();
                            print("${element.item.id}");
                            controller.cart.value.incrementItem(element.id!, 1);
                            controller.refresh();
                          },
                          onChangedToZero: (val) {
                            if (val) {
                              dailogComponent(
                                "Delete This Item",
                                "Would you like to delete this item",
                                () {
                                  controller
                                      .deleteItemFromCart("${element.id}");
                                  controller.refresh();
                                  Get.back();
                                },
                                () => Get.back(),
                              );
                            }
                          },
                          value: element.quantity,
                          decrement: () {
                            if (counter.value >= 0) {
                              counter.value =
                                  counter.value - element.costPerOne();
                              controller.cart.value
                                  .incrementItem(element.id!, -1);
                            } else {}
                          },
                        ),
                        Spacer(),
                        Obx(
                          () => Text("\$${currency.format(counter.value)}",
                              style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                    color: const Color(0xff000f1c),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "ProductSans",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20.0),
                              ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        );
        return children;
      }),
    );
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}
