// ignore_for_file: unawaited_futures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsEventView/BsEventView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsHomeRentalView/BsHomeRentalView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsProductView/BsProductView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsRentalView/BsRentalView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsServiceView/BsServiceView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServicesListView/controllers/BsServicesListViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['BusinessApp']['pages']['services'];

class BsOpServicesListView extends StatefulWidget {
  const BsOpServicesListView({Key? key}) : super(key: key);

  @override
  _BsOpServicesListViewState createState() => _BsOpServicesListViewState();
}

class _BsOpServicesListViewState extends State<BsOpServicesListView> {
  BsServicesListViewController viewController = BsServicesListViewController();
  @override
  void initState() {
    viewController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Menu, title: "Services"),
      drawer: MezSideMenu(),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _addServiceButton(context),
            bigSeperator,
            Row(
              children: [
                Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      _i18n()["services"],
                      style: context.textTheme.bodyLarge,
                    )),
                InkWell(
                  onTap: () {},
                  child: Ink(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MezIconButton(
                            iconSize: 18,
                            padding: EdgeInsets.all(3),
                            onTap: null,
                            icon: Icons.low_priority_rounded),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          _i18n()["reorder"],
                          style: context.textTheme.bodyLarge
                              ?.copyWith(color: primaryBlueColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 30,
            ),
            Text(
              _i18n()["homerental"]["title"],
              style: context.textTheme.bodyLarge,
            ),
            smallSepartor,
            Obx(
              () => Column(
                children: List.generate(
                    viewController.homeRentals.length,
                    (int index) => MezCard(
                        onClick: () {
                          BsOpHomeRentalView.navigate(
                              id: viewController.homeRentals[index].details.id
                                  .toInt());
                        },
                        firstAvatarBgImage: NetworkImage(
                          viewController
                                  .homeRentals[index].details.firstImage ??
                              customImageUrl,
                        ),
                        content: Text(
                          viewController.homeRentals[index].details
                                  .name[userLanguage] ??
                              "name error",
                          style: context.textTheme.bodyLarge,
                        ))),
              ),
            ),
            Divider(
              height: 30,
            ),
            Text(
              _i18n()["rental"]["title"],
              style: context.textTheme.bodyLarge,
            ),
            smallSepartor,
            Obx(
              () => Column(
                children: List.generate(
                    viewController.rentals.length,
                    (int index) => MezCard(
                        onClick: () {
                          BsOpRentalView.navigate(
                              id: viewController.rentals[index].details.id
                                  .toInt());
                        },
                        firstAvatarBgImage: NetworkImage(
                          viewController.rentals[index].details.firstImage ??
                              customImageUrl,
                        ),
                        content: Text(
                          viewController
                                  .rentals[index].details.name[userLanguage] ??
                              "name error",
                          style: context.textTheme.bodyLarge,
                        ))),
              ),
            ),
            Divider(
              height: 30,
            ),
            Text(
              _i18n()["event"]["title"],
              style: context.textTheme.bodyLarge,
            ),
            smallSepartor,
            Obx(
              () => Column(
                children: List.generate(
                    viewController.events.length,
                    (int index) => MezCard(
                        onClick: () {
                          BsOpEventView.navigate(
                              id: viewController.events[index].details.id
                                  .toInt());
                        },
                        firstAvatarBgImage: NetworkImage(
                          viewController.events[index].details.firstImage ??
                              customImageUrl,
                        ),
                        content: Text(
                          viewController
                                  .events[index].details.name[userLanguage] ??
                              "name error",
                          style: context.textTheme.bodyLarge,
                        ))),
              ),
            ),
            Divider(
              height: 30,
            ),
            Text(
              _i18n()["service"]["title"],
              style: context.textTheme.bodyLarge,
            ),
            smallSepartor,
            Obx(
              () => Column(
                children: List.generate(
                    viewController.services.length,
                    (int index) => MezCard(
                        onClick: () {
                          BsOpServiceView.navigate(
                              id: viewController.services[index].details.id
                                  .toInt());
                        },
                        firstAvatarBgImage: NetworkImage(
                          viewController.services[index].details.firstImage ??
                              customImageUrl,
                        ),
                        content: Text(
                          viewController
                                  .services[index].details.name[userLanguage] ??
                              "name error",
                          style: context.textTheme.bodyLarge,
                        ))),
              ),
            ),
            Divider(
              height: 30,
            ),
            Text(
              _i18n()["product"]["title"],
              style: context.textTheme.bodyLarge,
            ),
            smallSepartor,
            Obx(
              () => Column(
                children: List.generate(
                    viewController.product.length,
                    (int index) => MezCard(
                        onClick: () {
                          BsOpProductView.navigate(
                              id: viewController.product[index].details.id
                                  .toInt());
                        },
                        firstAvatarBgImage: NetworkImage(
                          viewController.product[index].details.firstImage ??
                              customImageUrl,
                        ),
                        content: Text(
                          viewController
                                  .product[index].details.name[userLanguage] ??
                              "name error",
                          style: context.textTheme.bodyLarge,
                        ))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  MezButton _addServiceButton(BuildContext context) {
    return MezButton(
      label: _i18n()["addService"],
      onClick: () async {
        // ignore: inference_failure_on_function_invocation
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              BusinessServiceType currentSelectedService =
                  BusinessServiceType.Rental;

              void navigateToOfferingView() {
                switch (currentSelectedService) {
                  case BusinessServiceType.Rental:
                    BsOpRentalView.navigate(id: null);
                    return;
                  case BusinessServiceType.HomeRental:
                    BsOpHomeRentalView.navigate(id: null);
                    return;
                  case BusinessServiceType.Event:
                    BsOpEventView.navigate(
                      id: null,
                    );
                    return;
                  case BusinessServiceType.Class:
                    BsOpEventView.navigate(id: null);
                    return;
                  case BusinessServiceType.Service:
                    BsOpServiceView.navigate(id: null);
                    return;
                  case BusinessServiceType.Product:
                    BsOpProductView.navigate(id: null);
                    return;
                }
              }

              return StatefulBuilder(builder: (BuildContext context, setState) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            _i18n()["serviceType"],
                            style: context.textTheme.bodyLarge,
                          ),
                        ),
                        Divider(
                          height: 35,
                        ),
                        ...BusinessServiceType.values.map(
                          (BusinessServiceType value) => Row(
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _i18n()[value.name.toLowerCase()]["title"]
                                          .toString(),
                                      style: context.textTheme.bodyLarge,
                                    ),
                                    Text(
                                      _i18n()[value.name.toLowerCase()]
                                              ["subtitle"]
                                          .toString(),
                                    )
                                  ],
                                ),
                              ),
                              radioCircleButton(
                                onTap: (bool v) {
                                  setState(() {
                                    currentSelectedService = value;
                                  });
                                },
                                value: value == currentSelectedService,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Flexible(
                                child: MezButton(
                              label: "Cancel",
                              backgroundColor: offRedColor,
                              textColor: redAccentColor,
                              onClick: () async {
                                Navigator.pop(context);
                              },
                            )),
                            SizedBox(
                              width: 15,
                            ),
                            Flexible(
                                child: MezButton(
                              label: "Add",
                              onClick: () async {
                                mezDbgPrint(
                                    "added service: $currentSelectedService");
                                Navigator.pop(context);
                                navigateToOfferingView();
                                // bool? hasChanged =
                                //     await BsOpHomeRentalView.navigate(id: null);
                                // if (hasChanged == true) {
                                //   viewController.init();
                                // }
                              },
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
            });
      },
    );
  }
}
