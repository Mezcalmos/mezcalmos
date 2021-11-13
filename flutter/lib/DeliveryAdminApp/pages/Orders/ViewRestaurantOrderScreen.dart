import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/actionIconsComponents.dart';
import 'package:mezcalmos/CustomerApp/components/basicCellComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/buildWidgetOnOrderStatus.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/buttonComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/dailogComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp/constants/global.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final currency = new NumberFormat("#,##0.00", "en_US");
LinearGradient? buttonGraientColor;

class ViewRestaurantOrderScreen extends StatefulWidget {
  @override
  _ViewRestaurantOrderScreen createState() => _ViewRestaurantOrderScreen();
}

class _ViewRestaurantOrderScreen extends State<ViewRestaurantOrderScreen> {
  LanguageController lang = Get.find<LanguageController>();

  Rxn<RestaurantOrder> order = Rxn();
  OrderController controller = Get.find<OrderController>();
  late String orderId;
  StreamSubscription? _orderListener;
  @override
  void initState() {
    super.initState();
    mezDbgPrint("ViewOrderScreen");
    orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);

    order.value = controller.getOrder(orderId) as RestaurantOrder;
    if (order.value == null) {
      Get.back();
    } else {
      _orderListener =
          controller.getCurrentOrderStream(orderId).listen((newOrder) {
        order.value = newOrder as RestaurantOrder;
        mezDbgPrint(order.value);
      });
    }
  }

  @override
  void dispose() {
    _orderListener?.cancel();
    _orderListener = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    mezDbgPrint("ViewOrderScreen build");
    return Scaffold(
        appBar: mezcalmosAppBar("back", () => Get.back(), actionIcons: [
          ActionIconsComponents.notificationIcon(),
          ActionIconsComponents.orderIcon(),
        ]),
        backgroundColor: Colors.white,
        body: Obx(() {
          mezDbgPrint(order.value.toString());
          if (order.value == null) {
            // Order Loading ..
            return MezLogoAnimation(
              centered: true,
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  //====================Restaurant Info=======================
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border: Border.all(
                          color: const Color(0xffececec), width: 0.5),
                      color: const Color(0x9affffff),
                    ),
                    child: Column(
                      children: [
                        BasicCellComponent(
                          url: "${order.value!.restaurant.image}",
                          title: "${order.value!.restaurant.name}",
                        ),
                        Container(
                          width: Get.width,
                          height: 1,
                          decoration: BoxDecoration(
                            color: const Color(0xffececec),
                          ),
                        ),
                        Container(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Obx(() => buildWigetOnOrderStatus(
                                order.value!.restaurantOrderStatus,
                                order.value!.orderTime)),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //============================= Customer info====================
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    child: Text("Customer",
                        style: const TextStyle(
                            color: const Color(0xff000f1c),
                            fontWeight: FontWeight.w700,
                            fontFamily: "psb",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        textAlign: TextAlign.left),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border: Border.all(
                          color: const Color(0xffececec), width: 0.5),
                      color: const Color(0x9affffff),
                    ),
                    child: Column(
                      children: [
                        BasicCellComponent(
                          url: (order.value as RestaurantOrder).customer.image,
                          title: (order.value as RestaurantOrder).customer.name,
                          traillingIcon: Container(
                            child: IconButton(
                              icon: Icon(
                                Icons.chat_bubble_outline,
                                color: Color(0xff5c7fff),
                              ),
                              onPressed: () {
                                Get.toNamed(getCustomerMessagesRoute(
                                    order.value!.orderId));
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: Get.width,
                          height: 1,
                          decoration: BoxDecoration(
                            color: const Color(0xffececec),
                          ),
                        ),
                        Container(
                          child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: changeStatusbuttons,
                              )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "${lang.strings["customer"]["restaurant"]["checkout"]["orderItems"]}",
                        style: const TextStyle(
                            color: const Color(0xff000f1c),
                            fontWeight: FontWeight.w700,
                            fontFamily: "psb",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        textAlign: TextAlign.left),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildOrdersItems(order.value!.items),
                  SizedBox(
                    height: 15,
                  ),
                  //==========================>total cost=====================================

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "${lang.strings['customer']['restaurant']['cart']['totalCost']}",
                        style: TextStyle(
                            color: const Color(0xff000f1c),
                            fontFamily: "psb",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        textAlign: TextAlign.left),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
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
                                        fontStyle: FontStyle.normal,
                                        fontSize: 20.0),
                                    textAlign: TextAlign.left),
                                Spacer(),
                                Text(" \$40.00",
                                    style: TextStyle(
                                        color: const Color(0xff000f1c),
                                        fontFamily: "psb",
                                        fontStyle: FontStyle.normal,
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
                                        fontStyle: FontStyle.normal,
                                        fontSize: 20.0),
                                    textAlign: TextAlign.left),
                                Spacer(),
                                Text(
                                    "  \$${currency.format(order.value!.cost)}",
                                    style: TextStyle(
                                        color: const Color(0xff000f1c),
                                        fontFamily: "psb",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 20.0.sp),
                                    textAlign: TextAlign.right)
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
                  //=========== location========================
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border: Border.all(
                          color: const Color(0xffececec), width: 0.5),
                      color: const Color(0x80ffffff),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          MezcalmosIcons.map_marker,
                          size: 16,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: Get.width * 0.70,
                          child: Text(
                            order.value!.to.address,
                            style: const TextStyle(
                                color: const Color(0xff000f1c),
                                fontFamily: "psr",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.copy,
                              size: 16,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //===============================>notes========================>
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: Get.width,
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border: Border.all(
                          color: const Color(0xffececec), width: 0.5),
                      color: const Color(0x80ffffff),
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          order.value!.notes == null
                              ? "Nothing"
                              : "${order.value!.notes} ",
                          style: const TextStyle(
                              color: const Color(0xff000f1c),
                              fontFamily: "psr",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            );
          }
        }));
  }

  List<Widget> get changeStatusbuttons {
    if (order.value?.inProcess() ?? false)
      return [
        Expanded(
          child: changeStatusButton()!,
        ),
        Expanded(
          child: ButtonComponent(
            widget: Text(
                lang.strings["customer"]["restaurant"]["checkout"]["cancel"]
                    .toUpperCase(),
                style: TextStyle(
                    color: const Color(0xffffffff),
                    fontFamily: "psb",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0.sp),
                textAlign: TextAlign.center),
            gradient: const LinearGradient(
                begin: Alignment(-0.10374055057764053, 0),
                end: Alignment(1.1447703838348389, 1.1694844961166382),
                colors: [const Color(0xede21132), const Color(0xdbd11835)]),
            function: () async {
              var res = await dailogComponent(
                  lang.strings["deliveryAdminApp"]["cancelAlert"]["title"],
                  lang.strings["deliveryAdminApp"]["cancelAlert"]["subTitle"],
                  () {
                Get.back(result: true);
              }, () {
                Get.back(result: false);
              },
                  Container(
                      height: 40, width: 40, child: Image.asset(cancelIcon)),
                  LinearGradient(
                      begin: Alignment(-0.10374055057764053, 0),
                      end: Alignment(1.1447703838348389, 1.1694844961166382),
                      colors: [
                        const Color(0xede21132),
                        const Color(0xdbd11835)
                      ]));
              if (res) {
                controller.cancelOrder(orderId);
              }
            },
          ),
        )
      ];
    else
      return [];
  }

  Widget? changeStatusButton() {
    mezDbgPrint(order.value);
    switch (order.value!.restaurantOrderStatus) {
      case RestaurantOrderStatus.OrderReceieved:
        return ButtonComponent(
          widget: Text(
              lang.strings["deliveryAdminApp"]
                  ["ordersButton"]["preparing"],
              style: TextStyle(
                  color: const Color(0xffffffff),
                  fontFamily: "psb",
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0.sp),
              textAlign: TextAlign.center),
          gradient: LinearGradient(
              begin: Alignment(-0.10374055057764053, 0),
              end: Alignment(1.1447703838348389, 1.1694844961166382),
              colors: [const Color(0xffff9300), const Color(0xdbd15f18)]),
          function: () async {
            var res = await dailogComponent(
                lang.strings["deliveryAdminApp"]
                    ["prepareAlert"]["title"],
                lang.strings["deliveryAdminApp"]
                    ["prepareAlert"]["subTitle"], () {
              Get.back(result: true);
            }, () {
              Get.back(result: false);
            },
                Container(height: 40, width: 40, child: Image.asset(stoveIcon)),
                LinearGradient(
                    begin: Alignment(-0.10374055057764053, 0),
                    end: Alignment(1.1447703838348389, 1.1694844961166382),
                    colors: [
                      const Color(0xffff9300),
                      const Color(0xdbd15f18)
                    ]));
            if (res) {
              controller.prepareOrder(orderId);
            }
          },
        );

      case RestaurantOrderStatus.PreparingOrder:
        return ButtonComponent(
          widget: Text(
              lang.strings["deliveryAdminApp"]
                  ["ordersButton"]["readyForPickUp"],
              style: TextStyle(
                  color: const Color(0xffffffff),
                  fontFamily: "psb",
                  fontSize: 16.0.sp),
              textAlign: TextAlign.center),
          gradient: LinearGradient(
              begin: Alignment(-0.10374055057764053, 0),
              end: Alignment(1.1447703838348389, 1.1694844961166382),
              colors: [
                // const Color(0xede29211),
                const Color(0xffd3bc0b),
                const Color(0xdbd17c18)
              ]),
          function: () async {
            var res = await dailogComponent(
                lang.strings["deliveryAdminApp"]
                    ["readyAlert"]["title"],
                lang.strings["deliveryAdminApp"]
                    ["readyAlert"]["subTitle"], () {
              Get.back(result: true);
            }, () {
              Get.back(result: false);
            },
                Container(height: 40, width: 40, child: Image.asset(box)),
                LinearGradient(
                    begin: Alignment(-0.10374055057764053, 0),
                    end: Alignment(1.1447703838348389, 1.1694844961166382),
                    colors: [
                      // const Color(0xede29211),
                      const Color(0xffd3bc0b),
                      const Color(0xdbd17c18)
                    ]));
            if (res) {
              controller.readyForPickupOrder(orderId);
            }
          },
        );

      case RestaurantOrderStatus.ReadyForPickup:
        return ButtonComponent(
          widget: Text(
              lang.strings["deliveryAdminApp"]
                  ["ordersButton"]["deliver"],
              style: TextStyle(
                  color: const Color(0xffffffff),
                  fontFamily: "psb",
                  fontSize: 16.0.sp),
              textAlign: TextAlign.center),
          gradient: LinearGradient(
              begin: Alignment(-0.10374055057764053, 0),
              end: Alignment(1.1447703838348389, 1.1694844961166382),
              colors: [const Color(0xff5572ea), const Color(0xdb1f18d1)]),
          function: () async {
            var res = await dailogComponent(
                lang.strings["deliveryAdminApp"]
                    ["onTheWayAlert"]["title"],
                lang.strings["deliveryAdminApp"]
                    ["onTheWayAlert"]["subTitle"], () {
              Get.back(result: true);
            }, () {
              Get.back(result: false);
            },
                Container(height: 40, width: 40, child: Image.asset(truck)),
                LinearGradient(
                    begin: Alignment(-0.10374055057764053, 0),
                    end: Alignment(1.1447703838348389, 1.1694844961166382),
                    colors: [
                      const Color(0xff5572ea),
                      const Color(0xdb1f18d1)
                    ]));
            if (res) {
              controller.deliverOrder(orderId);
            }
          },
        );
      case RestaurantOrderStatus.OnTheWay:
        return ButtonComponent(
          widget: Text(
              lang.strings["deliveryAdminApp"]
                  ["ordersButton"]["received"],
              style: TextStyle(
                  color: const Color(0xffffffff),
                  fontFamily: "psb",
                  fontSize: 16.0.sp),
              textAlign: TextAlign.center),
          gradient: LinearGradient(
              begin: Alignment(-0.10374055057764053, 0),
              end: Alignment(1.1447703838348389, 1.1694844961166382),
              colors: [const Color(0xff13cb29), const Color(0xdb219125)]),
          function: () async {
            var res = await dailogComponent(
                lang.strings["deliveryAdminApp"]
                    ["deliveredAlert"]["title"],
                lang.strings["deliveryAdminApp"]
                    ["deliveredAlert"]["subTitle"], () {
              Get.back(result: true);
            }, () {
              Get.back(result: false);
            },
                Container(height: 40, width: 40, child: Image.asset(tick)),
                LinearGradient(
                    begin: Alignment(-0.10374055057764053, 0),
                    end: Alignment(1.1447703838348389, 1.1694844961166382),
                    colors: [
                      const Color(0xff13cb29),
                      const Color(0xdb219125)
                    ]));
            if (res) {
              controller.dropOrder(orderId);
            }
          },
        );

      default:
        return null;
    }
  }
}

Widget buildOrdersItems(List<RestaurantOrderItem> items) {
  return Container(
      child: Column(
    children: items.fold<List<Widget>>(<Widget>[], (children, element) {
      children.add(
        Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                border: Border.all(color: const Color(0xffececec), width: 0.5),
                color: const Color(0x9affffff),
              ),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      //height: 43,
                      child: BasicCellComponent(
                        title: "${element.name.inCaps}",
                        url: "${element.image}",
                        traillingIcon: Container(
                          width: 25,
                          height: 25,
                          child: Text("${element.quantity}",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: const Color(0xff5c7fff),
                                fontWeight: FontWeight.w400,
                                fontFamily: "ProductSans",
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0,
                              ),
                              textAlign: TextAlign.center),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(65)),
                              gradient: LinearGradient(
                                  begin: Alignment(0.1689453125, 0),
                                  end: Alignment(1, 1),
                                  colors: [
                                    const Color(0xff5582ff)
                                        .withOpacity(0.05000000074505806),
                                    const Color(0xffc54efc)
                                        .withOpacity(0.05000000074505806)
                                  ])),
                        ),
                      )),
                  Container(
                    width: Get.width,
                    height: 1,
                    decoration: BoxDecoration(
                      color: const Color(0xffececec),
                    ),
                  ),
                  Container(
                    child: Container(
                      padding:
                          const EdgeInsets.only(right: 10, top: 15, bottom: 15),
                      child: Container(
                          alignment: Alignment.centerRight,
                          child: Text("\$${currency.format(element.totalCost)}",
                              style: TextStyle(
                                  color: const Color(0xff000f1c),
                                  fontFamily: "psb",
                                  fontSize: 20.0.sp),
                              textAlign: TextAlign.right)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );
      return children;
    }),
  ));
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}
