import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';

class CustomerAppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      //---------------------------------------------------- COLORS ------------------------------------------------------------------------//
      //---------------------------------------------------- COLORS ------------------------------------------------------------------------//
      primaryColor: Colors.white,

      primaryColorLight: Color(0xFF6779FE),

      indicatorColor: Color(0xFF6779FE),
      brightness: Brightness.light,

      dividerColor: Colors.grey.withOpacity(0.8),
      colorScheme: ColorScheme.light().copyWith(secondary: Colors.grey[850]),

      //---------------------------------------------------- WIGGETS ------------------------------------------------------------------------//
      //---------------------------------------------------- WIGGETS ------------------------------------------------------------------------//
      scaffoldBackgroundColor: Color(0XFFFAFAFA),
      checkboxTheme: CheckboxThemeData(
          side: BorderSide(color: primaryBlueColor),
          checkColor: MaterialStateProperty.all<Color>(Colors.white),
          fillColor: MaterialStateColor.resolveWith(
              (Set<MaterialState> states) => primaryBlueColor)),
      sliderTheme: SliderThemeData(
        thumbColor: primaryBlueColor,
        showValueIndicator: ShowValueIndicator.always,
        valueIndicatorColor: secondaryLightBlueColor,
        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
        inactiveTrackColor: secondaryLightBlueColor,
        activeTrackColor: primaryBlueColor,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 16),
        trackHeight: 3,
        valueIndicatorTextStyle: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 13.mezSp,
          color: Colors.white,
        ),
      ),
      progressIndicatorTheme:
          ProgressIndicatorThemeData(color: primaryBlueColor),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
          fontSize: 17.mezSp,
          color: Colors.black,
        ),
        elevation: 0.2,
        centerTitle: true,
        titleSpacing: 16,
        iconTheme: IconThemeData(color: Colors.black),
        actionsIconTheme: IconThemeData(color: Colors.black),
      ),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.shade200,
          //isDense: true,
          errorStyle: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w400,
            fontSize: 11.mezSp,
            color: Colors.red,
          ),
          focusColor: Color(0xFF6779FE),
          prefixIconColor: Color(0xFF6779FE),
          suffixIconColor:
              MaterialStateColor.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return primaryBlueColor;
            }
            if (states.contains(MaterialState.error)) {
              return redAccentColor;
            }
            return Colors.grey;
          }),
          alignLabelWithHint: true,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: "Nunito",
            fontSize: 10.mezSp,
            color: Colors.black.withOpacity(0.8),
          ),
          iconColor:
              MaterialStateColor.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return primaryBlueColor;
            }
            if (states.contains(MaterialState.error)) {
              return redAccentColor;
            }
            return Colors.grey;
          }),
          contentPadding: EdgeInsets.all(12),
          isDense: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(width: 1, color: Colors.grey.shade400)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide.none),
          floatingLabelBehavior: FloatingLabelBehavior.never),

      bottomAppBarTheme:
          BottomAppBarTheme(color: Color(0xFF6779FE), elevation: 1.0),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 1.0,
          selectedItemColor: primaryBlueColor),
      buttonTheme:
          ButtonThemeData(shape: CircleBorder(), padding: EdgeInsets.all(8)),
      dialogTheme: DialogTheme(
        titleTextStyle: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
          fontSize: 18.mezSp,
          color: Colors.black,
        ),
        contentTextStyle: TextStyle(
          fontFamily: "Nunito",
          fontWeight: FontWeight.w600,
          fontSize: 13.mezSp,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Color(0xFF6779FE),
        padding: EdgeInsets.all(12),
        textStyle: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 14.mezSp,
          color: Colors.white,
        ),
      )),
      iconTheme: IconThemeData(color: Colors.grey[850]),
      cardTheme: CardTheme(
        elevation: 0.5,
        margin: EdgeInsets.only(bottom: 3),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: secondaryLightBlueColor,
        showCheckmark: false,
        disabledColor: Colors.grey,
        selectedColor: Colors.white,
        padding: EdgeInsets.all(5),
        labelStyle: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 12.mezSp,
          color: primaryBlueColor,
        ),
        brightness: Brightness.light,
        secondarySelectedColor: Color(0xFF6779FE),
        secondaryLabelStyle: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 14.mezSp,
            color: Colors.white),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
      ),
      //---------------------------------------------------- TYPOGRAPHY ------------------------------------------------------------------------//
      //---------------------------------------------------- Typography ------------------------------------------------------------------------//
      textTheme: TextTheme(
        displayLarge: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
            fontSize: 18.mezSp,
            color: Colors.black),
        displayMedium: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
          fontSize: 17.mezSp,
          color: Colors.black,
        ),
        displaySmall: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 16.mezSp,
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 13.mezSp,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w500,
          height: 1.5,
          fontSize: 11.mezSp,
          color: Color(0xFF494949),
        ),
        titleSmall: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 11.mezSp,
          color: Colors.black,
        ),
        titleMedium: TextStyle(
          fontFamily: "Nunito",
          fontWeight: FontWeight.w400,
          fontSize: 11.mezSp,
          color: Colors.black,
        ),
        bodySmall: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w500,
          fontSize: 13.mezSp,
          color: Colors.black,
        ),
        titleLarge: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 11.mezSp,
          color: Color(0xFF494949),
        ),
        headlineLarge: TextStyle(
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
        headlineMedium: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w700,
          fontSize: 13.mezSp,
          color: Colors.black,
        ),
        headlineSmall: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w700,
          fontSize: 14.mezSp,
          color: Colors.black,
        ),
      ),
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: Color(0xFF6779FE)),
    );
  }
}
