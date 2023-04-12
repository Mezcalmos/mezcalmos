import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/controller/HomeRentalController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/components/AgencyListTile.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/Homes/AgencyServiceView/AgencyServiceView.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class AgencyListView extends StatefulWidget {
  const AgencyListView({
    super.key,
    required this.homeRentalController,
  });

  final HomeRentalController homeRentalController;

  @override
  State<AgencyListView> createState() => _AgencyListViewState();
}

class _AgencyListViewState extends State<AgencyListView> {
  late HomeRentalController homeRentalController;
  LanguageController languageController = Get.find<LanguageController>();
  @override
  void initState() {
    super.initState();
    homeRentalController = widget.homeRentalController;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: homeRentalController.agencyRentalData.isEmpty
              ? const Center(
                  child: Text("Empty"),
                )
              : ListView.builder(
                  controller: homeRentalController.agencyScrollController,
                  itemCount: homeRentalController.agencyRentalData.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String image =
                        homeRentalController.agencyRentalData[index].image;
                    return AgencyListTile(
                      onClick: () {
                        AgencyServiceView.navigate();
                      },
                      titleText:
                          homeRentalController.agencyRentalData[index].name,
                      rating: homeRentalController
                              .agencyRentalData[index].avgRating ??
                          0.0,
                      reviewCount: homeRentalController
                              .agencyRentalData[index].reviewCount ??
                          0,
                      image: NetworkImage(
                        image == "null" || image.isEmpty
                            ? customImageUrl
                            : image,
                      ),
                      iconsList: homeRentalController
                          .agencyRentalData[index].acceptedPayments,
                    );
                  },
                ),
        ),
      ),
    );
  }
}
