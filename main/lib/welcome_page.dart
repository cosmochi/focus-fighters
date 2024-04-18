import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomePage extends StatelessWidget {
  final Widget? child;
  const WelcomePage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => child!),
        );
      },
      child: Scaffold(
        body: Stack(
          children: [
            // Background Image
            Image.asset(
              'assets/images/mainmenubackground.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            // Logo
            Positioned(
              top: MediaQuery.of(context).size.height * 0.2,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Container(
                    width: 300,
                    height: 300,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/mocklogo.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Spacer between logo and text
                  // 'Click to Start' text
                  AnimatedTextKit(
                    animatedTexts: [
                      FadeAnimatedText(
                        'Click to start.',
                        textStyle: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                    repeatForever: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
