import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Screen'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/shop_background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: Text('Shop Page Content'),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
