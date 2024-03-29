import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["TaxiApp"]["pages"]
        ["Orders"]["IncomingOrders"]["IncomingViewScreen"]["components"]
    ["IPositionedFromToBar"];

class IncomingPositionedFromToTopBar extends StatelessWidget {
  final TaxiOrder order;
  const IncomingPositionedFromToTopBar({required this.order});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      child: Container(
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
        child: Flex(
          clipBehavior: Clip.hardEdge,
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              // fit: FlexFit.tight,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, top: 7, bottom: 7, right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Text(
                          _i18n()["from"],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            MezSnackbar(_i18n()["from"], order.from.address),
                        child: Text(
                          order.from.address,
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w400),
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              // fit: FlexFit.tight,
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
            ),
            Expanded(
              flex: 2,
              // fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 0, top: 7, bottom: 7, right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Text(
                        _i18n()["to"],
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => MezSnackbar(
                          _i18n()["to"], order.dropOffLocation.address),
                      child: Text(
                        order.dropOffLocation.address,
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
