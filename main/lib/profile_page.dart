import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/profile_background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: Text('Profile Page Content'),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
