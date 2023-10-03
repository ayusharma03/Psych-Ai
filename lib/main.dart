import 'package:device_preview/device_preview.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psych_ai/pages/main_nav_page.dart';

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
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(206, 33, 255, 1),
        brightness: Brightness.light,
        indicatorColor: Colors.grey[100],
        selectedRowColor: const Color.fromRGBO(206, 33, 255, 1),
        highlightColor: const Color.fromRGBO(206, 33, 255, 1),
        textTheme: GoogleFonts.balooDa2TextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color.fromRGBO(206, 33, 255, 1),
        indicatorColor: const Color.fromRGBO(206, 33, 255, 1),
        selectedRowColor: Colors.white,
        highlightColor: const Color.fromRGBO(206, 33, 255, 1),
      ),
      themeMode: ThemeMode.dark,
      home: const MainPage(),
    );
  }
}
