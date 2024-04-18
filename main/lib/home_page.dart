import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'profile_page.dart';
import 'timer_page.dart';
import 'friend_page.dart';
import 'shop_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: PageController(initialPage: 2),
        children: [
          SettingsScreen(),
          ProfilePage(),
          TimerPage(),
          FriendsPage(),
          ShopPage(),
        ],
      ),
    );
  }
}
