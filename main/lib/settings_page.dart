import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);  // This needs to be called with AutomaticKeepAliveClientMixin
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/options_background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: Text('Settings Page Content'),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
