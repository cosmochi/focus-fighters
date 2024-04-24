import 'package:flutter/material.dart';

class FriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Friends Screen'),
        ),
        body: Stack(children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/friends_background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: Text('Friends Page Content'),
          ),
        ]));
  }
}
