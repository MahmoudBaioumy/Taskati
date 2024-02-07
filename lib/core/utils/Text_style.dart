import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getTitelStyle(
    {double fontSize = 18,
    FontWeight fontWeight = FontWeight.bold,
    Color color = const Color(0xff121212)}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
      fontFamily: GoogleFonts.poppins().fontFamily);
}

TextStyle getBodyStyle(
    {double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
    Color color = const Color(0xff121212)}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: GoogleFonts.poppins().fontFamily);
}

TextStyle getSmalStyle(
    {double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color color = const Color(0xffB4AAAA)}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: GoogleFonts.poppins().fontFamily);
}
