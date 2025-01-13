import 'package:flutter/material.dart';
import 'package:dev_dash/ui/about_page.dart';
import 'package:dev_dash/ui/home_page.dart';
import 'package:dev_dash/ui/settings/settings_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  List<Widget> listPages = [
    const HomePage(),
    const AboutPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: listPages[currentPage],
      bottomNavigationBar: Container(
        height: 85,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: GNav(
            duration: const Duration(milliseconds: 500),
            selectedIndex: currentPage,
            onTabChange: (index) {
              setState(() {
                currentPage = index;
              });
            },
            gap: 8,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.blue,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.info,
                text: 'About App',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
