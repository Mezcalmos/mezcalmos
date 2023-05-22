import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsServiceView/controllers/BsServiceViewController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpOfferingPricesList.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpScheduleSelector.dart';
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

dynamic _i18n() =>
    Get.find<LanguageController>().strings['BusinessApp']['pages']['services'];

class BsOpServiceView extends StatefulWidget {
  const BsOpServiceView({Key? key}) : super(key: key);
  static Future<bool?> navigate(
      {required int? serviceId,
      required int businessDetailsId,
      required int businessId}) async {
    String route = BusinessOpRoutes.kBsOpService;
    route = route.replaceFirst(":id", serviceId?.toString() ?? "add");
    await MezRouter.toPath(route, arguments: {
      "businessDetailsId": businessDetailsId,
      "businessId": businessId,
    });
    return MezRouter.backResult;
  }

  @override
  _BsOpServiceViewState createState() => _BsOpServiceViewState();
}

class _BsOpServiceViewState extends State<BsOpServiceView>
    with TickerProviderStateMixin {
  BsServiceViewController viewController = BsServiceViewController();
  int? businessId;
  int? businessDetailsId;
  int? serviceId;
  @override
  void initState() {
    businessDetailsId = int.tryParse(
        MezRouter.bodyArguments?["businessDetailsId"].toString() ?? "");
    businessId =
        int.tryParse(MezRouter.bodyArguments?["businessId"].toString() ?? "");
    serviceId = int.tryParse(MezRouter.urlArguments["id"].toString());
    if (businessDetailsId == null || businessId == null) {
      throw Exception("detailsId is null");
    }
    viewController.init(
        thickerProvider: this,
        serviceId: serviceId,
        detailsId: businessDetailsId!,
        businessId: businessId!);

    super.initState();
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
          label: '${_i18n()["save"]}',
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
        titleWidget: Obx(() => Text(viewController.service != null
            ? "${viewController.service!.details.name.getTranslation(userLanguage)}"
            : _i18n()["service"])));
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
          Obx(
            () => BsOpScheduleSelector(
              validator: (String? p0) {
                if (viewController.serviceSchedule.value == null) {
                  return _i18n()["scheduleError"];
                }
                return null;
              },
              scheduleType: ScheduleType.OnDemand,
              onScheduleSelected: (Schedule? schedule) {
                viewController.changeSchedule(schedule);
              },
              schedule: viewController.serviceSchedule.value,
            ),
          ),
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
