import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/LocationPickerController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/pages/PickLocationView/controllers/PickLocationViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/LocationSearchComponent.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["PickLocationScreen"]["PickLocationView"];

class PickLocationView extends StatefulWidget {
  static Future<MezLocation?> navigate({
    LatLng? initialLocation,
    Future<void> Function({MezLocation location})? onSaveLocation,
  }) async {
    await MezRouter.toPath(SharedRoutes.kPickLocation, arguments: {
      "initialLocation": initialLocation,
      "onSaveLocation": onSaveLocation
    });
    mezDbgPrint(
        "Back result right before popping =====>${MezRouter.backResult}");

    return MezRouter.backResult;
  }

  @override
  _PickLocationViewState createState() => _PickLocationViewState();
}

class _PickLocationViewState extends State<PickLocationView> {
  PickLocationViewController viewController = PickLocationViewController();

  @override
  void initState() {
    viewController.init(
      defaultLocation: MezRouter.bodyArguments?["initialLocation"],
      onSave: MezRouter.bodyArguments?["onSaveLocation"],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MezButton(
        height: 75,
        borderRadius: 0,
        label: "${_i18n()["pickLocation"]}",
        onClick: () async {
          await viewController.pickLocationClickAction(context);
        },
      ),
      resizeToAvoidBottomInset: false,
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
        title: "${_i18n()["pickLocation"]}",
      ),
      body: mezPickLocationViewBody(),
    );
  }

  Container mezPickLocationViewBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: Text(_i18n()["pickLabele"]),
          ),
          Obx(
            () => Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: LocationSearchComponent(
                  showSearchIcon: true,
                  initialTextValue: viewController
                      .locationPickerController.location.value?.address,
                  onClear: () {},
                  notifyParent: (MezLocation? location) {
                    mezDbgPrint(
                        "Location =================================>$location");
                    if (location != null) {
                      setState(() {
                        viewController.locationPickerController
                            .setLocation(location);
                        viewController.locationPickerController.moveToNewLatLng(
                            location.latitude, location.longitude);
                      });
                    }
                  }),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(
            () => Expanded(
                child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade200),
              child: viewController.locationPickerController.location.value !=
                      null
                  ? LocationPicker(
                      showBottomButton: false,
                      locationPickerMapController:
                          viewController.locationPickerController,
                      notifyParentOfConfirm: (_) {},
                      notifyParentOfLocationFinalized: (MezLocation? location) {
                        if (location != null) {
                          setState(() {
                            viewController.locationPickerController
                                .setLocation(location);
                          });
                        }
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 1,
                      ),
                    ),
            )),
          ),
        ],
      ),
    );
  }
}
