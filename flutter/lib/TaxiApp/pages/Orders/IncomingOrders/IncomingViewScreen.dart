import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezcalmosGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';

class IncommingOrderScreenView extends GetView<IncomingOrdersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar("back", () => Get.back(closeOverlays: true)),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Obx(() => controller.waitingResponse || controller.selectedIncommingOrder?.id == null ? Center(child: CircularProgressIndicator()) : OrderGoogleMap(controller.selectedIncommingOrder!)),
          Positioned(
              bottom: 90,
              child: Container(
                height: getSizeRelativeToScreen(30, Get.height, Get.width),
                width: getSizeRelativeToScreen(180, Get.height, Get.width),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), boxShadow: <BoxShadow>[
                  BoxShadow(color: Color.fromARGB(255, 216, 225, 249), spreadRadius: 0, blurRadius: 7, offset: Offset(0, 7)),
                ]),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      left: 10,
                      child: CircleAvatar(
                        child: ClipOval(
                          child: controller.selectedIncommingOrder?.customer['image'] == null ? Image.asset(aDefaultAvatar) : Image.network(controller.selectedIncommingOrder?.customer['image']),
                        ),
                        backgroundColor: Colors.grey.shade200,
                      ),
                    ),
                    Positioned(
                      left: 60,
                      top: 10,
                      child: Text(
                        controller.selectedIncommingOrder?.customer['name'] ?? "Customer",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 60,
                      bottom: 10,
                      child: Text(
                        "${controller.selectedIncommingOrder?.routeInformation['distance']['text'] ?? '? km'} far",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        top: 10,
                        right: getSizeRelativeToScreen(180, Get.height, Get.width) / 3,
                        child: VerticalDivider(
                          width: 1,
                          color: Colors.grey,
                          thickness: 1,
                        )),
                    Positioned(
                        bottom: 15,
                        right: 70,
                        child: Icon(
                          Icons.alt_route_rounded,
                          size: 16,
                        )),
                    Positioned(
                      bottom: 13,
                      right: 10,
                      child: Text(
                        "${controller.selectedIncommingOrder?.routeInformation['distance']['text'] ?? '? km'}",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    Positioned(
                        top: 15,
                        right: 70,
                        child: Icon(
                          Icons.timer_rounded,
                          size: 16,
                        )),
                    Positioned(
                      top: 13,
                      right: 10,
                      child: Text(
                        "${controller.selectedIncommingOrder?.routeInformation['duration']['text'] ?? '? mins'}",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
              bottom: 35,
              child: TextButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(getSizeRelativeToScreen(180, Get.height, Get.width), getSizeRelativeToScreen(20, Get.height, Get.width))),
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 78, 168, 35)),
                ),
                onPressed: () async => await controller.acceptTaxi(controller.selectedIncommingOrder?.id),
                child: Text(
                  "Accept Order",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )),
          Positioned(
            top: 10,
            child: Container(
              height: getSizeRelativeToScreen(30, Get.height, Get.width),
              width: getSizeRelativeToScreen(180, Get.height, Get.width),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), boxShadow: <BoxShadow>[
                BoxShadow(color: Color.fromARGB(255, 216, 225, 249), spreadRadius: 0, blurRadius: 7, offset: Offset(0, 7)),
              ]),
              child: Stack(
                // direction: Axis.horizontal,
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                alignment: Alignment.center,
                children: [
                  VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Container(
                    padding: EdgeInsets.all(getSizeRelativeToScreen(2.5, Get.height, Get.width)),
                    height: getSizeRelativeToScreen(20, Get.height, Get.width),
                    width: getSizeRelativeToScreen(20, Get.height, Get.width),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(color: Color.fromARGB(255, 216, 225, 249), spreadRadius: 0, blurRadius: 5, offset: Offset(0, 7)),
                      ],
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 97, 127, 255),
                        Color.fromARGB(255, 198, 90, 252),
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    ),
                    child: Center(
                      child: Image.asset('assets/images/logoWhite.png'),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    top: 13,
                    child: Text(
                      "from",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    top: 30,
                    child: GestureDetector(
                      onTap: () => mezcalmosSnackBar("From", controller.selectedIncommingOrder?.from['address']),
                      child: Text(
                        (controller.selectedIncommingOrder?.from['address'].toString().substring(0, 13) ?? "..........") + " ..", //13+..
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: (getSizeRelativeToScreen(180, Get.height, Get.width) / 2) + 40,
                    top: 13,
                    child: Text(
                      "to",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    left: (getSizeRelativeToScreen(180, Get.height, Get.width) / 2) + 40,
                    top: 30,
                    child: GestureDetector(
                      onTap: () => mezcalmosSnackBar("Destination", controller.selectedIncommingOrder?.to['address']),
                      child: Text(
                        (controller.selectedIncommingOrder?.to['address'].toString().substring(0, 13) ?? "..........") + " ..", //13+..
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//
// Order expired
// Customer canceled the order
// Another driver has picked up the order !
//
