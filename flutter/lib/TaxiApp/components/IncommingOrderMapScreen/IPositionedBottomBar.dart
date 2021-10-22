import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncommingPositionedBottomBar extends StatelessWidget with MezDisposable {
  IncomingOrdersController controller = Get.find<IncomingOrdersController>();
  LanguageController lang = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Positioned(
        bottom: GetStorage().read(getxGmapBottomPaddingKey) + 55,
        child: Container(
          height: getSizeRelativeToScreen(30, Get.height, Get.width).h,
          width: (Get.width / 1.05),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color.fromARGB(255, 216, 225, 249),
                    spreadRadius: 0,
                    blurRadius: 7,
                    offset: Offset(0, 7)),
              ]),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Positioned(
                  left: 10,
                  child: SizedBox(
                    // height: getSizeRelativeToScreen(300, sw, sh),
                    // width: double.infinity,
                    child: CircleAvatar(
                      // radius: 30.0,
                      child: ClipOval(
                        clipBehavior: Clip.antiAlias,
                        child: controller.selectedIncommingOrder
                                    ?.customer['image'] ==
                                null
                            ? Image.asset(
                                aDefaultAvatar,
                                width: getSizeRelativeToScreen(
                                    100, context.height, context.width),
                                height: getSizeRelativeToScreen(
                                    100, context.height, context.width),
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                controller.selectedIncommingOrder
                                        ?.customer['image'] +
                                    "?type=large",
                                fit: BoxFit.cover,
                                height: getSizeRelativeToScreen(
                                    100, context.height, context.width),
                                width: getSizeRelativeToScreen(
                                    100, context.height, context.width),
                              ),
                      ),
                      backgroundColor: Colors
                          .grey.shade100, //Color.fromARGB(255, 222, 222, 222),
                      // radius: 1,
                    ),
                  )),
              Positioned(
                left: 60,
                top: getSizeRelativeToScreen(5, Get.height, Get.width),
                child: Text(
                  controller.selectedIncommingOrder?.customer['name'] ??
                      "Customer",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'psb',
                  ),
                ),
              ),
              Positioned(
                left: 60,
                bottom: getSizeRelativeToScreen(5, Get.height, Get.width),
                child: Obx(
                  () => Text(
                    "${controller.selectedIncommingOrder?.distanceToClient.toStringAsFixed(1) ?? '? '} km ${lang.strings['taxi']['incoming']["far"]}",
                    style: TextStyle(
                        fontSize: 14.sp, fontFamily: 'psr', color: Colors.grey),
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  top: 10,
                  right:
                      getSizeRelativeToScreen(150, Get.height, Get.width) / 3.5,
                  child: VerticalDivider(
                    width: 0.5,
                    color: Color.fromARGB(255, 236, 236, 236),
                    thickness: 1,
                  )),
              Positioned(
                  bottom: 10,
                  top: 10,
                  right:
                      getSizeRelativeToScreen(150, Get.height, Get.width) / 1.9,
                  child: VerticalDivider(
                    width: 0.5,
                    color: Color.fromARGB(255, 236, 236, 236),
                    thickness: 1,
                  )),
              Positioned(
                  right:
                      getSizeRelativeToScreen(150, Get.height, Get.width) / 3.2,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 0,
                    runSpacing: 0,
                    direction: Axis.horizontal,
                    children: [
                      Transform.scale(
                          scale: (Get.width <= 310) ? 2 : 1.5,
                          child: Container(
                            height: 10.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(money_asset),
                            )),
                          )),
                      Obx(
                        () => Text(
                          "${controller.selectedIncommingOrder?.estimatedPrice?.toString() ?? '? \$'}",
                          style: TextStyle(
                              fontSize: (Get.width <= 310) ? 10.sp : 16.sp,
                              fontFamily: 'psb',
                              color: Colors.black),
                        ),
                      ),
                    ],
                  )),
              Positioned(
                  bottom: getSizeRelativeToScreen(5.5, Get.height, Get.width),
                  right: 10,
                  child: Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 4,
                    children: [
                      Icon(
                        MezcalmosIcons.route,
                        size: 16,
                      ),
                      Text(
                        "${controller.selectedIncommingOrder?.routeInformation['distance']['text'] ?? '? km'}",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'psr',
                            color: Colors.black),
                      ),
                    ],
                  )),
              Positioned(
                  top: getSizeRelativeToScreen(5.5, Get.height, Get.width),
                  right: 10,
                  child: Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.spaceBetween,
                    spacing: 4,
                    children: [
                      Icon(
                        MezcalmosIcons.stopwatch,
                        size: 16,
                      ),
                      Text(
                        "${getRightTextSize(controller.selectedIncommingOrder?.routeInformation['duration']['text'] ?? '? mins')}",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'psr',
                            color: Colors.black),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}

String? getRightTextSize(String? value) {
  print(value);
  if (value!.length >= 10) {
    var words = value.split(" ");
    if (words.length >= 3) {
      return "${words[0]} ${words[1]}";
    }
  } else
    return value;
}
