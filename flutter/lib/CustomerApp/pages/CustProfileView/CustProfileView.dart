import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCardsListView/CustCardsListView.dart';
import 'package:mezcalmos/CustomerApp/pages/CustSavedLocations/CustSavedLocationsView.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/SignInHelper.dart';
import 'package:mezcalmos/Shared/pages/UserProfileView/UserProfileView.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/env.dart';
import 'package:url_launcher/url_launcher_string.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ["UserProfileView"];

class CustProfileView extends StatefulWidget {
  const CustProfileView({super.key});

  @override
  State<CustProfileView> createState() => _CustProfileViewState();
}

class _CustProfileViewState extends State<CustProfileView> {
  final AuthController _authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        appBar: MezcalmosAppBar(AppBarLeftButtonType.Menu,
            onClick: null, title: "${_i18n()["profile"]}"),
        body: SingleChildScrollView(
          child: Obx(() => Container(
                padding: const EdgeInsets.only(top: 22, bottom: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundColor: secondaryLightBlueColor,
                        backgroundImage: CachedNetworkImageProvider(
                            _authController.user?.image ?? ""),
                        radius: 75,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        _authController.user?.name ?? "",
                        style: context.textTheme.displaySmall,
                      ),
                    ),
                    Center(
                      child: Text(
                        '${_i18n()['memberSince']} 12/04/2022',
                        style: TextStyle(
                            fontSize: 8.mezSp, color: offLightShadeGreyColor),
                      ),
                    ),
                    _settingsItems(),
                    _shortcutsItems()
                  ],
                ),
              )),
        ));
  }

  Widget _settingsItems() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 25,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 5),
        child: Text(
          '${_i18n()['settings']}',
          style: context.textTheme.displayLarge
              ?.copyWith(fontSize: 14.mezSp, fontWeight: FontWeight.w600),
        ),
      ),
      Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () => UserProfileView.navigate(),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.grey.shade400,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${_i18n()['userInfo']}',
                    style: context.textTheme.bodyLarge,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey.shade400,
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => CustCardsListView.navigate(),
              child: Row(
                children: [
                  Icon(
                    Icons.credit_card,
                    color: Colors.grey.shade400,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${_i18n()['savedCards']}',
                    style: context.textTheme.bodyLarge,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey.shade400,
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => SavedLocationView.navigate(),
              child: Row(
                children: [
                  Icon(
                    Icons.near_me,
                    color: Colors.grey.shade400,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${_i18n()['savedLocations']}',
                    style: context.textTheme.bodyLarge,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    ]);
  }

  Widget _shortcutsItems() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 25,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 5),
        child: Text(
          '${_i18n()['shortcuts']}',
          style: context.textTheme.displayLarge
              ?.copyWith(fontSize: 14.mezSp, fontWeight: FontWeight.w600),
        ),
      ),
      Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () => launchUrlString(MezEnv.appType.getPrivacyLink()),
              child: Row(
                children: [
                  Icon(
                    Icons.privacy_tip,
                    color: Colors.grey.shade400,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${_i18n()['privacyPolicy']}',
                    style: context.textTheme.bodyLarge,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey.shade400,
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async => logOut(),
              child: Row(
                children: [
                  Icon(
                    Icons.logout,
                    color: redAccentColor,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${_i18n()['logOut']}',
                    style: context.textTheme.bodyLarge
                        ?.copyWith(color: redAccentColor),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    ]);
  }
}
