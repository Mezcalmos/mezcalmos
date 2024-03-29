import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
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
      colorScheme: ColorScheme.light()
          .copyWith(primary: primaryBlueColor, secondary: Colors.grey[850]),

      //---------------------------------------------------- WIGGETS ------------------------------------------------------------------------//
      //---------------------------------------------------- WIGGETS ------------------------------------------------------------------------//
      scaffoldBackgroundColor: Color(0XFFFAFAFA),
      tabBarTheme: TabBarTheme(
        labelColor: primaryBlueColor,
        unselectedLabelColor: Colors.grey.shade800,
        unselectedLabelStyle: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w500,
          height: 1.5,
          fontSize: 11.sp,
          color: Color(0xFF494949),
        ),
        labelStyle: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 12.sp,
          color: Colors.black,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          isDense: false,
          errorStyle: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w400,
            fontSize: 11.sp,
            color: Colors.red,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.red, width: 0.5)),
          filled: true,
          fillColor: Colors.grey.shade200),

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
              fontSize: 15.sp,
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
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        backgroundColor: Colors.white,
        elevation: 0.5,
        showCheckmark: false,
        disabledColor: Colors.white,
        selectedColor: secondaryLightBlueColor,
        padding: EdgeInsets.all(12),
        // labelStyle:
        //     MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
        //   if (states.contains(MaterialState.selected)) {
        //     return TextStyle(
        //         fontFamily: "Montserrat",
        //         fontWeight: FontWeight.w600,
        //         fontSize: 11.sp,
        //         color: primaryBlueColor);
        //   } else {
        //     return TextStyle(
        //         fontFamily: "Montserrat",
        //         fontWeight: FontWeight.w500,
        //         fontSize: 11.sp,
        //         color: Colors.grey.shade900);
        //   }
        // }),

        labelStyle: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w500,
            fontSize: 11.sp,
            color: MaterialStateColor.resolveWith(
              (Set<MaterialState> states) =>
                  states.contains(MaterialState.selected)
                      ? primaryBlueColor
                      : Colors.grey.shade900,
            )),
        brightness: Brightness.light,
        secondarySelectedColor: primaryBlueColor,
      ),

      //---------------------------------------------------- TYPOGRAPHY ------------------------------------------------------------------------//
      //---------------------------------------------------- Typography ------------------------------------------------------------------------//
      textTheme: TextTheme(
        displayLarge: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
            fontSize: 18.sp,
            color: Colors.black),
        displayMedium: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
          fontSize: 17.sp,
          color: Colors.black,
        ),
        displaySmall: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 13.sp,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w500,
          height: 1.5,
          fontSize: 11.sp,
          color: Color(0xFF494949),
        ),
        titleSmall: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
          color: Color(0xFF494949),
        ),
        titleMedium: TextStyle(
          fontFamily: "Nunito",
          fontWeight: FontWeight.w400,
          fontSize: 11.sp,
          color: Colors.black,
        ),
        titleLarge: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 11.sp,
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
          fontSize: 13.sp,
          color: Colors.black,
        ),
        headlineSmall: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w700,
          fontSize: 14.sp,
          color: Colors.black,
        ),
      ),
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: Color(0xFF6779FE)),
    );
  }
}
