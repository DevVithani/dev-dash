import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          'Privacy',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: const Text(
                textAlign: TextAlign.justify,
                'This Privacy page will help you better understand how we collect, use, and share your personal information.',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 25),
              child: const Text(
                'Privacy Summary',
                style: TextStyle(
                  fontSize: 35,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.double,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 25, left: 15),
              child: const Text(
                '1. What Personal Information we collect. To register for our Services, you need to provide your Mobile number or Email and name. These all things are stored in our database system.',
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
