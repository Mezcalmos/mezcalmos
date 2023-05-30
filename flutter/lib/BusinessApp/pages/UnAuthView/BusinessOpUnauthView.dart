import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/UnAuthView/controllers/BusinessOpUnauthViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/ServiceProviders/ServiceWaitingForApproval.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["LaundryApp"]["pages"]
    ["LaundryUnauthView"];

class BusinessOpUnauthView extends StatefulWidget {
  const BusinessOpUnauthView({super.key});

  @override
  State<BusinessOpUnauthView> createState() => _BusinessOpUnauthViewState();
}

class _BusinessOpUnauthViewState extends State<BusinessOpUnauthView> {
  BusinessOpUnauthViewController viewController =
      BusinessOpUnauthViewController();
  @override
  void initState() {
    viewController.init();
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
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Menu,
        showNotifications: true,
      ),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: MezSideMenu(),
      body: Obx(
        () => Container(
          margin: const EdgeInsets.all(20),
          child: (viewController.hasStatus)
              ? ServiceWaitingForApproval()
              : Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 35.h,
                      width: double.infinity,
                      child: Image.asset(
                        aRequestWaiting,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      alignment: Alignment.center,
                      child: Text(
                        "${_i18n()['title']}",
                        style: context.txt.displaySmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
