import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:sizer/sizer.dart';

class MezAdminTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      //---------------------------------------------------- COLORS ------------------------------------------------------------------------//
      //---------------------------------------------------- COLORS ------------------------------------------------------------------------//
      primaryColor: Colors.white,

      primaryColorLight: primaryBlueColor,

      indicatorColor: primaryBlueColor,
      brightness: Brightness.light,

      dividerColor: Colors.grey.withOpacity(0.8),
      colorScheme: ColorScheme.light().copyWith(secondary: Colors.grey[850]),

      //---------------------------------------------------- WIGGETS ------------------------------------------------------------------------//
      //---------------------------------------------------- WIGGETS ------------------------------------------------------------------------//
      scaffoldBackgroundColor: Color(0XFFFAFAFA),

      timePickerTheme: TimePickerThemeData(
        dialHandColor: primaryBlueColor,
        backgroundColor: Colors.white,
        hourMinuteColor: MaterialStateColor.resolveWith(
            (Set<MaterialState> states) =>
                states.contains(MaterialState.selected)
                    ? primaryBlueColor
                    : Colors.grey.shade300),
        //  dayPeriodColor: primaryBlueColor,

        dayPeriodColor: MaterialStateColor.resolveWith(
            (Set<MaterialState> states) =>
                states.contains(MaterialState.selected)
                    ? primaryBlueColor
                    : Colors.grey.shade300),
        dayPeriodTextColor: MaterialStateColor.resolveWith(
            (Set<MaterialState> states) =>
                states.contains(MaterialState.selected)
                    ? Colors.white
                    : Colors.grey.shade800),
        hourMinuteTextColor: MaterialStateColor.resolveWith(
            (Set<MaterialState> states) =>
                states.contains(MaterialState.selected)
                    ? Colors.white
                    : Colors.black),
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontSize: 17.sp,
              color: Colors.black),
          elevation: 0.2,
          centerTitle: true,
          titleSpacing: 16,
          iconTheme: IconThemeData(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.black)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white, elevation: 1.0),
      bottomAppBarTheme:
          BottomAppBarTheme(color: primaryBlueColor, elevation: 1.0),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.grey.shade200,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none),
      ),
      buttonTheme:
          ButtonThemeData(shape: CircleBorder(), padding: EdgeInsets.all(8)),
      dialogTheme: DialogTheme(
          titleTextStyle: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              color: Colors.black),
          contentTextStyle: TextStyle(
              fontFamily: "Nunito",
              fontWeight: FontWeight.w600,
              fontSize: 13.sp,
              color: Colors.black),
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        primary: Colors.white,
        backgroundColor: primaryBlueColor,
        padding: EdgeInsets.all(5),
        textStyle: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          color: Colors.white,
        ),
      )),
      iconTheme: IconThemeData(color: Colors.grey[850]),
      cardTheme: CardTheme(
          elevation: 0.5,
          color: Colors.white,
          margin: EdgeInsets.only(bottom: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.grey.shade300,
        showCheckmark: false,
        disabledColor: Colors.grey,
        selectedColor: Colors.white,
        padding: EdgeInsets.all(12),
        labelStyle: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
            color: Colors.black),
        brightness: Brightness.light,
        secondarySelectedColor: primaryBlueColor,
        secondaryLabelStyle: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: Colors.white),
      ),

      //---------------------------------------------------- TYPOGRAPHY ------------------------------------------------------------------------//
      //---------------------------------------------------- Typography ------------------------------------------------------------------------//
      textTheme: TextTheme(
        headline1: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
            fontSize: 18.sp,
            color: Colors.black),
        headline2: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
            fontSize: 17.sp,
            color: Colors.black),
        headline3: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          color: Colors.black,
        ),
        headline4: TextStyle(
          fontFamily: "Nunito",
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          color: Colors.black,
        ),
        bodyText1: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 12.sp,
          color: Colors.black,
        ),
        bodyText2: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w500,
          height: 1.5,
          fontSize: 11.sp,
          color: Color(0xFF494949),
        ),
        subtitle2: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
          color: Color(0xFF494949),
        ),
        subtitle1: TextStyle(
          fontFamily: "Nunito",
          fontWeight: FontWeight.w400,
          fontSize: 11.sp,
          color: Colors.black,
        ),
      ),
    );
  }
}