import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen/UserProfileController.dart';
import 'package:mezcalmos/WebApp/controllers/mezWebSideBarController.dart';
import 'package:mezcalmos/WebApp/screens/components/InstallAppBarComponent.dart';
import 'package:mezcalmos/WebApp/screens/components/webAppBarComponent.dart';
import 'package:mezcalmos/WebApp/screens/userProfile/components/UserProfileForDesktop.dart';
import 'package:mezcalmos/WebApp/values/constants.dart';
import 'package:mezcalmos/WebApp/webHelpers/SetUpHelper.dart';
import 'package:mezcalmos/WebApp/widgets/mezBottomBar.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';
import 'package:mezcalmos/WebApp/widgets/mezLoaderWidget.dart';

UserProfileController userProfileController = UserProfileController();

class UserProfile extends StatefulWidget {
  UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    mezDbgPrint("🧑‍🦲 init of the Profile screen ");
    userProfileController.initSetup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("🧑‍🦲 build of the Profile screen ");
    return checkWebAppTypeVersionAndBuild(context);
  }

  Widget checkWebAppTypeVersionAndBuild(BuildContext context) {
    if (MezCalmosResizer.isMobile(context) ||
        MezCalmosResizer.isSmallMobile(context)) {
      mezDbgPrint("i'm here");
      return BodyWidget(context);
    } else {
      mezDbgPrint("this should't be happen ");
      return Scaffold(
        body: FutureBuilder<bool>(
          future: setupFirebase(
            launchMode: typeMode.toLaunchMode(),
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data == true) {
              return BodyWidget(context);
            } else {
              return const Scaffold(
                  body: Center(
                child: MezLoaderWidget(),
              ));
            }
          },
        ),
      );
    }
  }

  Widget BodyWidget(BuildContext context) {
    final MezWebSideBarController drawerController =
        Get.find<MezWebSideBarController>();

    drawerController.drawerKey = GlobalKey();
    // return Scaffold(
    //   body: UserProfileForDesktop(
    //     userProfileController: userProfileController,
    //   ),
    // );

    return Scaffold(
        // key: drawerController.drawerKey,
        // drawer: drawerController.frontDrawerContent,
        appBar: InstallAppBarComponent(),
        bottomNavigationBar: MezBottomBar(),
        body:
            //  LayoutBuilder(builder: ((context, constraints) {
            //   return
            Scaffold(
          backgroundColor: Colors.white,
          appBar: WebAppBarComponent(
            automaticallyGetBack: true,
            type: WebAppBarType.DontShowMenu.obs,
          ),
          body: UserProfileForDesktop(
            userProfileController: userProfileController,
          ),
        )
        //   ;
        // })
        // )

        );
  }
}
