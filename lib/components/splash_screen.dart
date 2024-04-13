import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  final Future<String> Function() init;

  const SplashScreen({
    required this.init,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenRouteFunction(
      backgroundColor: Colors.black,
      screenRouteFunction: init,
      splashIconSize: Get.height,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/logo.jpeg',
              width: 200,
            ),
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
