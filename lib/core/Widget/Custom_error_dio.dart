import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/models/colorsapp.dart';
ShowErrorDialog(context,text)
{
    return  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(text),
                  backgroundColor: colorsapp.pinkcolor,
                  behavior: SnackBarBehavior.floating,
                ));
}