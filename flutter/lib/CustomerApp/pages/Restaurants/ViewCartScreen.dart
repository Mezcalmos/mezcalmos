import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/components/ItemComponent.dart';
import 'package:mezcalmos/CustomerApp/components/actionIconsComponents.dart';
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
  RestaurantCartController _restaurantCartController =
      Get.find<RestaurantCartController>();

  TextEditingController textcontoller = new TextEditingController();
  Rxn<Cart> cart = Rxn();
  // this is used for DropDown Value  (basically the key of dropDownItems)
  RxString _dropDownValue = "_pick_".obs;
  // this is the final newly updated user location pick
  Rxn<Location> _pickedLocation = Rxn();

  // DrowpDown Items
  RxList<DropdownMenuItem<String>> _dropDownItemsList =
      <DropdownMenuItem<String>>[].obs;

  void updateDropDown(Location? _newLocation) {
    if (_pickedLocation.value != _newLocation) {
      _dropDownItemsList.removeWhere(
          (element) => element.value == _pickedLocation.value.toString());
      _dropDownItemsList.add(DropdownMenuItem<String>(
          child: Text(_newLocation!.address), value: _newLocation.toString()));
      _pickedLocation.value = _newLocation;
      _dropDownValue.value = _newLocation.toString();
    }
  }

  ViewCartScreen() {
    // by default it contains one .
    _dropDownItemsList.value = <DropdownMenuItem<String>>[
      DropdownMenuItem(
        child: Text("Pick from Map"),
        value: "_pick_",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar("back", () => Get.back(),
          actionIcons: [
            ActionIconsComponents.notificationIcon(),
            ActionIconsComponents.orderIcon()
          ]),
      body: Obx(() => controller.cart.value.items.length > 0
          ? GetBuilder<RestaurantCartController>(
              // specify type as Controller
              init: RestaurantCartController(), // intialize with the Controller
              builder: (_) => SingleChildScrollView(
                    child: Column(
                      children: [
                        (controller.cart.value.quantity() >= 1)
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
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
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  width: Get.width,
                                  height: 0.5,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffececec))),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              border: Border.all(
                                  color: const Color(0xffececec), width: 0.5),
                              color: const Color(0x80ffffff)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _dropDownValue.value,
                              // changed this to show the address much more clearly.
                              isDense: false,
                              isExpanded: true,
                              hint: Text("Select Location",
                                  style: const TextStyle(
                                      color: const Color(0xff000f1c),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "FontAwesome5Pro",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0),
                                  textAlign: TextAlign.left),
                              icon: Icon(Icons.expand_more),
                              items: _dropDownItemsList(),
                              onChanged: (newValue) async {
                                // we will route the user back to the Map
                                if (newValue == "_pick_") {
                                  dynamic _loc =
                                      await Get.toNamed(kPickLocationRoute);
                                  if (_loc != null) {
                                    mezDbgPrint(
                                        "Get.back executed with  res : ${(_loc as Location?)!.toString()}");
                                    updateDropDown(_loc);
                                    controller.refresh();
                                  } else {
                                    mezDbgPrint(
                                        "Pick map view returned Null !!!");
                                  }
                                }
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
                            bgColor: _pickedLocation.value == null
                                ? const Color(0xdddddddd)
                                : const Color(0xffac59fc),
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
                            function: _pickedLocation.value != null
                                ? () async {
                                    if (_pickedLocation.value != null) {
                                      controller.cart.value.notes =
                                          textcontoller.text;
                                      controller.cart.value.toLocation =
                                          _pickedLocation.value;

                                      mezDbgPrint(controller.cart.value
                                          .toFirebaseFormattedJson()
                                          .toString());

                                      var response =
                                          await controller.checkout();
                                      print(response.errorCode.toString());
                                      if (response.success) {
                                        controller.clearCart();
                                        popEverythingAndNavigateTo(
                                            getCurrentRestaurantOrderRoute(
                                                response.data["orderId"]));
                                      } else {
                                        print(response);
                                        if (response.errorCode ==
                                            "serverError") {
                                          // do something
                                        } else if (response.errorCode ==
                                            "inMoreThanThreeOrders") {
                                          // do something
                                        } else if (response.errorCode ==
                                            "restaurantClosed") {
                                          // do something
                                        } else {
                                          // do something
                                        }
                                      }
                                    }
                                  }
                                : () {
                                    // TODO : maybe add a pop up notifying the user that he/she should pick lcoation !
                                  }),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ))
          : Center(
              child: Icon(Icons.no_meals_outlined,
                  color: Colors.black, size: 30))),
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
                onTap: () async {
                  bool yesNoRes = await dailogComponent(
                      "Clear Cart", "Are you sure you want \nto clear cart?",
                      () {
                    Get.back(result: true);
                  }, () {
                    Get.back(result: false);
                  });

                  if (yesNoRes) {
                    controller.clearCart();
                    Get.back();
                  }
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
                            minVal: 0,
                            increment: () {
                              counter.value =
                                  counter.value + element.costPerOne();
                              print("${element.item.id}");
                              controller.cart.value
                                  .incrementItem(element.id!, 1);
                              controller.refresh();
                            },
                            onChangedToZero: (isZero) async {
                              if (isZero) {
                                controller.refresh();
                                bool yesNoResult = await dailogComponent(
                                  "Delete This Item",
                                  "Would you like to delete this item",
                                  () {
                                    Get.back(result: true);
                                  },
                                  () {
                                    Get.back(result: false);
                                  },
                                );
                                mezDbgPrint(
                                    " the returend value from the dailog $yesNoResult");
                                if (yesNoResult == true) {
                                  controller
                                      .deleteItemFromCart("${element.id}");
                                  // controller.refresh();
                                }
                              }
                            },
                            value: element.quantity,
                            decrement: () {
                              if (element.quantity <= 1) {
                              } else {
                                counter.value =
                                    counter.value + element.costPerOne();
                                controller.cart.value
                                    .incrementItem(element.id!, -1);
                                controller.refresh();
                              }
                            }
                            // decrement: () {
                            //   if (counter.value <= 0) {
                            //     mezDbgPrint(
                            //         "this is the value of counter ${counter.value}");
                            //   } else {
                            //     counter.value =
                            //         counter.value - element.costPerOne();
                            //     controller.cart.value
                            //         .incrementItem(element.id!, -1);
                            //   }
                            // },
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
