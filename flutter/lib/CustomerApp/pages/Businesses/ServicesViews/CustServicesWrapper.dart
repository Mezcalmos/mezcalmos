import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustServiceView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustHomeRentalListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustRentalsListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/ServicesViews/CustServicesListView.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/common/hsCommon.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/CustomerApp/components/ServicesCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['ServicesViews']['CustServicesWrapper'];

class CustServicesWrapper extends StatefulWidget {
  const CustServicesWrapper({super.key});
  static Future<void> navigate({required List<ServiceTree> serviceTree}) {
    final String route = CustBusinessRoutes.custServicesWrapperRoute;
    return MezRouter.toPath(route, arguments: {
      "serviceTree": serviceTree,
    });
  }

  @override
  State<CustServicesWrapper> createState() => _CustServicesWrapperState();
}

class _CustServicesWrapperState extends State<CustServicesWrapper> {
  late List<ServiceTree> serviceTree;

  @override
  void initState() {
    super.initState();
    serviceTree = MezRouter.bodyArguments!["serviceTree"] as List<ServiceTree>;
  }

  void navigateToListView(MezService mezService) {
    switch (mezService) {
      case MezService.Cleaning:
        CustServicesListView.navigate(
          serviceCategory: ServiceCategory1.Cleaning,
        );
        break;
      case MezService.MealPlanning:
        CustServicesListView.navigate(
          serviceCategory: ServiceCategory1.MealPlanning,
        );
        break;
      case MezService.PetSitting:
        CustServicesListView.navigate(
          serviceCategory: ServiceCategory1.PetSitting,
        );
        break;
      case MezService.Photography:
        CustServicesListView.navigate(
          serviceCategory: ServiceCategory1.Photography,
        );
        break;
      case MezService.Beauty:
        CustServicesListView.navigate(
          serviceCategory: ServiceCategory1.Beauty,
        );
        break;
      case MezService.Tattoo:
        CustServicesListView.navigate(
          serviceCategory: ServiceCategory1.Tattoo,
        );
        break;
    }
  }

  String getCardImage(MezService mezService) {
    switch (mezService) {
      case MezService.Cleaning:
        return aCleaning;
      case MezService.MealPlanning:
        return aMealPrep;
      case MezService.PetSitting:
        return aPetSitting;
      case MezService.Beauty:
        return aBeauty;
      case MezService.Photography:
        return aPhotography;
      case MezService.Tattoo:
        return aTattoo;
      default:
        return aUncategorized;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        title: _i18n()['services'],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(
            serviceTree.length,
            (int index) => ServicesCard(
              onTap: () {
                navigateToListView(serviceTree[index].name);
              },
              url: getCardImage(serviceTree[index].name),
              title: _i18n()[serviceTree[index].name.toFirebaseFormatString()]
                  ['title'],
              subtitle:
                  _i18n()[serviceTree[index].name.toFirebaseFormatString()]
                      ['description'],
            ),
          ),
        ),
      ),
    );
  }
}
