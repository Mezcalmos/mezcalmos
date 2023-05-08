import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsHomeRentalView/controllers/BsHomeRentalViewController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpDropDown.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpOfferingLocationCard.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpOfferingPricesList.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpServiceImagesGrid.dart';
import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezItemAvSwitcher.dart';

class BsOpHomeRentalView extends StatefulWidget {
  const BsOpHomeRentalView({Key? key}) : super(key: key);
  static Future<bool?> navigate({required int? id}) async {
    String route = BusinessOpRoutes.kBsOpHomeRental;
    route = route.replaceFirst(":id", id?.toString() ?? "add");
    await MezRouter.toPath(route);
    return MezRouter.backResult;
  }

  @override
  _BsOpHomeRentalViewState createState() => _BsOpHomeRentalViewState();
}

class _BsOpHomeRentalViewState extends State<BsOpHomeRentalView>
    with TickerProviderStateMixin {
  BsHomeRentalViewController viewController = BsHomeRentalViewController();
  @override
  void initState() {
    viewController.init(thickerProvider: this);
    int? id = int.tryParse(MezRouter.urlArguments["id"].toString());
    if (id != null) {
      viewController.initEditMode(id: id);
    }

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
      bottomNavigationBar: MezButton(
        label: "Save",
        borderRadius: 0,
        onClick: () async {
          await viewController.save();
        },
      ),
      body: TabBarView(
        controller: viewController.tabController,
        children: [
          Form(key: viewController.formKey, child: _primaryTab(context)),
          Form(key: viewController.scFormKey, child: _secondaryTab(context)),
        ],
      ),
    );
  }

  AppBar _appbar() {
    return MezcalmosAppBar(AppBarLeftButtonType.Back, onClick: () {
      MezRouter.back(backResult: viewController.shouldRefetch);
    },
        tabBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: TabBar(tabs: [
              Tab(
                text: "English",
              ),
              Tab(
                text: "Spanish",
              )
            ], controller: viewController.tabController)),
        titleWidget: Obx(() => Text(viewController.rental != null
            ? "${viewController.rental!.details.name.getTranslation(userLanguage)}"
            : "Home rental")));
  }

  Widget _secondaryTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name",
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          TextFormField(
            controller: viewController.detailsController.scNameController,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Please enter a name";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Add name",
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Please name";
              }
              return null;
            },
          ),
          bigSeperator,
          Text(
            "Description",
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          TextFormField(
            maxLines: 7,
            minLines: 5,
            controller:
                viewController.detailsController.scDescriptionController,
            decoration: InputDecoration(
              hintText: "Enter a description for your item",
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Please enter description";
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
      child: Form(
        key: viewController.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => MezItemAvSwitcher(
                value: viewController.detailsController.isAvailable.value,
                onAvalableTap: () {
                  viewController.detailsController.isAvailable.value = true;
                },
                onUnavalableTap: () {
                  viewController.detailsController.isAvailable.value = false;
                },
              ),
            ),
            bigSeperator,
            Text(
              "Images",
              style: context.textTheme.bodyLarge,
            ),
            Text(
              "You can only upload up to five images.",
            ),
            smallSepartor,
            BsOpServiceImagesGrid(
              detailsController: viewController.detailsController,
            ),
            bigSeperator,
            Text(
              "Name",
              style: context.textTheme.bodyLarge,
            ),
            smallSepartor,
            TextFormField(
              controller: viewController.detailsController.nameController,
              decoration: InputDecoration(
                hintText: "Add item name",
              ),
            ),
            bigSeperator,
            Text(
              "Description",
              style: context.textTheme.bodyLarge,
            ),
            smallSepartor,
            TextFormField(
              maxLines: 7,
              minLines: 5,
              controller:
                  viewController.detailsController.descriptionController,
              decoration: InputDecoration(
                hintText: "Enter a description for your item",
              ),
            ),
            bigSeperator,
            Obx(
              () => BsOpOfferingPricesList(
                availbleUnits: viewController.avalbleUnits,
                onAddPrice: (TimeUnit unit) {
                  viewController.detailsController
                      .addPriceTimeUnit(timeUnit: unit);
                },
                onRemovePrice: (TimeUnit unit) {
                  viewController.detailsController.removeTimeUnit(unit);
                },
                seletedPrices:
                    viewController.detailsController.priceTimeUnitMap,
              ),
            ),
          ),
          bigSeperator,
          Text(
            "Rental details",
            style: context.textTheme.bodyLarge,
          ),
          meduimSeperator,
          Text(
            "Home type",
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          Obx(
            () => BsOpDropdown(
              validator: (value) {
                if (viewController.homeType.value == null) {
                  return "Please select home type";
                }
                return null;
              },
              items: HomeType.values
                  .map((HomeType e) => e.toFirebaseFormatString())
                  .toList(),
              value: viewController.homeType.value?.toFirebaseFormatString(),
              onChanged: (String? newHomeType) {
                if (newHomeType != null) {
                  viewController.homeType.value = newHomeType.toHomeType();
                }
              },
              labelText: "Your home type",
            ),
          ),
          bigSeperator,
          Obx(
            () => BsOpOfferingLocationCard(
              location: viewController.homeLocation.value,
              label: "Pick house location",
              onLocationSelected: (Location loc) {
                viewController.homeLocation.value = loc;
              },
              validator: (Location? loc) {
                if (loc == null) {
                  return "Please select a location";
                }
                return null;
              },
            ),
            bigSeperator,
            Text(
              "Bedrooms",
              style: context.textTheme.bodyLarge,
            ),
            smallSepartor,
            TextFormField(
              controller: viewController.bedroomsController,
              decoration: InputDecoration(
                hintText: "how many bedrooms does your home have?",
              ),
            ),
            bigSeperator,
            Text(
              "Bathrooms",
              style: context.textTheme.bodyLarge,
            ),
            smallSepartor,
            TextFormField(
              controller: viewController.bathroomsController,
              decoration: InputDecoration(
                hintText: "how many bathrooms does your home have?",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
