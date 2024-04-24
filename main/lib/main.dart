import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:basic/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'welcome_page.dart';
import 'authentication_pages/login.dart';
import 'authentication_pages/signup.dart';
import 'home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'UI Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => WelcomePage(
                child: LoginPage(),
              ),
          '/login': (context) => LoginPage(),
          '/signUp': (context) => SignUpPage(),
          '/home': (context) => HomePage(title: 'Main Menu'),
        });
  }
}
