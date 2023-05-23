import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsProductView/controllers/BsProductViewController.dart';
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

class BsOpProductView extends StatefulWidget {
  const BsOpProductView({Key? key}) : super(key: key);
  static Future<bool?> navigate(
      {required int? id,
      required int businessDetailsId,
      required int businessId}) async {
    String route = BusinessOpRoutes.kBsOpProduct;
    route = route.replaceFirst(":id", id?.toString() ?? "add");
    await MezRouter.toPath(route, arguments: {
      "businessDetailsId": businessDetailsId,
      "businessId": businessId,
    });
    return MezRouter.backResult;
  }

  @override
  _BsOpProductViewState createState() => _BsOpProductViewState();
}

class _BsOpProductViewState extends State<BsOpProductView>
    with TickerProviderStateMixin {
  BsProductViewController viewController = BsProductViewController();
  int? businessId;
  int? businessDetailsId;
  int? productId;
  @override
  void initState() {
    businessDetailsId = int.tryParse(
        MezRouter.bodyArguments?["businessDetailsId"].toString() ?? "");
    businessId =
        int.tryParse(MezRouter.bodyArguments?["businessId"].toString() ?? "");
    productId = int.tryParse(MezRouter.urlArguments["id"].toString());
    if (businessDetailsId == null || businessId == null) {
      throw Exception("detailsId is null");
    }
    viewController.init(
        thickerProvider: this,
        productId: productId,
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
        titleWidget: Obx(() => Text(viewController.product != null
            ? "${viewController.product!.details.name.getTranslation(userLanguage)}"
            : _i18n()["artisanalProduct"]["product"])));
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
          Text(
            _i18n()["category"],
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          Obx(() {
            print(
                "productCategory ${viewController.productCategory.value?.toFirebaseFormatString()}");
            final List<ProductCategory1> validCategories = [
              ...ProductCategory1.values
            ];
            validCategories.remove(ProductCategory1.Uncategorized);
            return MezStringDropDown(
              validator: (String? p0) {
                if (viewController.productCategory.value == null) {
                  return _i18n()["categoryError"];
                }
                return null;
              },
              labelText: _i18n()["categoryHint"],
              langPath: _i18n()["artisanalProduct"],
              items: validCategories
                  .map((ProductCategory1 e) => e.toFirebaseFormatString())
                  .toList(),
              value: viewController.productCategory.value
                  ?.toFirebaseFormatString(),
              onChanged: (String? category) {
                viewController.productCategory.value =
                    category.toString().toProductCategory1();
              },
            );
          }),
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
