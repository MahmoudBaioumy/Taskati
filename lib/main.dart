import 'package:flutter/material.dart';
import 'package:flutter_application_2/camera.dart';
import 'package:flutter_application_2/delay.dart';
import 'package:flutter_application_2/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: camera(),
    );
  }
}
