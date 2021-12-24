import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';

enum SignInMode {
  OptionalSignIn,
  RequiredSignIn,
}

class SignIn extends GetWidget<AuthController> {
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  final SignInMode mode;
  SignIn({required this.mode});
  LanguageController lang = Get.find<LanguageController>();
  RxBool clickedLogin = false.obs;

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);

    final sw = MediaQuery.of(context).size.width.w;
    final sh = MediaQuery.of(context).size.height.h;
    final lmode = GetStorage().read(getxLmodeKey);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => Column(
                children: [
                  (mode == SignInMode.OptionalSignIn)
                      ? Container(
                          padding: const EdgeInsets.all(15),
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        )
                      : Container(),
                  MezcalmosSharedWidgets.logo(
                      size: getSizeRelativeToScreen(60.w, sh, sw)),
                  SizedBox(height: 10),
                  MezcalmosSharedWidgets.mezcalmosTitle(
                      textSize: 40.sp, isBold: true),
                  SizedBox(
                    height: 25,
                  ),
                  Flexible(
                    flex: 2,
                    child: Text(lang.strings['shared']['login']["title"],
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1),
                  ),
                  ...buildSignInButtons(lmode)
                ],
              ),
            )),
      )),
    );
  }

  List<Widget> buildSignInButtons(String? lmode) {
    if (clickedLogin.value) {
      return <Widget>[
        SizedBox(
          height: 50,
        ),
        Spacer(),
        Center(
            child: Container(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 2.5,
                ))),
        Spacer()
      ];
    } else {
      return <Widget>[
        Spacer(),
        facebookLoginBtn(lmode),
        SizedBox(
          height: 10,
        ),
        smsLoginBtn(),
        SizedBox(
          height: 10,
        ),
        if (lmode != "dev" && Platform.isIOS) appleLoginBtn(),
      ];
    }
  }

  Widget appleLoginBtn() {
    return Container(
      width: double.infinity,
      child: TextButton(
          onPressed: () async {
            clickedLogin.value = true;
            await controller.signInWithApple();
            clickedLogin.value = false;
          },
          style: TextButton.styleFrom(
              backgroundColor: Colors.black,
              fixedSize: Size(double.infinity, 50)),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.05, right: Get.width * 0.05),
                    child: Icon(Ionicons.logo_apple)),
                Spacer(),
                Text(
                  lang.strings['shared']['login']["loginWithApple"],
                ),
                Spacer()
              ],
            ),
          )),
    );
  }

  Widget smsLoginBtn() {
    return Container(
      width: double.infinity,
      child: TextButton(
          onPressed: () => Get.toNamed(kOtpRoute),
          style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              fixedSize: Size(double.infinity, 50)),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.05, right: Get.width * 0.05),
                    child: Icon(Ionicons.chatbox)),
                Spacer(),
                Text(
                  lang.strings['shared']['login']["loginWithSms"],
                ),
                Spacer(),
              ],
            ),
          )),
    );
  }

  Widget facebookLoginBtn(String? lmode) {
    return Container(
      width: double.infinity,
      child: TextButton(
          onPressed: () async {
            clickedLogin.value = true;
            lmode != "dev"
                ? await controller.signInWithFacebook()
                : await Get.defaultDialog(
                    title: "Choose Test User",
                    content: Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              Get.back();
                              controller.signIn(
                                  tTestCustomerValue, tEmailTestPassword);
                            },
                            child: Text(tTestCustomerValue)),
                        TextButton(
                            onPressed: () {
                              Get.back();
                              controller.signIn(
                                  tTestTaxiValue, tEmailTestPassword);
                            },
                            child: Text(tTestTaxiValue)),
                        TextButton(
                            onPressed: () {
                              Get.back();
                              controller.signIn(
                                  tTestAdminValue, tEmailTestPassword);
                            },
                            child: Text(tTestAdminValue))
                      ],
                    ));

            clickedLogin.value = false;
          },
          style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 58, 85, 159),
              fixedSize: Size(double.infinity, 50)),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: Get.width * 0.05, right: Get.width * 0.05),
                  child: Icon(Ionicons.logo_facebook),
                ),
                Spacer(),
                Text(
                  lmode != "dev"
                      ? lang.strings['shared']['login']["fbBtn"]
                      : "test mode login",
                ),
                Spacer(),
              ],
            ),
          )),
    );
  }
}
