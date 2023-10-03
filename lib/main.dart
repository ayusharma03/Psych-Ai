import 'package:device_preview/device_preview.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:psych_ai/login_page.dart';
import 'package:psych_ai/pages/main_nav_page.dart';
import 'package:psych_ai/theme/theme.dart';

void main() async {
  await Hive.initFlutter();

  // open a box
  await Hive.openBox("Habit_Database");
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      title: 'Psych.AI',
      debugShowCheckedModeBanner: false,
      theme: PTheme.lightTheme,
      darkTheme: PTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: LoginPage(),
    );
  }
}
