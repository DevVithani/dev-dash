import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dev_dash/ui/auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Splash(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.7, end: 0.3),
            duration: const Duration(seconds: 3),
            curve: Curves.easeOut,
            builder: (context, scale, child) {
              return Transform.scale(
                scale: scale,
                child: child,
              );
            },
            child: Center(
              child: Image.asset('assets/splash_screen.png'),
            ),
          ),
        ),
      ),
    );
  }
}
