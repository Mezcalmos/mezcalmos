import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrderStatus.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpPastOrdersList']["components"]["ROpOrderCard"];

class MinimalOrderCard extends StatefulWidget {
  const MinimalOrderCard({
    Key? key,
    required this.order,
    required this.onTap,
  }) : super(key: key);

  final MinimalOrder order;
  final Function()? onTap;
  @override
  State<MinimalOrderCard> createState() => _MinimalOrderCardState();
}

class _MinimalOrderCardState extends State<MinimalOrderCard> {
  bool showImage = true;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  //  _orderImageComponent(),
                  // const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.order.title.inCaps,
                          style: Get.textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        if (widget.order.toAdress != null)
                          Text(
                            widget.order.toAdress!.inCaps,
                            style: Get.textTheme.bodyMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(widget.order.orderTime.toDayAmPm()),
                      if (widget.order.image != null &&
                          widget.order.image!.isURL &&
                          showImage)
                        CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              CachedNetworkImageProvider(widget.order.image!),
                          onBackgroundImageError: (Object e, StackTrace? stk) {
                            setState(() {
                              showImage = false;
                            });
                          },
                        ),
                    ],
                  )
                  // getOrderWidget()
                ],
              ),
              const Divider(),
              Row(
                //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    aMoney,
                    width: 20,
                    height: 20,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    " \$${widget.order.totalCost}",
                    style: Get.textTheme.bodyLarge,
                  ),
                  Spacer(),
                  getOrderWidget()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getOrderWidget() {
    switch (widget.order.status) {
      case MinimalOrderStatus.Cancelled:
        return Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.3),
              borderRadius: BorderRadius.circular(18)),
          child: Text(
            '${_i18n()["canceled"]}',
            style: Get.textTheme.bodyLarge
                ?.copyWith(color: Colors.red, fontSize: 10.sp),
          ),
        );

      case MinimalOrderStatus.Delivered:
        return Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.3),
              borderRadius: BorderRadius.circular(18)),
          child: Text(
            '${_i18n()["delivered"]}',
            style: Get.textTheme.bodyLarge
                ?.copyWith(color: Colors.green, fontSize: 10.sp),
          ),
        );
      default:
        return Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.3),
              borderRadius: BorderRadius.circular(18)),
          child: Text(
            '${_i18n()["waiting"]}',
            style: Get.textTheme.bodyLarge
                ?.copyWith(color: Colors.amber, fontSize: 10.sp),
          ),
        );
    }
  }
}
