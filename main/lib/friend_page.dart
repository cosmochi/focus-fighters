import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);  // Needed to properly integrate with AutomaticKeepAliveClientMixin
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends Screen'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/friends_background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: Text('Friends Page Content'),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true; // This is necessary for AutomaticKeepAliveClientMixin to work
}
