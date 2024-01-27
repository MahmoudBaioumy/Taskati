import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/models/colorsapp.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, required this.text, required this.onPressed});

  final String text;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: colorsapp.primarycolor,
            foregroundColor: colorsapp.whitecolor),
        onPressed: onPressed,
        child: Text(text));
  }
}
