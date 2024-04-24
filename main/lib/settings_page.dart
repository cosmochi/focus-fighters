import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings Screen'),
        ),
        body: Stack(children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/options_background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: Text('Settings Page Content'),
          ),
        ]));
  }
}
