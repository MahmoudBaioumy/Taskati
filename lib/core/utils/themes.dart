import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/Text_style.dart';
import 'package:flutter_application_2/core/utils/colorsapp.dart';
import 'package:google_fonts/google_fonts.dart';

/////////ligth mode///////////////////////////////////////////////
final lightTheme = ThemeData(

    //date picker color
    datePickerTheme: const DatePickerThemeData(
      headerBackgroundColor: Colors.black,
      backgroundColor: Colors.white,
      dayForegroundColor: MaterialStatePropertyAll(Colors.black),
    ),
    primaryColor: Colors.black,
    // text theme
    textTheme: TextTheme(
      displayLarge: getTitelStyle(),
      displayMedium: getBodyStyle(),
      displaySmall: getSmalStyle(),
    ),
    //back ground color for ligth mode
    scaffoldBackgroundColor: Colors.white,
    fontFamily: GoogleFonts.poppins().fontFamily,

    // app Bar
    appBarTheme: AppBarTheme(
        backgroundColor: colorsapp.whitecolor,
        centerTitle: true,
        titleTextStyle: getTitelStyle(color: colorsapp.whitecolor)),

    // input Decoration
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: getSmalStyle(),
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: colorsapp.primarycolor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: colorsapp.primarycolor)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: colorsapp.pinkcolor)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: colorsapp.pinkcolor)),
    ));

////////////////////////dark mode/////////////////////////////////////////////
var darktheme = ThemeData(
  fontFamily: GoogleFonts.poppins().fontFamily,
  primaryColor: Colors.white,
  textTheme: TextTheme(
    //text theme
    displayLarge: getTitelStyle(color: colorsapp.whitecolor),
    displayMedium: getBodyStyle(color: colorsapp.whitecolor),
    displaySmall: getSmalStyle(),
  ),
  scaffoldBackgroundColor: Colors.black,
  // app Bar
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      centerTitle: true,
      titleTextStyle: getTitelStyle(color: colorsapp.whitecolor)),

////////dialog/////////////////////
  datePickerTheme: const DatePickerThemeData(
    headerForegroundColor: Colors.white,
    headerBackgroundColor: Colors.white,
    backgroundColor: Colors.black,
    dayForegroundColor: MaterialStatePropertyAll(Colors.white),
  ),

  ////input
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: getSmalStyle(),
    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: colorsapp.primarycolor)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: colorsapp.primarycolor)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: colorsapp.pinkcolor)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: colorsapp.pinkcolor)),
  ),
);
