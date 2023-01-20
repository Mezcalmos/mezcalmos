import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["pages"]["RestaurantOrderView"];
//

class DvCompanyOrderView extends StatefulWidget {
  const DvCompanyOrderView({Key? key}) : super(key: key);

  @override
  _DvCompanyOrderViewState createState() => _DvCompanyOrderViewState();
}

class _DvCompanyOrderViewState extends State<DvCompanyOrderView> {
//  DvCompanyOrderViewcontroller viewController = DvCompanyOrderViewcontroller();

  @override
  void initState() {
    //  final String orderId = Get.parameters['orderId']!;

    ///  controller.clearOrderNotifications(orderId);
    // viewController.init(orderId: int.parse(orderId));

    super.initState();
  }

  @override
  void dispose() {
    mezDbgPrint("Calling view dispose 🥸");

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: Obx(() {
        //   if (viewController.order.value != null) {
        //     return SingleChildScrollView(
        //       child: Column(
        //         children: [
        //           Text(viewController.order.value!.id.toString()),
        //         ],
        //       ),
        //     );
        //   } else {
        //     return Container(
        //       alignment: Alignment.center,
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           CircularProgressIndicator(
        //             color: primaryBlueColor,
        //           ),
        //           SizedBox(
        //             height: 15,
        //           ),
        //           Text(
        //             "Getting you order info...",
        //             style: Get.textTheme.bodyText1
        //                 ?.copyWith(color: primaryBlueColor),
        //           ),
        //         ],
        //       ),
        //     );
        //   }
        // }),
        );
  }
}
