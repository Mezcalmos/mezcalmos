import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/AllServiceListViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/SubServiceController.dart';
import 'package:mezcalmos/CustomerApp/pages/custBusinessView/custBusinessView.dart';
import 'package:mezcalmos/CustomerApp/router/rentalRoutes.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustHomeWrapper'];

class RentalView extends StatefulWidget {
  const RentalView({super.key});

  @override
  State<RentalView> createState() => _RentalViewState();

  static Future<void> navigate() {
    return MezRouter.toPath(RentalRoutes.rentalViewRoute);
  }
}

class _RentalViewState extends State<RentalView> {
  AllServiceListViewController allServiceListViewController =
      Get.find<AllServiceListViewController>();
  SubServiceController rentalController = SubServiceController();

  @override
  Widget build(BuildContext context) {
    TextTheme txt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
        titleWidget: Text(_i18n()[allServiceListViewController
                .currentSelectedService.value.name
                .toLowerCase()]["title"]
            .toString()),
      ),
      body: Column(
        children: [
          MezButton(
            label: "Go to business",
            onClick: () async {
              await CustBusinessView.navigate(
                businessId: 3,
              );
            },
          ),
          // ListView.builder(
          //   itemCount: rentalController
          //       .allRentalValues[
          //           allServiceListViewController.currentSelectedService]!
          //       .length,
          //   itemBuilder: (BuildContext context, int index) {
          //     return MezCard(
          //       onClick: () {
          //         final RentalViewEnum goToView =
          //             rentalController.allRentalValues[
          //                 allServiceListViewController
          //                     .currentSelectedService]![index]["value"];
          //         if (goToView == RentalViewEnum.Homes) {
          //           HomeAssetListsView.navigate(
          //             viewEnum: goToView,
          //           );
          //         } else {
          //           OtherAssetListsView.navigate(
          //             viewEnum: goToView,
          //           );
          //         }
          //       },
          //       content: Row(
          //         crossAxisAlignment: CrossAxisAlignment.end,
          //         children: [
          //           Expanded(
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   _i18n()[allServiceListViewController
          //                           .currentSelectedService.value.name
          //                           .toLowerCase()][
          //                       rentalController.allRentalValues[
          //                               allServiceListViewController
          //                                   .currentSelectedService]![index]
          //                           ["key"]]['title'],
          //                   style: txt.displayMedium,
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.only(bottom: 16.0),
          //                   child: Text(
          //                     _i18n()[allServiceListViewController
          //                             .currentSelectedService.value.name
          //                             .toLowerCase()][
          //                         rentalController.allRentalValues[
          //                                 allServiceListViewController
          //                                     .currentSelectedService]![index]
          //                             ["key"]]['description'],
          //                     style: txt.labelLarge,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           Image.asset(
          //             rentalController.allRentalValues[
          //                     allServiceListViewController
          //                         .currentSelectedService]![index]["icon"]
          //                 .toString(),
          //             height: 110,
          //             width: 110,
          //           ),
          //         ],
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}