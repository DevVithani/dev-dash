import 'package:dev_dash/ui/login_page.dart';
import 'package:dev_dash/ui/navigation_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.data == null) {
          return const LoginPage();
        } else {
          return const HomeScreen();
        }
        // return const Center(
        //   child: CircularProgressIndicator(),
        // );
      },
    );
  }
}