import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/ShippingCostComponent.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart'
    as MapHelper;

import '../../../../../../Shared/cloudFunctions/model.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]["Restaurants"]["ListRestaurantsScreen"]["components"]
    ["RestaurandCard"];

class RestaurantCard extends StatefulWidget {
  final Restaurant restaurant;
  final GestureTapCallback? onClick;
  final LocationData? customerLocation;
  const RestaurantCard(
      {Key? key,
      @required this.onClick,
      required this.restaurant,
      required this.customerLocation})
      : super(key: key);

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    final Language userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    final TextTheme txt = Theme.of(context).textTheme;
    return Card(
        margin: EdgeInsets.only(bottom: 2.h),
        child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: widget.onClick,
            child: Container(
                width: double.infinity,
                height: 16.h,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      mezRestuarntCardImage(),
                      Flexible(
                          child: Padding(
                              padding: EdgeInsets.all(1.h),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(widget.restaurant.info.name,
                                        style: txt.bodyLarge),
                                    //  SizedBox(height: 5),
                                    if (widget.restaurant.info.description
                                            ?.getTranslation(userLanguage) !=
                                        null)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 2.0),
                                        child: Text(
                                          widget.restaurant.info.description!
                                              .getTranslation(userLanguage)!,
                                          style: txt.bodyMedium,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    if (widget.restaurant.info.description !=
                                            null &&
                                        widget.restaurant.info.description!
                                                .length >
                                            1)
                                      const Spacer(),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              children: [
                                                WidgetSpan(
                                                  alignment:
                                                      PlaceholderAlignment
                                                          .middle,
                                                  child: Icon(
                                                      Icons.delivery_dining),
                                                ),
                                                WidgetSpan(
                                                    alignment:
                                                        PlaceholderAlignment
                                                            .middle,
                                                    child: SizedBox(
                                                      width: 4,
                                                    )),
                                                WidgetSpan(
                                                    alignment:
                                                        PlaceholderAlignment
                                                            .middle,
                                                    child:
                                                        ShippingCostComponent(
                                                      shippingCost:
                                                          _getShippingPrice(),
                                                      alignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      textStyle: txt.bodySmall,
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              SizedBox(width: 8),
                                              Icon(
                                                Icons.payments_outlined,
                                                color: Colors.black,
                                                //  size: 18,
                                              ),
                                              SizedBox(
                                                width: 1,
                                              ),
                                              if (widget.restaurant.paymentInfo
                                                      ?.acceptCard ==
                                                  true)
                                                Icon(
                                                  Icons.credit_card,
                                                  color: Colors.black,
                                                  // size: 18,
                                                ),
                                            ],
                                          ),
                                          if (widget.restaurant.rate != null &&
                                              widget.restaurant.rate != 0)
                                            RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                children: [
                                                  WidgetSpan(
                                                    alignment:
                                                        PlaceholderAlignment
                                                            .middle,
                                                    child: Icon(
                                                      Icons.star,
                                                      color: primaryBlueColor,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                      text:
                                                          '${widget.restaurant.rate?.toStringAsFixed(1)}',
                                                      style: txt.bodySmall),
                                                  WidgetSpan(
                                                      alignment:
                                                          PlaceholderAlignment
                                                              .middle,
                                                      child: SizedBox(
                                                        width: 4,
                                                      )),
                                                  TextSpan(
                                                    text:
                                                        '(${widget.restaurant.reviewCount})',
                                                    style: txt.bodySmall,
                                                  )
                                                ],
                                              ),
                                            ),
                                        ])
                                  ])))
                    ]))));
  }

  num? _getShippingPrice() {
    double result = 0;
    if (widget.restaurant.deliveryCost?.costPerKmFromBase != null) {
      final double dist = MapHelper.calculateDistance(
          MapHelper.alitasLoc.toLocationData(),
          widget.restaurant.info.location.toLocationData());
      mezDbgPrint("distance from base ========>$dist");
      final double cost =
          dist * widget.restaurant.deliveryCost!.costPerKmFromBase!;
      result = cost;
    }
    mezDbgPrint("shipping cost from base ==========>$result");
    return result;
  }

  Container mezRestuarntCardImage() {
    ///responsible for the image of restaurant
    return Container(
      height: double.infinity,
      width: 130,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: 150,
              child: CachedNetworkImage(
                imageUrl: widget.restaurant.info.image,
                fit: BoxFit.cover,
                placeholder: (_, __) {
                  return Shimmer.fromColors(
                    child: Container(
                      color: Colors.grey,
                    ),
                    highlightColor: Colors.grey[400]!,
                    baseColor: Colors.grey[300]!,
                    direction: ShimmerDirection.ltr,
                  );
                },
              ),
            ),
            Container(
              color: widget.restaurant.isOpen
                  ? null
                  : Colors.black.withOpacity(0.5),
              child: widget.restaurant.isOpen
                  ? null
                  : Center(
                      child: Text(
                        "${_i18n()["closed"]}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }

  String _getDollarsSign() {
    if (widget.restaurant.getAverageCost() <= 80) {
      return "\$";
    }
    if (widget.restaurant.getAverageCost() > 80 &&
        widget.restaurant.getAverageCost() <= 140) {
      return "\$\$";
    }
    if (widget.restaurant.getAverageCost() > 140) {
      return "\$\$\$";
    } else {
      return "";
    }
  }
}
