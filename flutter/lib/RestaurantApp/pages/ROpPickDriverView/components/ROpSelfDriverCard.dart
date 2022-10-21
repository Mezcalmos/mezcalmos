import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/User.dart';

class ROpSelfDeliveryCard extends StatelessWidget {
  const ROpSelfDeliveryCard({super.key, required this.restaurant});
  final ServiceInfo restaurant;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      onTap: () {
        // TODO call func to set self delivery on order and get back
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                    radius: 23,
                    backgroundImage:
                        CachedNetworkImageProvider(restaurant.image)),
                Positioned(
                  right: -35,
                  child: CircleAvatar(
                    radius: 23,
                    child: Icon(
                      Icons.delivery_dining,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 45,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Text(
                "Self delivery",
                style: Get.textTheme.bodyText1,
              ),
            ),
            Text(
              "Assign",
              style: Get.textTheme.bodyText1?.copyWith(color: primaryBlueColor),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    ));
  }
}
