import 'package:dev_dash/ui/login_page.dart';
import 'package:dev_dash/ui/navigation_page.dart';
import 'package:dev_dash/ui/otp_screen.dart';
import 'package:dev_dash/ui/auth.dart';
import 'package:dev_dash/ui/splash_screen.dart';
import 'package:dev_dash/ui/theme.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );
  runApp(const MyApp());
}

void initApp() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            themeMode: themeProvider.themeMode,
            theme: Themes.lightTheme,
            darkTheme: Themes.darkTheme,
            title: 'DevDash',
            initialRoute: '/',
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => const SplashScreen(),
              'splash':  (context) => const Splash(),
              'phone': (context) => const LoginPage(),
              'verify': (context) => const OtpPage(),
              'home': (context) => const HomeScreen(),
            },
          );
        },
      ),
    );
  }
}
