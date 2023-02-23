import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/widgets/ShippingCostComponent.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]["Laundry"]
        ["LaundriesListView"]["components"]["CustomerLaundrySelectCard"];

class CustomerLaundrySelectCard extends StatelessWidget {
  const CustomerLaundrySelectCard({
    Key? key,
    required this.laundry,
    required this.customerLocation,
  }) : super(key: key);
  final Laundry laundry;
  final LocationData customerLocation;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            MezRouter.toNamed(getSingleLaundryRoute(laundry.info.hasuraId));
          },
          child: Container(
            child: _laundryInfoHeader(),
          ),
        ));
  }

  Widget _laundryInfoHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 10, right: 5, left: 10, bottom: 10),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: CachedNetworkImageProvider(laundry.info.image),
          ),
          SizedBox(
            width: 8,
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.loose,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 4,
                ),
                Text(
                  laundry.info.name,
                  style: Get.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      flex: 5,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.delivery_dining,
                            color: Colors.black,
                            size: 24,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Flexible(
                            child: ShippingCostComponent(
                                shippingCost: _getShippingPrice(),
                                alignment: MainAxisAlignment.start,
                                textStyle: Get.textTheme.bodySmall),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 6,
                      fit: FlexFit.tight,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.watch_later,
                            size: 20,
                            color: Colors.black,
                          ),
                          Flexible(
                              child: Text(
                                  ' ${laundry.averageNumberOfDays} ${_i18n()["days"]}${(laundry.averageNumberOfDays > 1) ? "s" : ""}',
                                  style: Get.textTheme.bodySmall)),
                        ],
                      ),
                    ),
                    if (laundry.getCheapestCategory != null)
                      Flexible(
                        flex: 6,
                        fit: FlexFit.tight,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // SizedBox(
                            //   width: 8,
                            // ),
                            Icon(
                              Icons.north_east,
                              size: 20,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Flexible(
                              child: Text(
                                  "${laundry.getCheapestCategory.toPriceString()}/kg",
                                  style: Get.textTheme.bodySmall),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  num _getShippingPrice() {
    final num customerDistance = calculateDistance(
            customerLocation, laundry.info.location.toLocationData()) /
        1000;
    final num deliveryCost =
        ((customerDistance * laundry.deliveryCost.costPerKm) / 5).round() * 5;
    return max(laundry.deliveryCost.minimumCost, (2 * deliveryCost));
  }

  String _getDollarsSign() {
    if (laundry.getAverageCost <= 80) {
      return "\$";
    }
    if (laundry.getAverageCost > 80 && laundry.getAverageCost <= 140) {
      return "\$\$";
    }
    if (laundry.getAverageCost > 140) {
      return "\$\$\$";
    } else {
      return "";
    }
  }
}
