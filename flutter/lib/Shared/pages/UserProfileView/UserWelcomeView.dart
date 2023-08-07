import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/SignInHelper.dart';
import 'package:mezcalmos/Shared/helpers/TextInputHelper.dart';
import 'package:mezcalmos/Shared/pages/UserProfileView/components/UserProfileImage.dart';
import 'package:mezcalmos/Shared/pages/UserProfileView/controllers/UserProfileViewController.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ["UserWelcomeView"];

class UserWelcomeView extends StatefulWidget {
  const UserWelcomeView({super.key});

  @override
  State<UserWelcomeView> createState() => _UserWelcomeViewState();
}

class _UserWelcomeViewState extends State<UserWelcomeView> {
  UserProfileViewController viewController = UserProfileViewController();

  @override
  void initState() {
    viewController.switchMode(UserProfileViewMode.FirstTime);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        resizeToAvoidBottomInset: false,
        appBar: MezcalmosAppBar(AppBarLeftButtonType.Lang),
        floatingActionButton: Obx(
          () => MezButton(
            enabled: viewController.isInfoSet,
            borderRadius: 0,
            height: 80,
            label: "${_i18n()["save"]}",
            onClick: () async {
              await viewController.setInfo();
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Obx(
          () => Container(
            padding: const EdgeInsets.all(22),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${_i18n()["title"]}",
                    style: context.txt.displaySmall,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${_i18n()["subtitle"]}",
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  UserProfileImage(
                    viewController: viewController,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    "${_i18n()["nameTitle"]}",
                    style: context.txt.bodyLarge,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                      initialValue: AppleSignInCreds.appleName ??
                          FirebaseAuth.instance.currentUser?.displayName ??
                          '',
                      onChanged: (String v) {
                        viewController.name.value = v;
                      },
                      inputFormatters: <TextInputFormatter>[
                        UpperCaseTextFormatter()
                      ],
                      style:
                          context.txt.bodyMedium?.copyWith(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "${_i18n()["hint"]}",
                      ),
                    ),
                  ),
                  // Padding(
                  //     padding: EdgeInsets.only(
                  //   bottom: MediaQuery.of(context).viewInsets.bottom,
                  // ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
