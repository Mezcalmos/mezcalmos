import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/models/Services/ServiceInput.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/pages/CreateServiceOnboarding/controllers/CreateServiceViewController.dart';
import 'package:mezcalmos/Shared/pages/DeliverySettingsView/components/DeliverySettingCostComponent.dart';
import 'package:mezcalmos/Shared/pages/DeliverySettingsView/components/DeliverySettingsCompaniesList.dart';
import 'package:mezcalmos/Shared/pages/DeliverySettingsView/components/ServiceDeliveryTypePicker.dart';
import 'package:mezcalmos/Shared/pages/DeliverySettingsView/controllers/DeliverySettingsViewController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

class DeliverySettingsView extends StatefulWidget {
  const DeliverySettingsView({
    Key? key,
    this.createServiceViewController,
  }) : super(key: key);

  final CreateServiceViewController? createServiceViewController;

  @override
  State<DeliverySettingsView> createState() => _DeliverySettingsViewState();
}

class _DeliverySettingsViewState extends State<DeliverySettingsView> {
  DeliverySettingsViewController viewController =
      DeliverySettingsViewController();
  int? serviceProviderId;
  ServiceProviderType? serviceProviderType;

  @override
  void initState() {
    _settingVariables();
    viewController.init(
        createServiceViewController: widget.createServiceViewController,
        serviceProviderId: serviceProviderId,
        serviceProviderType: serviceProviderType);
    super.initState();
  }

  void _settingVariables() {
    if (Get.parameters["serviceProviderId"] != null &&
        Get.arguments?["serviceProviderType"] != null) {
      serviceProviderId = int.tryParse(Get.parameters["serviceProviderId"]!);

      serviceProviderType =
          Get.arguments?["serviceProviderType"] as ServiceProviderType;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: viewController.isCreatingNewService
          ? null
          : mezcalmosAppBar(AppBarLeftButtonType.Back,
              onClick: MezRouter.back, title: "Delivery"),
      bottomSheet: viewController.isCreatingNewService
          ? null
          : MezButton(
              borderRadius: 0,
              height: 75,
              label: "Save",
              onClick: () async {},
            ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("How would you like to deliver?"),
            SizedBox(
              height: 10,
            ),
            ServiceDeliveryTypePicker(
              viewController: viewController,
            ),
            Obx(() {
              if (viewController.getDeliveryType ==
                  ServiceDeliveryType.Self_delivery) {
                return DeliverySettingCostComponent(
                    viewController: viewController);
              } else
                return DeliverySettingsCompaniesList(
                  viewController: viewController,
                );
            })
          ],
        ),
      ),
    );
  }
}
