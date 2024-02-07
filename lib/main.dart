import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/themes.dart';
import 'package:flutter_application_2/features/delay.dart';
import 'package:flutter_application_2/features/model/task_model.dart';
import 'package:flutter_application_2/features/profile/profile.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('user');
  await Hive.openBox<bool>('mode');
  Hive.registerAdapter(TaskmodelAdapter());
  await Hive.openBox<Taskmodel>('task');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<bool>('mode').listenable(),
      builder: (context, value, child) {
        bool darkmode = value.get('darkmode', defaultValue: false)!;
        return MaterialApp(
          themeMode: darkmode ? ThemeMode.dark : ThemeMode.light,
          theme: lightTheme,
          darkTheme: darktheme,
          debugShowCheckedModeBanner: false,
          home: const delay(),
        );
      },
    );
  }
}
