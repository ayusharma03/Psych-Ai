import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:psych_ai/pages/chatbot_page.dart';
import 'package:psych_ai/pages/habit_tracker.dart';
import 'package:psych_ai/pages/home_page.dart';
import 'package:psych_ai/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  List pages = [
    const HomePage(),
    const ChatBot(),
    const HabitTracker(),
    const ProfilePage(),
  ];
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String userName = "Krishna";
    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hi, $userName"),
              Text(
                "How are you feeling today?",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Ionicons.notifications_outline),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Ionicons.search_outline),
            ),
          ],
        ),
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          selectedItemColor: Theme.of(context).highlightColor,
          items: const [
            // home
            BottomNavigationBarItem(
              icon: Icon(Ionicons.home_outline),
              activeIcon: Icon(Ionicons.home),
              label: "Home",
            ),
            // chatbot
            BottomNavigationBarItem(
              icon: Icon(Ionicons.chatbubble_ellipses_outline),
              activeIcon: Icon(Ionicons.chatbubble_ellipses),
              label: "Chatbot",
            ),
            // Self-Help Features
            BottomNavigationBarItem(
              icon: Icon(Ionicons.calendar_outline),
              activeIcon: Icon(Ionicons.calendar),
              label: "Features",
            ),
            // profile & about
            BottomNavigationBarItem(
              icon: Icon(Ionicons.person_outline),
              activeIcon: Icon(Ionicons.person),
              label: "Profile",
            ),
          ],
        ));
  }
}
