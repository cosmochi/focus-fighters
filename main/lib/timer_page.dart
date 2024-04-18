import 'package:flutter/material.dart';

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.grey,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/homescreenbackground.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          const Text(
            '',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
