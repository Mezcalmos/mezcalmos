import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/controllers/CreateServiceViewController.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/pages/CreateServiceInfoPage.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/pages/CreateServiceSchedulePage.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/pages/CreateServiceStartPage.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliverySettingsView/DeliverySettingView.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ['CreateServiceView'];

//
class CreateServiceView extends StatefulWidget {
  const CreateServiceView({super.key});

  static Future<void> navigate(
      {required ServiceProviderType serviceProviderType}) {
    return MezRouter.toPath(SharedServiceProviderRoutes.kCreateServiceRoute,
        arguments: <String, dynamic>{
          "serviceProviderType": serviceProviderType,
        });
  }

  @override
  State<CreateServiceView> createState() => _CreateServiceViewState();
}

class _CreateServiceViewState extends State<CreateServiceView> {
  CreateServiceViewController viewController = CreateServiceViewController();
  ServiceProviderType? serviceProviderType;

  @override
  void initState() {
    serviceProviderType =
        MezRouter.bodyArguments?["serviceProviderType"] as ServiceProviderType;
    viewController.init(serviceProviderType: serviceProviderType!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Obx(
          () => MezcalmosAppBar(
              (viewController.currentPage.value != 0)
                  ? AppBarLeftButtonType.Back
                  : AppBarLeftButtonType.Menu,
              showNotifications: true,
              title: viewController.getTitle(),
              onClick: viewController.handleBack),
        ),
      ),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: MezSideMenu(),
      bottomSheet: Obx(
        () => (viewController.currentPage.value != 0 &&
                viewController.currentPage.value != 1)
            ? MezButton(
                height: 75,
                label: viewController.getSaveButtonTitle(),
                borderRadius: 0,
                onClick: () async {
                  if (viewController.isFormValid()) {
                    await _handleButton(context);
                  }
                },
              )
            : SizedBox(),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: viewController.pageController,
        children: [
          CreateServiceStartPage(viewController: viewController),
          CreateServiceInfoPage(
            viewController: viewController,
            onSaveButton: () async {
              if (viewController.isFormValid()) {
                await _handleButton(context);
              }
            },
          ),
          CreateServiceSchedulePage(
            viewController: viewController,
          ),
          DeliverySettingsView(createServiceViewController: viewController),
        ],
      ),
    );
  }

  Future<void> _handleButton(BuildContext context) async {
    final bool? res = await viewController.handleNext();
    if (res == true) {
      await showStatusInfoDialog(
        context,
        primaryClickTitle: "${_i18n()['ok']}",
        primaryIcon: viewController.serviceType.toIcon(),
        showSmallIcon: false,
        primaryCallBack: () {
          viewController.confirmCallBack(context);
          // MezRouter.popEverythingAndNavigateTo(RestaurantAppRoutes.tabsRoute);
        },
        status:
            "${_i18n()['createdTitle']["${viewController.serviceType.toFirebaseFormatString()}"]}",
        description:
            "${_i18n()['createdSubtitle']["${viewController.serviceType.toFirebaseFormatString()}"]}",
      );
    }
  }
}
