import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mez_services_web_app/controllers/LaundryController.dart';
import 'package:mez_services_web_app/helpers/GeneralPurposeHelper.dart';
import 'package:mez_services_web_app/helpers/setUpHelper.dart';
import 'package:mez_services_web_app/models/Services/Laundry.dart';
import 'package:mez_services_web_app/screens/Laundries/laundryListView/components/laundryListViewCardForDesktopComponent.dart';
import 'package:mez_services_web_app/screens/Laundries/laundryListView/components/laundryListViewForDesktop.dart';
import 'package:mez_services_web_app/screens/Laundries/laundryListView/components/laundryListViewForMobile.dart';
import 'package:mez_services_web_app/screens/Restaurants/components/installAppBarComponent.dart';
import 'package:mez_services_web_app/screens/Restaurants/resturentListView/controller/ListRestaurantController.dart';
import 'package:mez_services_web_app/services/values/constants.dart';
import 'package:mez_services_web_app/services/widgets/mezCalmosResizer.dart';

class LaundryListView extends StatefulWidget {
  LaundryListView({Key? key}) : super(key: key);

  @override
  State<LaundryListView> createState() => _LaundryListViewState();
}

class _LaundryListViewState extends State<LaundryListView> {
  Rx<bool> isLoaded = false.obs;
  num? shipingPrice = 0;
  List<Laundry> laundries = [];
  @override
  void initState() {
    ever(isLoaded, (val) {
      if (isLoaded.value) {
        Get.find<LaundryController>().getLaundries().then((values) {
          if (mounted) {
            setState(() {
              laundries = values;
              print("${laundries.length}");
            });
          }
        });
        Get.find<LaundryController>().getShippingPrice().then((value) {
          shipingPrice = value;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<bool>(
            future: setupFirebase(
                launchMode: typeMode.toLaunchMode(),
                func: () {
                  isLoaded.value = true;
                }),
            builder: (context, snapShot) {
              if (snapShot.hasData && snapShot.data == true) {
                return Scaffold(
                  appBar: InstallAppBarComponent(),
                  body: LayoutBuilder(builder: ((context, constraints) {
                    return Scaffold(
                        appBar: AppBar(
                          centerTitle: true,
                          title: Text(
                            "Laundries",
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                              color: Colors.black,
                            )),
                          ),
                        ),
                        body: (laundries.length > 0)
                            ? _buildResponciveWidget(context)
                            : Center(
                                child: CircularProgressIndicator(),
                              ));
                  })),
                );
              } else {
                return Scaffold(
                    body: Center(
                  child: CircularProgressIndicator(),
                ));
              }
            }));
  }

  Widget _buildResponciveWidget(BuildContext context) {
    if (MezCalmosResizer.isMobile(context) ||
        MezCalmosResizer.isSmallMobile(context)) {
      return LaundryListViewForMobile(laundries: laundries);
    } else {
      return LaundryListViewForDesktop(
        laundries: laundries,
        shipingPrice: shipingPrice!,
      );
    }
  }
}