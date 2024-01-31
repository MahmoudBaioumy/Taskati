import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/home/Home_view.dart';
import 'package:flutter_application_2/upload_view.dart';
import 'package:flutter_application_2/features/delay.dart';
import 'package:flutter_application_2/features/profile/profile.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('user');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: profile(),
    );
  }
}
