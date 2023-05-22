import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsRentalView/controllers/BsRentalViewController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpOfferingPricesList.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpServiceImagesGrid.dart';
import 'package:mezcalmos/BusinessApp/pages/components/BsDeleteOfferButton.dart';
import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezItemAvSwitcher.dart';
import 'package:mezcalmos/Shared/widgets/MezStringDropDown.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['BusinessApp']['pages']['services'];

class BsOpRentalView extends StatefulWidget {
  const BsOpRentalView({Key? key}) : super(key: key);
  static Future<bool?> navigate({
    required int? id,
    required int businessId,
    required RentalCategory1 rentalCategory,
    required int businessDetailsId,
  }) async {
    String route = BusinessOpRoutes.kBsOpRental;
    route = route.replaceFirst(":id", id?.toString() ?? "add");
    await MezRouter.toPath(
      route,
      arguments: {
        "rentalCategory": rentalCategory,
        "businessDetailsId": businessDetailsId,
        "businessId": businessId
      },
    );
    return MezRouter.backResult;
  }

  @override
  _BsOpRentalViewState createState() => _BsOpRentalViewState();
}

class _BsOpRentalViewState extends State<BsOpRentalView>
    with TickerProviderStateMixin {
  BsRentalViewController viewController = BsRentalViewController();
  late RentalCategory1 rentalCategory;
  int? businessId;
  int? businessDetailsId;
  int? rentalId;
  @override
  void initState() {
    _assignValues();
    if (businessDetailsId == null || businessId == null) {
      throw Exception("detailsId is null");
    }
    viewController.init(
        businessId: businessId!,
        category1: rentalCategory,
        rentalId: rentalId,
        thickerProvider: this,
        detailsId: businessDetailsId!);

    int? id = int.tryParse(MezRouter.urlArguments["id"].toString());
    if (id != null) {
      viewController.initEditMode(id: id);
    }

    super.initState();
  }

  void _assignValues() {
    rentalCategory =
        MezRouter.bodyArguments?["rentalCategory"] as RentalCategory1;
    businessDetailsId = int.tryParse(
        MezRouter.bodyArguments?["businessDetailsId"].toString() ?? "");
    businessId =
        int.tryParse(MezRouter.bodyArguments?["businessId"].toString() ?? "");
    rentalId = int.tryParse(MezRouter.urlArguments["id"].toString());
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      bottomNavigationBar: Obx(
        () => MezButton(
          label: _i18n()["save"],
          withGradient: true,
          borderRadius: 0,
          onClick: () async {
            await viewController.save();
          },
        ),
      ),
      body: Obx(
        () => viewController.hasData
            ? Column(
                children: [
                  if (viewController.hasSecondaryLang)
                    PreferredSize(
                        preferredSize: Size.fromHeight(50),
                        child: Material(
                          color: Colors.white,
                          child: TabBar(
                              tabs: [
                                Tab(
                                  text: viewController.languages!.primary
                                      .toLanguageName(),
                                ),
                                Tab(
                                  text: viewController.languages!.secondary!
                                      .toLanguageName(),
                                )
                              ],
                              controller: viewController
                                  .languageTabsController.tabController),
                        )),
                  Expanded(
                    child: TabBarView(
                      controller:
                          viewController.languageTabsController.tabController,
                      children: [
                        Form(
                            key: viewController
                                .languageTabsController.primaryLangFormKey,
                            child: _primaryTab(context)),
                        if (viewController.hasSecondaryLang)
                          Form(
                              key: viewController
                                  .languageTabsController.secondaryLangFormKey,
                              child: _secondaryTab(context)),
                      ],
                    ),
                  ),
                ],
              )
            : Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  AppBar _appbar() {
    return MezcalmosAppBar(AppBarLeftButtonType.Back, onClick: () {
      MezRouter.back(backResult: viewController.shouldRefetch);
    },
        titleWidget: Obx(() => Text(viewController.rental != null
            ? "${viewController.rental!.details.name.getTranslation(userLanguage)}"
            : rentalCategory == RentalCategory1.Surf
                ? _i18n()["vehicleRental"]["surfRentalTitle"]
                : _i18n()["vehicleRental"]["rentalTitle"])));
  }

  Widget _secondaryTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _i18n()["name"],
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          TextFormField(
            controller: viewController.detailsController.scNameController,
            decoration: InputDecoration(
              hintText: _i18n()["nameHint"],
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return _i18n()["nameError"];
              }
              return null;
            },
          ),
          bigSeperator,
          Text(
            _i18n()["description"],
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          TextFormField(
            maxLines: 7,
            minLines: 5,
            controller:
                viewController.detailsController.scDescriptionController,
            decoration: InputDecoration(
              hintText: _i18n()["descriptionHint"],
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return _i18n()["descriptionError"];
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _primaryTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => MezItemAvSwitcher(
              value: viewController.detailsController.isAvailable.value,
              onAvalableTap: () {
                viewController.detailsController.switchAvailable(true);
              },
              onUnavalableTap: () {
                viewController.detailsController.switchAvailable(false);
              },
            ),
          ),
          bigSeperator,
          rentalCategory == RentalCategory1.Vehicle
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _i18n()["vehicleRental"]["vehicleType"],
                      style: context.textTheme.bodyLarge,
                    ),
                    smallSepartor,
                    Obx(
                      () => MezStringDropDown(
                        langPath: _i18n()["vehicleRental"],
                        validator: (String? p0) {
                          if (viewController.rentalCategory2.value == null) {
                            return _i18n()["categoryError"];
                          }
                          return null;
                        },
                        labelText: _i18n()["vehicleRental"]["vehicleTypeHint"],
                        value: viewController.rentalCategory2.value
                            ?.toFirebaseFormatString(),
                        items: RentalCategory2.values
                            .map((RentalCategory2 e) =>
                                e.toFirebaseFormatString())
                            .toList(),
                        onChanged: (String? value) {
                          viewController.rentalCategory2.value =
                              value.toString().toRentalCategory2();
                        },
                      ),
                    ),
                    smallSepartor,
                  ],
                )
              : SizedBox.shrink(),
          Text(
            _i18n()["image"],
            style: context.textTheme.bodyLarge,
          ),
          Text(
            _i18n()["imageInfo"],
          ),
          smallSepartor,
          BsOpServiceImagesGrid(
            detailsController: viewController.detailsController,
          ),
          // bigSeperator,
          Text(
            _i18n()["name"],
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          TextFormField(
            controller: viewController.detailsController.nameController,
            decoration: InputDecoration(
              hintText: _i18n()["nameHint"],
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return _i18n()["nameError"];
              }
              return null;
            },
          ),
          bigSeperator,
          Text(
            _i18n()["description"],
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          TextFormField(
            maxLines: 7,
            minLines: 5,
            controller: viewController.detailsController.descriptionController,
            decoration: InputDecoration(
              hintText: _i18n()["descriptionHint"],
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return _i18n()["descriptionError"];
              }
              return null;
            },
          ),
          bigSeperator,
          BsOpOfferingPricesList(
            availbleUnits: viewController.avalbleUnits,
            onAddPrice: (TimeUnit unit) {
              viewController.detailsController.addPriceTimeUnit(timeUnit: unit);
            },
            onRemovePrice: (TimeUnit unit) {
              viewController.detailsController.removeTimeUnit(unit);
            },
            seletedPrices: viewController.detailsController.priceTimeUnitMap,
          ),
          smallSepartor,

          /// This to show rental details only when rental is Motorcycle
          Obx(
            () => viewController.rentalCategory2.value ==
                        RentalCategory2.Motorcycle &&
                    rentalCategory == RentalCategory1.Vehicle
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      bigSeperator,
                      Text(
                        _i18n()["vehicleRental"]["rentalDetails"],
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      Text(
                        _i18n()["vehicleRental"]["motorcycleType"],
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      smallSepartor,
                      MezStringDropDown(
                        langPath: _i18n()["vehicleRental"],
                        validator: (String? value) {
                          if (viewController.rentalCategory3.value == null) {
                            return _i18n()["categoryError"];
                          }
                          return null;
                        },
                        labelText:
                            "${_i18n()["vehicleRental"]["motorcycleTypeHint"]}",
                        value: viewController.rentalCategory3.value
                            ?.toFirebaseFormatString(),
                        items: RentalCategory3.values
                            .map((RentalCategory3 e) =>
                                e.toFirebaseFormatString())
                            .toList(),
                        onChanged: (String? value) {
                          viewController.rentalCategory3.value =
                              value.toString().toRentalCategory3();
                        },
                      ),
                      smallSepartor,
                    ],
                  )
                : SizedBox.shrink(),
          ),

          /// This to show rental details only when rental is Surf
          rentalCategory == RentalCategory1.Surf
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bigSeperator,
                    Text(
                      _i18n()["vehicleRental"]["rentalDetails"],
                      style: context.textTheme.bodyLarge,
                    ),
                    smallSepartor,
                    Text(
                      _i18n()["vehicleRental"]["length"],
                      style: context.textTheme.bodySmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    smallSepartor,
                    TextFormField(
                      controller: viewController.surfBoardLengthController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: _i18n()["vehicleRental"]["surfLength"],
                        suffixIconConstraints: BoxConstraints(
                          minWidth: 0,
                          minHeight: 0,
                        ).tighten(width: 50),
                        suffixIcon: Text(
                          "${_i18n()["vehicleRental"]["Feet"]}",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "${_i18n()["vehicleRental"]["surfLengthError"]}";
                        }
                        return null;
                      },
                    ),
                    smallSepartor,
                  ],
                )
              : SizedBox.shrink(),
          if (viewController.isEditing)
            BsDeleteOfferButton(
              onDelete: () async {
                await viewController.deleteOffer();
                await MezRouter.back(backResult: true);
              },
            )
        ],
      ),
    );
  }
}
