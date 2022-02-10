import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeFooterButtons extends StatelessWidget {
  HomeFooterButtons({
    Key? key,
  }) : super(key: key);
  LanguageController i18n = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: InkWell(
              onTap: () {
                i18n.changeUserLanguage();
              },
              child: Ink(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 20.sp,
                      width: 20.sp,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(i18n.oppositFlag))),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(i18n.oppositToLang, style: txt.bodyText2),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: InkWell(
              onTap: () async =>
                  await launch(GetStorage().read(getxPrivacyPolicyLink)),
              child: Ink(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Ionicons.lock_closed,
                      // color: Theme.of(context).primaryColorLight,
                      size: 20.sp,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Text(
                        i18n.strings['customerApp']['components']
                            ['CustomerHomeFooterButtons']["privacyPolicy"],
                        style: txt.bodyText2,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
