import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Shop Screen'),
        ),
        body: Stack(children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/shop_background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: Text('Shop Page Content'),
          ),
        ]));
  }
}
