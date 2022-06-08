import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';

class MezcalmosSharedWidgets {
  // Admin Appbar
  static Image logo({double size = 20}) => Image.asset(
        aLogoPath,
        height: size,
        width: size,
        fit: BoxFit.contain,
      );

  static RichText mezcalmosTitle({
    double textSize = nDefaultMezcalmosTextSize,
    bool isBold = false,
  }) =>
      RichText(
        text: TextSpan(
          style: TextStyle(
            fontFamily: 'psr',
            color: Colors.black,
            fontSize: textSize,
          ),
          children: <TextSpan>[
            TextSpan(
              text: sMez,
              style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
              ),
            ),
            TextSpan(
              text: sCalmos,
              style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
                color: Color.fromARGB(255, 103, 122, 253),
              ),
            ),
          ],
        ),
      );

  static Widget fillTitle({required int actionLength, bool showLogo = true}) {
    return Container(
      //  width: Get.width * 0.55,
      //  width: ,
      child: FittedBox(
        // fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            if (showLogo)
              logo(size: getSizeRelativeToScreen(80, Get.width, Get.height)),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: mezcalmosTitle(),
            ),
          ],
        ),
      ),
    );
  }
}
