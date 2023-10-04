import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:psych_ai/pages/login_page.dart';
import 'package:psych_ai/pages/main_nav_page.dart';
import 'package:psych_ai/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bot/providers/active_theme_provider.dart';
import 'pages/chat_screen.dart';

void main() async {
  await Hive.initFlutter();

  // open a box
  await Hive.openBox("Habit_Database");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTheme = ref.watch(activeThemeProvider);
    return MaterialApp(
      title: 'Psych.AI',
      debugShowCheckedModeBanner: false,
      theme: PTheme.lightTheme,
      darkTheme: PTheme.darkTheme,
      themeMode: activeTheme == Themes.dark ? ThemeMode.dark : ThemeMode.light,
      home: const MainPage(),
    );
  }
}
