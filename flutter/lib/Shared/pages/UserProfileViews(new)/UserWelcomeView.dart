import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/TextInputHelper.dart';
import 'package:mezcalmos/Shared/pages/UserProfileViews(new)/components/UserProfileImage.dart';
import 'package:mezcalmos/Shared/pages/UserProfileViews(new)/controllers/UserProfileViewController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

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
        appBar: mezcalmosAppBar(AppBarLeftButtonType.Lang),
        bottomSheet: Obx(
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
        body: Obx(
          () => Container(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${_i18n()["title"]}",
                  style: Get.textTheme.headline3,
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
                  style: Get.textTheme.bodyText1,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    onChanged: (String v) {
                      viewController.name.value = v;
                    },
                    inputFormatters: <TextInputFormatter>[
                      UpperCaseTextFormatter()
                    ],
                    style: Get.textTheme.bodyText2?.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "${_i18n()["hint"]}",
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
