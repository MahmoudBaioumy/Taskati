import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/colorsapp.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, 
   this.backgroundColor = const Color(0xff4E5AE8),
  required this.text,
  required this.onPressed});

  final String text;
  final Function()? onPressed;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: backgroundColor,
            foregroundColor: colorsapp.whitecolor),
        onPressed: onPressed,
        child: Text(text));
  }
}
