import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/Shared/widgets/OrderTimeBar.dart';

class OrderPositionedFromToTopBar {
  static dynamic i18n() => Get.find<LanguageController>().strings["TaxiApp"]
      ["pages"]["Orders"]["CurrentOrderScreen"]["CPositionedFromToBar"];

  static Widget _getMezCalmosCircleIcon() {
    return Positioned(
      right: 20,
      top: 25,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.passthrough,
        children: [
          VerticalDivider(
            color: Color.fromARGB(255, 236, 236, 236),
            thickness: 1,
          ),
          Container(
            padding: EdgeInsets.all(
                getSizeRelativeToScreen(2.5, Get.height, Get.width)),
            height: getSizeRelativeToScreen(17, Get.height, Get.width),
            width: getSizeRelativeToScreen(17, Get.height, Get.width),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color.fromARGB(255, 216, 225, 249),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: Offset(0, 7)),
              ],
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 97, 127, 255),
                Color.fromARGB(255, 198, 90, 252),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Center(
              child: Image.asset('assets/images/shared/logoWhite.png'),
            ),
          ),
        ],
      ),
    );
  }

  // static Widget _topOrderTimeBar(TaxiOrder order) {
  //   return Positioned(
  //     top: 90, //isSmallDevice(context) ? 90 : 65,
  //     left: 10,
  //     right: 10,
  //     child: OrderTimeTopBar(
  //       barText: DateFormat('EEEE dd / MM / y').format(
  //             order.scheduledTime ?? order.orderTime,
  //           ) +
  //           ' at ' +
  //           DateFormat('hh:mm a').format(
  //             order.scheduledTime?.toLocal() ?? order.orderTime.toLocal(),
  //           ),
  //     ),
  //   );
  // }

  static List<Widget> buildwithWidgets({
    required Widget fromWidget,
    required Widget toWidget,
    required BuildContext context,
  }) {
    return [
      Column(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            width: Get.width / 1.05,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Color.fromARGB(255, 216, 225, 249),
                  spreadRadius: 0,
                  blurRadius: 7,
                  offset: Offset(0, 7),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => Container(
                      width: 50,
                      child: Text(
                        i18n()["from"] + ':',
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  fromWidget
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            width: Get.width / 1.05,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Color.fromARGB(255, 216, 225, 249),
                  spreadRadius: 0,
                  blurRadius: 7,
                  offset: Offset(0, 7),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => Container(
                      width: 50,
                      child: Text(
                        i18n()["to"] + ':',
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  toWidget
                ],
              ),
            ),
          ),
        ],
      ),
    ];
  }

  static List<Widget> build({
    required BuildContext context,
 //   required TaxiOrder order,
  }) {
    return [
      Positioned(
        top: 5,
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              width: Get.width / 1.05,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Color.fromARGB(255, 216, 225, 249),
                    spreadRadius: 0,
                    blurRadius: 7,
                    offset: Offset(0, 7),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => Text(
                        i18n()["from"] + ':',
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    // Expanded(
                    //   child: GestureDetector(
                    //     onTap: () => MezSnackbar(
                    //       i18n()["from"],
                    //       order.from.address,
                    //     ),
                    //     child: Text(
                    //       order.from.address.replaceAll(' ', '\u00a0'),
                    //       textAlign: TextAlign.left,
                    //       style: TextStyle(
                    //         fontSize: 13,
                    //         fontFamily: 'Nunito',
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //       maxLines: 1,
                    //       softWrap: false,
                    //       overflow: TextOverflow.ellipsis,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              width: Get.width / 1.05,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Color.fromARGB(255, 216, 225, 249),
                    spreadRadius: 0,
                    blurRadius: 7,
                    offset: Offset(0, 7),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => Container(
                        // width: 50,
                        child: Text(
                          i18n()["to"] + ':',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    // Expanded(
                    //   child: GestureDetector(
                    //     onTap: () => MezSnackbar(
                    //         i18n()["to"], order.dropOffLocation.address),
                    //     child: Text(
                    //       order.dropOffLocation.address
                    //           .replaceAll(' ', '\u00a0')
                    //           .toUpperCase(),
                    //       textAlign: TextAlign.left,
                    //       textWidthBasis: TextWidthBasis.longestLine,
                    //       style: TextStyle(
                    //         fontSize: 13,
                    //         fontFamily: 'Nunito',
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //       maxLines: 1,
                    //       softWrap: false,
                    //       overflow: TextOverflow.ellipsis,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // _getMezCalmosCircleIcon()
    ];
  }

  // static List<Widget> buildWithOrderTimeBar({
  //   required BuildContext context,
  //   //required TaxiOrder order,
  // }) {
  //   return [...build(context: context, order: order), _topOrderTimeBar(order)];
  // }
}
