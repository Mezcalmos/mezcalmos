import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiAdminApp/components/infoCardComponent.dart';
import 'package:mezcalmos/TaxiAdminApp/components/staticMap.dart';
import 'package:mezcalmos/TaxiAdminApp/controller/OrdersController.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/TaxiAdminApp/components/getFutureData.dart';

class OrderViewPage extends GetView<OrderStatsController> {
  var f = new DateFormat('dd/MM/yyyy').add_jm();

  var ff = new DateFormat().add_jm();

  Widget getOrder(String orderId) {
    return getStreamData(controller.getOrder(orderId),
        (Map<String, dynamic> data) {
      print("${data["orders"][0]}");
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                        child: ClipOval(
                          child: Container(
                            // alignment: Alignment.center,
                            height: Get.width * 0.3,
                            width: Get.width * 0.3,
                            child: Image.network(
                              "${data["orders"][0]["customer"]["photo"]}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        child: Text(
                          "${data["orders"][0]["customer"]["displayName"]}",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                        child: ClipOval(
                          child: Container(
                            height: Get.width * 0.3,
                            width: Get.width * 0.3,
                            child: Image.network(
                              "${data["orders"][0]["driver"]["photo"]}",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        child: Text(
                          "${data["orders"][0]["driver"]["displayName"]}",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            StaticMap(
              LatLng(
                  double.parse(
                      "${data["orders"][0]["pickUpLocation"]["coordinates"][0]}"),
                  double.parse(
                      "${data["orders"][0]["pickUpLocation"]["coordinates"][1]}")),
              LatLng(
                  double.parse(
                      "${data["orders"][0]["dropOffLocation"]["coordinates"][0]}"),
                  double.parse(
                      "${data["orders"][0]["dropOffLocation"]["coordinates"][1]}")),
              "${data["orders"][0]["customer"]["photo"]}",
              "${data["orders"][0]["pickUpLocation"]["crs"]["properties"]["name"]}",
              "${data["orders"][0]["dropOffLocation"]["crs"]["properties"]["name"]}",
            ),
            InfoCardComponent(
              title_0: "Order Id",
              subTitle_0: "${data["orders"][0]["orderId"]}",
              title_0_1: "Order Time",
              subTitle_0_1:
                  "${f.format(DateTime.parse("${data["orders"][0]["orderTime"]}"))}",
              title_1_0: "Status",
              subTitle_1_0:
                  "${data["orders"][0]["finalStatus"].toString().toUpperCase()}",
              title_1_1: "Price",
              subTitle_1_1: "\$${data["orders"][0]["finalPrice"]}",
              title_2_0: "Ride Start Time",
              subTitle_2_0: (data["orders"][0]["rideStartTime"] == null)
                  ? "--:-- "
                  : "${ff.format(DateTime.parse("${data["orders"][0]["rideStartTime"]}"))}",
              title_2_1: "Ride End Time",
              subTitle_2_1:
                  "${ff.format(DateTime.parse("${data["orders"][0]["rideFinishTime"]}"))}",
              title_3_0: "Notifications",
              subTitle_3_0: "Sent:${data["orders"][0]["notifications_sent"]}",
              subTitle_3_1:
                  "Received:${data["orders"][0]["notifications_received"]}",
              subTitle_3_2: "Read:${data["orders"][0]["notifications_read"]}",
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put<OrderStatsController>(OrderStatsController());
    return Scaffold(
      appBar: MezcalmosSharedWidgets.mezCalmosAdminAppBar(context),
      body: Container(child: getOrder("-MYztek7UKwGt9uc9abF")),
    );
  }
}
