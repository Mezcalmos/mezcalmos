import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/controllers/restaurantsInfoController.dart';
import 'package:mez_services_web_app/helpers/GeneralPurposeHelper.dart';
import 'package:mez_services_web_app/helpers/setUpHelper.dart';
import 'package:mez_services_web_app/models/Generic.dart';
import 'package:mez_services_web_app/models/Services/Restaurant.dart';
import 'package:mez_services_web_app/screens/components/installAppBarComponent.dart';
import 'package:mez_services_web_app/screens/Restaurants/restaurantItemView/components/restauarntItemViewForDesktop.dart';
import 'package:mez_services_web_app/screens/Restaurants/restaurantItemView/components/restaurantItemViewForMobile.dart';
import 'package:mez_services_web_app/services/values/constants.dart';
import 'package:mez_services_web_app/services/widgets/mezBottomBar.dart';
import 'package:mez_services_web_app/services/widgets/mezCalmosResizer.dart';
import 'package:qlevar_router/qlevar_router.dart';

class RestaurantItemView extends StatefulWidget {
  const RestaurantItemView({Key? key}) : super(key: key);

  @override
  State<RestaurantItemView> createState() => _RestaurantItemViewState();
}

class _RestaurantItemViewState extends State<RestaurantItemView> {
  Item? item;

  @override
  void didChangeDependencies() {
    _getRestaurant();
    super.didChangeDependencies();
  }

  void _getRestaurant() async {
    setupFirebase(launchMode: typeMode.toLaunchMode()).then((value) {
      Get.find<RestaurantsInfoController>()
          .getRestaurant(QR.params['id'].toString())
          .then((value) {
        if (value != null) {
          setState(() {
            item = value.findItemById(QR.params['itemId'].toString());
            if (item != null) {
              print("this is another test ${item?.toJson()}");
            } else {
              QR.to("/404");
            }
          });
        } else {
          QR.to("/404");
        }
      });
      var xLang = QR.params["lang"].toString().contains("es")
          ? LanguageType.ES
          : LanguageType.EN;
      print("xLang is now ${xLang}");
      if (mounted) {
        Future.delayed(Duration(seconds: 1)).then((value) {
          Get.find<LanguageController>().changeLangForWeb(xLang);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("the restaurant id is ${QR.params['itemId'].toString()}");
    return FutureBuilder<bool>(
        future: setupFirebase(launchMode: typeMode.toLaunchMode()),
        builder: (context, snapShot) {
          if (snapShot.hasData && snapShot.data == true) {
            final LanguageController Lcontroller =
                Get.find<LanguageController>();
            return (item != null)
                ? Scaffold(
                    appBar: InstallAppBarComponent(),
                    bottomNavigationBar: MezBottomBar(),
                    body: LayoutBuilder(builder: (context, constraints) {
                      if (MezCalmosResizer.isMobile(context) ||
                          MezCalmosResizer.isSmallMobile(context)) {
                        return RestaurantItemViewForMobile(
                          item: item!,
                        );
                      } else {
                        return RestaurantItemViewForDesktop(
                          item: item!,
                        );
                      }
                    }),
                  )
                : Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
          } else {
            return Scaffold();
          }
        });
  }
}
