import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToSection(double position) {
    _scrollController.animateTo(position,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          'Privacy Policy',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 18.0, left: 15),
              child: Text(
                'Privacy Policy',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            const Divider(
              height: 20,
              color: Colors.grey,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Text(
                '• This Privacy Policy for DevDash App, describe how and why we might collect, use  your Information.',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 25, left: 15),
              child: const Text(
                'Table of Contents',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(
              height: 20,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text.rich(
                TextSpan(
                  text: '1. WHAT INFORMATION DO WE COLLECT',
                  style: const TextStyle(
                    fontFamily: 'roboto',
                    fontSize: 15,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _scrollToSection(200);
                    },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10),
              child: Text.rich(
                TextSpan(
                  text: '2. HOW DO WE PROCESS YOUR INFORMATION',
                  style: const TextStyle(
                    fontFamily: 'roboto',
                    fontSize: 15,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _scrollToSection(400);
                    },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15),
              child: Text.rich(
                TextSpan(
                  text: '3. CONTACT US',
                  style: const TextStyle(
                      fontFamily: 'roboto',
                      fontSize: 15,
                      color: Colors.blue,
                      decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _scrollToSection(600);
                    },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25.0, left: 15),
              child: Text(
                '1. WHAT INFORMATION DO WE COLLECT',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const Divider(color: Colors.grey),
            const Padding(
              padding: EdgeInsets.only(bottom: 18.0, left: 15),
              child: Text(
                'Personal Information you describe to us',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                '• Mobile Number. In this Login Method we collect just your Mobile Number',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, left: 15),
              child: const Text(
                '• Google Account. In this login method we collect your gmail Id, Gmail name, and gmail Picture.',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0, left: 15),
              child: Text(
                '• Note: This all Information are safely stored in Our Database.',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 18.0, left: 15),
              child: Text(
                '2. HOW DO WE PROCESS YOUR INFORMATION',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const Divider(color: Colors.grey),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, top: 10),
              child: Text(
                '• Mobile Number: For LogIn and setting up your Profile.',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0, left: 15),
              child: Text(
                '• Google Account: For LogIn and Setting up Your Profile.',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 18.0, left: 15),
              child: Text(
                '3. CONTACT US',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15),
              child: Text.rich(
                TextSpan(
                  text:
                      'For Any Query regarding our Privacy Policy or Content You can Contact us to our gmail:',
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' DevDashOfficial@gmail.com',
                        style: const TextStyle(
                          fontFamily: 'roboto',
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            final Uri params = Uri(
                              scheme: 'mailto',
                              path: 'DevDashOfficial@gmail.com',
                              query:
                                  'subject=Query regarding Privacy Policy or Content&body = ',
                            );
                            final url = params.toString();
                            final urlPath = Uri.parse(url);
                            launchUrl(urlPath);
                          })
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Padding(
                padding: EdgeInsets.only(top: 10, left: 15),
                child: Text(
                  '• Our team will Shortly response into your query',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 18, left: 15, bottom: 20),
              child: const Text(
                'Last Updated January 31, 2025',
                style: TextStyle(
                  color: Colors.black38,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
