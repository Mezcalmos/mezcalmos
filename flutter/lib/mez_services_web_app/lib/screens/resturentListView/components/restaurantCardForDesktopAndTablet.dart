import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/models/Generic.dart';
import 'package:mez_services_web_app/models/Services/Restaurant.dart';
import 'package:mez_services_web_app/screens/components/ShippingCostComponent.dart';
import 'package:mez_services_web_app/services/widgets/mezCalmosResizer.dart';
import 'package:sizer/sizer.dart';

class RestaurantCardForDesktopAndTablet extends StatefulWidget {
  RestaurantCardForDesktopAndTablet(
      {Key? key,
      required this.restaurant,
      required this.shippingPrice,
      required this.onClick})
      : super(key: key);
  final Restaurant restaurant;
  final num shippingPrice;
  final GestureTapCallback? onClick;

  @override
  State<RestaurantCardForDesktopAndTablet> createState() =>
      _RestaurantCardForDesktopAndTabletState();
}

class _RestaurantCardForDesktopAndTabletState
    extends State<RestaurantCardForDesktopAndTablet> {
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
                offset: Offset(0, 1),
                color: Color.fromRGBO(0, 0, 0, 0.25),
                blurRadius: 4.0,
                spreadRadius: -1),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: Get.width,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      child: Container(
                        width: Get.width,
                        child: Image(
                          image: NetworkImage(
                            '${widget.restaurant.info.image}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      child: Container(
                        color: widget.restaurant.isOpen()
                            ? null
                            : Colors.black.withOpacity(0.5),
                        child: widget.restaurant.isOpen()
                            ? null
                            : Center(
                                child: Text(
                                  "closed",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Column(
              children: [
                //title
                Container(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 0, right: 10, left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${widget.restaurant.info.name}',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                      fontSize: TitleSize(context),
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    )),
                  ),
                ),
                //subtitle
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.restaurant.description != null)
                          Text(
                            widget.restaurant.description![userLanguage]!,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(73, 73, 73, 1),
                            )),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    )),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "\$\$",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(73, 73, 73, 1),
                        )),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.schedule,
                            size: 10,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "52min",
                            style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            )),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.delivery_dining,
                      color: Colors.grey.shade800,
                      size: 15,
                    ),
                    ShippingCostComponent(
                      shippingCost: widget.shippingPrice,
                      alignment: MainAxisAlignment.start,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(children: [
                        Icon(
                          Icons.credit_card,
                          size: 15,
                        ),
                      ]),
                    )
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

double TitleSize(BuildContext context) {
  if (MezCalmosResizer.isDesktop(context)) {
    return 5.sp;
  } else if (MezCalmosResizer.isTablet(context) ||
      MezCalmosResizer.isSmallTablet(context)) {
    return 5.sp;
  } else if (MezCalmosResizer.isMobile(context)) {
    return 7.sp;
  } else if (MezCalmosResizer.isSmallMobile(context)) {
    return 11;
  } else {
    return 0;
  }
}
