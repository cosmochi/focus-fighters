import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile Screen'),
        ),
        body: Stack(children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/profile_background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: Text('Profile Page Content'),
          ),
        ]));
  }
}
