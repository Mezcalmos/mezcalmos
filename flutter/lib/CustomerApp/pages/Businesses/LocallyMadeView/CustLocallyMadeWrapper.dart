import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/ServicesCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/LocallyMadeView/CustLocallyMadeListView.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/common/hsCommon.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['LocallyMadeView']['CustLocallyMadeWrapper'];

class CustLocallyMadeWrapper extends StatefulWidget {
  const CustLocallyMadeWrapper({super.key});
  static Future<void> navigate({required List<ServiceTree> serviceTree}) {
    final String route = CustBusinessRoutes.custLocallyMadeWrapperRoute;
    return MezRouter.toPath(route, arguments: {
      "serviceTree": serviceTree,
    });
  }

  @override
  State<CustLocallyMadeWrapper> createState() => _CustLocallyMadeWrapperState();
}

class _CustLocallyMadeWrapperState extends State<CustLocallyMadeWrapper> {
  late List<ServiceTree> serviceTree;

  @override
  void initState() {
    super.initState();
    serviceTree = MezRouter.bodyArguments!["serviceTree"] as List<ServiceTree>;
  }

  void navigateToListView(MezService mezService) {
    switch (mezService) {
      case MezService.Consumable:
        CustLocallyMadeListView.navigate(
          productCategories: [ProductCategory1.Consumable],
        );
        break;
      case MezService.PersonalCare:
        CustLocallyMadeListView.navigate(
          productCategories: [ProductCategory1.PersonalCare],
        );
        break;
      case MezService.Art:
        CustLocallyMadeListView.navigate(
          productCategories: [ProductCategory1.Art],
        );
        break;
      default:
        throw Exception("Invalid MezService $mezService");
    }
  }

  String getCardImage(MezService mezService) {
    switch (mezService) {
      case MezService.Consumable:
        return aConsumable;
      case MezService.PersonalCare:
        return aPersonalCare;
      case MezService.Art:
        return aArt;
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
        title: _i18n()['locallyMade'],
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
