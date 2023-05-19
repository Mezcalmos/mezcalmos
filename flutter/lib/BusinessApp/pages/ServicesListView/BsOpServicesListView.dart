// ignore_for_file: unawaited_futures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/Components/BsProductCard.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsEventView/BsEventView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsHomeRentalView/BsHomeRentalView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsProductView/BsProductView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsRentalView/BsRentalView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsServiceView/BsServiceView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServicesListView/controllers/BsServicesListViewController.dart';
import 'package:mezcalmos/BusinessApp/pages/components/BsEventCard.dart';
import 'package:mezcalmos/BusinessApp/pages/components/BsHomeRentalCard.dart';
import 'package:mezcalmos/BusinessApp/pages/components/BsRentalCard.dart';
import 'package:mezcalmos/BusinessApp/pages/components/BsServiceCard.dart';
import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['BusinessApp']['pages']['services'];

class BsOpServicesListView extends StatefulWidget {
  final int? businessId;
  final int? businessDetailsId;
  final BusinessProfile? businessProfile;
  const BsOpServicesListView(
      {Key? key, this.businessId, this.businessProfile, this.businessDetailsId})
      : super(key: key);
  static Future<void> navigate(
      {required int id,
      required BusinessProfile profile,
      required int detailsId}) async {
    String route =
        BusinessOpRoutes.kBusniessOpServiceList.replaceFirst(":id", "$id");
    return MezRouter.toPath(route,
        arguments: {"profile": profile, "detailsId": detailsId});
  }

  @override
  _BsOpServicesListViewState createState() => _BsOpServicesListViewState();
}

class _BsOpServicesListViewState extends State<BsOpServicesListView> {
  BsServicesListViewController viewController = BsServicesListViewController();
  BusinessProfile? _businessProfile;
  int? _id;
  int? _detailsId;
  @override
  void initState() {
    _detailsId = widget.businessDetailsId ??
        MezRouter.bodyArguments?["detailsId"] as int?;

    _businessProfile = widget.businessProfile ??
        MezRouter.bodyArguments?["profile"] as BusinessProfile?;
    _id =
        widget.businessId ?? int.parse(MezRouter.urlArguments["id"].toString());
    if (_businessProfile != null && _id != null && _detailsId != null) {
      viewController.init(
          profile: _businessProfile!, id: _id!, businessDetailsId: _detailsId!);
    } else {
      throw Exception("Missing arguments");
    }
    super.initState();
  }

