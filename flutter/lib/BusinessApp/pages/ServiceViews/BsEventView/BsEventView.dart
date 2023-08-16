import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsEventView/components/BsOpScheduleTypeSelector.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsEventView/controllers/BsEventViewController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpOfferingLocationCard.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpOfferingPricesList.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpServiceImagesGrid.dart';
import 'package:mezcalmos/BusinessApp/pages/components/BsDeleteOfferButton.dart';
import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezItemAvSwitcher.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['BusinessApp']['pages']['services'];

class BsOpEventView extends StatefulWidget {
  const BsOpEventView({Key? key}) : super(key: key);
  static Future<bool?> navigate(
      {required int? id,
      required bool isClass,
      required int businessId,
      required int businessDetailsId,
      required EventCategory1 eventCategory}) async {
    String route = BusinessOpRoutes.kBsOpEvent;
    route = route.replaceFirst(":id", id?.toString() ?? "add");
    await MezRouter.toPath(
      route,
      arguments: {
        "class": isClass,
        "businessDetailsId": businessDetailsId,
        "eventCategory": eventCategory,
        "businessId": businessId,
      },
    );
    return MezRouter.backResult;
  }

  @override
  _BsOpEventViewState createState() => _BsOpEventViewState();
}

class _BsOpEventViewState extends State<BsOpEventView>
    with TickerProviderStateMixin {
  BsEventViewController viewController = BsEventViewController();
  int? detailsId;
  int? businessId;
  EventCategory1? eventCategory;
  bool isClass = false;
  int? eventId;
  @override
  void initState() {
    _assignValues();
    if (detailsId == null || eventCategory == null || businessId == null) {
      throw Exception("detailsId or businessId or profile is null");
    }
    viewController.init(
      thickerProvider: this,
      businessId: businessId!,
      eventCategory: eventCategory!,
      eventId: eventId,
      detailsId: detailsId!,
      isClass: isClass,
    );

    super.initState();
  }

  void _assignValues() {
    detailsId = int.tryParse(
        MezRouter.bodyArguments?["businessDetailsId"].toString() ?? "");
    businessId =
        int.tryParse(MezRouter.bodyArguments?["businessId"].toString() ?? "");
    eventCategory = MezRouter.bodyArguments?["eventCategory"] as EventCategory1?;
    isClass = MezRouter.bodyArguments?["class"] ?? false;
    eventId = int.tryParse(MezRouter.urlArguments["id"].toString());
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
      body: Obx(() {
        if (viewController.hasData) {
          return Column(
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
          );
        } else
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
      }),
    );
  }

  AppBar _appbar() {
    return MezcalmosAppBar(AppBarLeftButtonType.Back, onClick: () {
      MezRouter.back(backResult: viewController.shouldRefetch);
    }, titleWidget: Obx(() => Text(getAppbartitle())));
  }

  String getAppbartitle() {
    return viewController.event != null
        ? "${viewController.event!.details.name.getTranslation(viewController.languages!.primary)}"
        : (viewController.isClass == false)
            ? "${_i18n()["event"]["event"]}"
            : "${_i18n()['class']}";
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
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return _i18n()["nameError"];
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: _i18n()["nameHint"],
            ),
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
            isClass
                ? _i18n()["event"]["classType"]
                : _i18n()["event"]["eventType"],
            style: context.textTheme.bodyLarge,
          ),
          SizedBox(
            height: 5,
          ),
          Obx(
            () => BsOpScheduleTypeSelector(
              items: viewController.getScheduleType(),
              label: isClass
                  ? _i18n()["event"]["classType"]
                  : _i18n()["event"]["eventType"],
              value: viewController.getScheduleType().firstWhereOrNull(
                  (ScheduleTypeInput element) =>
                      element.type ==
                      viewController.scheduleTypeInput.value.type),
              validator: (ScheduleTypeInput? v) {
                if (v == null) {
                  return _i18n()["event"]["scheduleTypeError"];
                }
                return null;
              },
              onChanged: (ScheduleTypeInput? v) {
                if (v != null) {
                  viewController.switchScheduleType(v);
                }
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
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return _i18n()["nameError"];
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: _i18n()["nameHint"],
            ),
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
            availbleUnits: [],
            onAddPrice: (TimeUnit unit) {
              viewController.detailsController.addPriceTimeUnit(timeUnit: unit);
            },
            onRemovePrice: (TimeUnit unit) {
              viewController.detailsController.removeTimeUnit(unit);
            },
            seletedPrices: viewController.detailsController.priceTimeUnitMap,
          ),
          smallSepartor,
          if (viewController.showLocation)
            Obx(
              () => BsOpOfferingLocationCard(
                label: _i18n()["locationLabel"],
                onLocationSelected: (Location v) {
                  viewController.setLocation(v);
                },
                location: viewController.location.value,
                // validator: (Location? loc) {
                //   if (loc == null) {
                //     return _i18n()["locationError"];
                //   }
                //   return null;
                // },
              ),
            ),
          if (viewController.showLocation) bigSeperator,
          Obx(() => viewController.getScheduleWidget()),

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
