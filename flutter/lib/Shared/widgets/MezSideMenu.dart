import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['Shared']['widgets']["MezSideMenu"];

class MezSideMenu extends GetWidget<AuthController> {
  final SideMenuDrawerController _drawerController =
      Get.find<SideMenuDrawerController>();

  final LanguageController languageController = Get.find<LanguageController>();

  final String appName = getAppName();
  static final AppLaunchMode lmd = getAppLaunchMode();

  final String version = GetStorage().read<String>(getxAppVersion) as String;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 50),
                    _drawerHeader(),
                    // SizedBox(height: 43),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(
                        color: Color.fromRGBO(196, 196, 196, 0.29),
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildSideMenuItem(),
                    _basicSideMenuItems(),
                  ],
                ),
              ),
            ),
            Container(
                alignment: Alignment.center,
                child: Text(
                  version +
                      (lmd != AppLaunchMode.prod
                          ? " ${lmd.toShortString()}"
                          : ""),
                ))
          ],
        ),
      ),
    );
  }

  Widget _basicSideMenuItems() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SideMenuItem(
          icon: Icons.person,

          title: "Profile", // _i18n()["userInfo"],
          onClick: () {
            _drawerController.closeMenu();
            Get.toNamed<void>(kUserProfile);
          },
        ),
        SideMenuItem(
          icon: Icons.notifications,

          title: "Notifications", // _i18n()["userInfo"],
          onClick: () {
            _drawerController.closeMenu();
            Get.toNamed<void>(kNotificationsRoute);
          },
        ),
        if (_drawerController.showPastOrders &&
            _drawerController.pastOrdersRoute != null)
          SideMenuItem(
            icon: Icons.restore,

            title: "Past orders", // _i18n()["userInfo"],
            onClick: () {
              _drawerController.closeMenu();
              Get.toNamed<void>(_drawerController.pastOrdersRoute!);
            },
          ),
        SideMenuItem(
          titleWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Language",
                style: Get.textTheme.bodyText1,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(languageController.oppositFlag),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    languageController.oppositToLang,
                  ),
                ],
              ),
            ],
          ),
          icon: Icons.g_translate_outlined,
          onClick: () {
            languageController.changeUserLanguage();
            _drawerController.closeMenu();
          },
        ),
        Obx(
          () => SideMenuItem(
            icon: Icons.privacy_tip,

            title: _i18n()["legal"], // _i18n()["userInfo"],
            onClick: () => launch(GetStorage().read(getxPrivacyPolicyLink)),
          ),
        ),
        controller.fireAuthUser != null ? _buildSideMenuItem() : Container(),
        Obx(
          () => SideMenuItem(
            icon: Icons.logout,
            title: _i18n()["logout"],
            onClick: () async {
              _drawerController.closeMenu();
              await controller.signOut();
            },
          ),
        ),
      ],
    );
  }

  Container _drawerHeader() {
    return Container(
      padding: EdgeInsets.only(left: 21),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 136,
            width: 136,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 214, 214, 214),
              // border: Border.all(color: Colors.black),
            ),
            child: ClipOval(
              clipBehavior: Clip.antiAlias,
              child: controller.user?.image == null ||
                      controller.user?.image == ""
                  ? Icon(
                      Icons.account_circle_outlined,
                      size: 136,
                    )
                  : CachedNetworkImage(
                      imageUrl: controller.user!.image!,
                      fit: BoxFit.cover,
                      imageBuilder: (BuildContext context,
                              ImageProvider<Object> imageProvider) =>
                          Container(
                        width: getSizeRelativeToScreen(300, 100.w, 100.h).sp,
                        height: getSizeRelativeToScreen(300, 100.w, 100.h).sp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      placeholder: (BuildContext context, String url) =>
                          Container(
                        width: getSizeRelativeToScreen(300, 100.w, 100.h).sp,
                        height: getSizeRelativeToScreen(300, 100.w, 100.h).sp,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (BuildContext context, String url, error) =>
                          Container(
                              width:
                                  getSizeRelativeToScreen(300, 100.w, 100.h).sp,
                              height:
                                  getSizeRelativeToScreen(300, 100.w, 100.h).sp,
                              child: Center(child: Icon(Icons.error))),
                    ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            child: Text(
              controller.user?.name ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildSideMenuItem() {
    if (_drawerController.sideMenuItems != null) {
      return Column(
        children: _drawerController.sideMenuItems!,
      );
    } else
      return Container();
  }
}

class SideMenuItem extends StatelessWidget {
  const SideMenuItem(
      {Key? key,
      required this.onClick,
      required this.icon,
      this.title,
      this.titleWidget})
      : super(key: key);
  final IconData icon;
  final Widget? titleWidget;
  final String? title;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              color: Colors.grey.shade400,
              size: 25,
            ),
            SizedBox(
              width: 25,
            ),
            title != null
                ? Text(
                    title!,
                    style: Get.textTheme.bodyText1,
                  )
                : titleWidget ?? Container()
          ],
        ),
      ),
    );
  }
}

// class SideMenuItem extends StatefulWidget {
//   const SideMenuItem({
//     Key? key,
//     required this.onClick,
//     required this.icon,
//     required this.title,
//     this.descriptionRow,
//   }) : super(key: key);

//   final GestureTapCallback onClick;
//   final Widget icon;
//   final String title;
//   final Row? descriptionRow;

//   @override
//   _SideMenuItemState createState() => _SideMenuItemState();
// }

// class _SideMenuItemState extends State<SideMenuItem> {
//   final AuthController _authController = Get.find<AuthController>();
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => _authController.user != null
//           ? Container(
//               child: Padding(
//                 padding: const EdgeInsets.only(bottom: 5.0),
//                 child: ListTile(
//                   onTap: widget.onClick,
//                   leading: widget.icon,
//                   title: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "${widget.title}",
//                         style: TextStyle(
//                           fontFamily: 'Montserrat',
//                           fontSize: 18,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       if (widget.descriptionRow != null) widget.descriptionRow!
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           : SizedBox(),
//     );
//   }
// }
