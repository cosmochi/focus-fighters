import 'package:flutter/material.dart';

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Stack(children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/timer_background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: Text('Timer Page Content'),
          ),
        ]));
  }
}
