import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/models/Generic.dart';
import 'package:mez_services_web_app/models/Services/Restaurant.dart';
import 'package:mez_services_web_app/services/widgets/MezServiceOpenHours.dart';
import 'package:mez_services_web_app/services/widgets/ServiceLocationCard.dart';
import 'package:mez_services_web_app/services/widgets/mezCalmosResizer.dart';

final DateFormat f = new DateFormat('hh:mma');
dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]["Restaurants"]["ViewRestaurantScreen"]["components"]
    ["restaurantInfoTab"];

class RestaurantInfoTabForMobile extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantInfoTabForMobile({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  /// LanguageType
  static final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  @override
  Widget build(BuildContext context) {
    final LanguageType userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MezCalmosResizer.getWepPageHorizontalPadding(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          if (restaurant.description![userLanguage] != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Obx(
                    () => Text(
                      "${_i18n()["description"]} :",
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    "${restaurant.description![userLanguage]}",
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(73, 73, 73, 1))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          if (restaurant.schedule != null)
            MezServiceOpenHours(schedule: restaurant.schedule!),
          SizedBox(
            height: 25,
          ),
          if (restaurant.info.location != null)
            ServiceLocationCard(
              location: restaurant.info.location,
            ),
        ],
      ),
    );
  }
}