  bool get asTab => widget.businessDetailsId != null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
          asTab ? AppBarLeftButtonType.Menu : AppBarLeftButtonType.Back,
          onClick: asTab ? null : MezRouter.back,
          title: '${_i18n()["services"]}'),
      drawer: MezSideMenu(),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      body: RefreshIndicator(
        onRefresh: () async {
          await viewController.fetchAllServices();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Obx(
            () => Column(
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
                      onTap: () {
                        /// TODO: Only to view purpose
                        viewController.changeBusiness();
                      },
                      child: Ink(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            MezIconButton(
                                elevation: 0,
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
                  _i18n()["homeRental"]["rentalTitle"],
                  style: context.textTheme.bodyLarge,
                ),
                smallSepartor,
                Obx(
                  () => Column(
                    children: List.generate(
                        viewController.homeRentals.length,
                        (int index) => BsHomeRentalCard(
                              rental: viewController.homeRentals[index],
                              viewController: viewController,
                              onClick: () {
                                BsOpHomeRentalView.navigate(
                                    businessId: viewController.businessId,
                                    businessDetailsId:
                                        viewController.businessDetailsId,
                                    id: viewController.homeRentals[index].id!
                                        .toInt());
                              },
                            )),
                  ),
                ),
                bigSeperator,
                Text(
                  _i18n()["rental"],
                  style: context.textTheme.bodyLarge,
                ),
                smallSepartor,
                Obx(
                  () => Column(
                    children: List.generate(
                        viewController.rentals.length,
                        (int index) => BsRentalCard(
                            viewController: viewController,
                            rental: viewController.rentals[index],
                            onClick: () {
                              BsOpRentalView.navigate(
                                businessId: viewController.businessId,
                                businessDetailsId:
                                    viewController.businessDetailsId,
                                id: viewController.rentals[index].id!.toInt(),
                                rentalCategory:
                                    viewController.rentals[index].category1,
                              );
                            })

                        //  MezCard(
                        //     onClick: () {
                        //       BsOpRentalView.navigate(
                        //         id: viewController.rentals[index].id
                        //            ! .toInt(),
                        //         rentalCategory:
                        //             viewController.rentals[index].category1,
                        //       );
                        //     },
                        //     firstAvatarBgImage: NetworkImage(
                        //       viewController
                        //               .rentals[index].details.firstImage ??
                        //           customImageUrl,
                        //     ),
                        //     content: Text(
                        //       viewController.rentals[index].details.name
                        //           .getTranslation(userLanguage),
                        //       style: context.textTheme.bodyLarge,
                        //     ))
                        ),
                  ),
                ),
                bigSeperator,
                Text(
                  "${_i18n()["event"]["scheduled"]} ${_i18n()["events"]}",
                  style: context.textTheme.bodyLarge,
                ),
                smallSepartor,
                Obx(
                  () => Column(
                    children: List.generate(
                        viewController.events.length,
                        (int index) => viewController
                                    .events[index].scheduleType ==
                                ScheduleType.Scheduled
                            ? BsEventCard(
                                event: viewController.events[index],
                                viewController: viewController,
                                onClick: () {
                                  BsOpEventView.navigate(
                                    businessId: viewController.businessId,
                                    profile: viewController.businessProfile,
                                    businessDetailsId:
                                        viewController.businessDetailsId,
                                    id: viewController.events[index].id!
                                        .toInt(),
                                    isClass:
                                        viewController.events[index].isClass,
                                  );
                                },
                              )
                            : SizedBox.shrink()),
                  ),
                ),
                bigSeperator,
                Text(
                  "${_i18n()["event"]["onDemand"]} ${_i18n()["events"]}",
                  style: context.textTheme.bodyLarge,
                ),
                smallSepartor,
                Obx(
                  () => Column(
                    children: List.generate(
                        viewController.events.length,
                        (int index) => viewController
                                    .events[index].scheduleType ==
                                ScheduleType.OnDemand
                            ? BsEventCard(
                                event: viewController.events[index],
                                viewController: viewController,
                                onClick: () {
                                  BsOpEventView.navigate(
                                    businessId: viewController.businessId,
                                    profile: viewController.businessProfile,
                                    businessDetailsId:
                                        viewController.businessDetailsId,
                                    id: viewController.events[index].id!
                                        .toInt(),
                                    isClass:
                                        viewController.events[index].isClass,
                                  );
                                },
                              )
                            : SizedBox.shrink()),
                  ),
                ),
                bigSeperator,
                Text(
                  "${_i18n()["event"]["oneTime"]} ${_i18n()["events"]}",
                  style: context.textTheme.bodyLarge,
                ),
                smallSepartor,
                Obx(
                  () => Column(
                    children: List.generate(
                        viewController.events.length,
                        (int index) => viewController
                                    .events[index].scheduleType ==
                                ScheduleType.OneTime
                            ? BsEventCard(
                                event: viewController.events[index],
                                viewController: viewController,
                                onClick: () {
                                  BsOpEventView.navigate(
                                    businessId: viewController.businessId,
                                    profile: viewController.businessProfile,
                                    businessDetailsId:
                                        viewController.businessDetailsId,
                                    id: viewController.events[index].id!
                                        .toInt(),
                                    isClass:
                                        viewController.events[index].isClass,
                                  );
                                },
                              )
                            : SizedBox.shrink()),
                  ),
                ),
                bigSeperator,
                Text(
                  _i18n()["classes"],
                  style: context.textTheme.bodyLarge,
                ),
                smallSepartor,
                Obx(
                  () => Column(
                    children: List.generate(
                        viewController.events.length,
                        (int index) => viewController.events[index].isClass
                            ? BsEventCard(
                                viewController: viewController,
                                event: viewController.events[index],
                                onClick: () {
                                  BsOpEventView.navigate(
                                    id: viewController.events[index].id!
                                        .toInt(),
                                    businessId: viewController.businessId,
                                    businessDetailsId:
                                        viewController.businessDetailsId,
                                    profile: viewController.businessProfile,
                                    isClass:
                                        viewController.events[index].isClass,
                                  );
                                })
                            : SizedBox.shrink()),
                  ),
                ),
                bigSeperator,
                Text(
                  _i18n()["services"],
                  style: context.textTheme.bodyLarge,
                ),
                smallSepartor,
                Obx(
                  () => Column(
                    children: List.generate(
                        viewController.services.length,
                        (int index) => BsServiceCard(
                              service: viewController.services[index],
                              viewController: viewController,
                              onClick: () {
                                BsOpServiceView.navigate(
                                    businessId: viewController.businessId,
                                    businessDetailsId:
                                        viewController.businessDetailsId,
                                    serviceId: viewController
                                        .services[index].id!
                                        .toInt());
                              },
                            )),
                  ),
                ),
                bigSeperator,
                Text(
                  _i18n()["product"],
                  style: context.textTheme.bodyLarge,
                ),
                smallSepartor,
                Obx(
                  () => Column(
                    children: List.generate(
                        viewController.product.length,
                        (int index) => BsProductCard(
                              product: viewController.product[index],
                              viewController: viewController,
                              onClick: () {
                                BsOpProductView.navigate(
                                    businessId: viewController.businessId,
                                    businessDetailsId:
                                        viewController.businessDetailsId,
                                    id: viewController.product[index].id!
                                        .toInt());
                              },
                            )),
                  ),
                ),
              ],
            ),
          ),
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
              BusinessProfileItem currentSelectedService =
                  viewController.currentBottomSheetData.first;

              void navigateToOfferingView() {
                currentSelectedService.route();
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
                            "${_i18n()["serviceType"]} ${viewController.businessProfile.name}",
                            style: context.textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Divider(
                          height: 35,
                        ),
                        ...viewController.currentBottomSheetData.map(
                          (BusinessProfileItem item) => Row(
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${_i18n()[viewController.businessProfileFirebaseString][item.title]}",
                                      style: context.textTheme.bodyLarge,
                                    ),
                                    Text(
                                      "${_i18n()[viewController.businessProfileFirebaseString][item.subtitle]}",
                                    )
                                  ],
                                ),
                              ),
                              radioCircleButton(
                                onTap: (bool v) {
                                  setState(() {
                                    currentSelectedService = item;
                                  });
                                },
                                value: item == currentSelectedService,
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
                              label: '${_i18n()["cancel"]}',
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
                              label: '${_i18n()["add"]}',
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
