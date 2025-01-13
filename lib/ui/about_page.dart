import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'About App',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 350,
                    color: Colors.blue,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 25, top: 10),
                  child: const Text(
                    'About Us',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 35),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 25, top: 70, right: 10),
                  child: const Text(
                    "Welcome to DevDash, your personal learning companion! Whether you're a student looking to enhance your skills, a professional aiming to stay ahead in your field, or someone eager to explore new subjects, we have you covered. Our goal is to make learning engaging, interactive, and accessible to everyone, anytime, anywhere.",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: const Text(
                'What We Offer',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, top: 15, right: 10),
              child: const Text(
                '• Progress Tracking: Monitor your progress, set goals, and celebrate your achievements with our detailed performance analytics.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, top: 15, right: 10),
              child: const Text(
                '• Interactive Lessons: Engage with lessons that include videos, and hands-on Examples to keep you motivated and help reinforce your learning.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const Divider(
              thickness: 2,
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: const Text(
                'Why Choose Us?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, top: 15, right: 10),
              child: const Text(
                "• Learn Anytime, Anywhere: With our app, your learning experience is always at your fingertips. Learn at your own pace, whether you're at home, on the go, or during your commute..",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, top: 15, right: 10),
              child: const Text(
                "• User-Friendly Interface: We've designed our app to be intuitive, so you can focus on what really matters—learning. No distractions, just pure knowledge.",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, top:15, right: 10),
              child: const Text(
                "• Affordable Education: We believe quality education should be accessible to everyone. So that anybody can learn with our content and it's completely free.",
                style: TextStyle(fontSize: 16),
              ),
            ),
            // const Divider(
            //   thickness: 2,
            //   height: 25,
            // ),
            // Container(
            //   padding: const EdgeInsets.only(left: 15, top: 15),
            //   child: const Text(
            //     'Contact Us',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.only(left: 15, top: 15, right: 10),
            //   child: const Text(
            //     "Have any questions or feedback? We're here to help! Reach out to our support team, and we'll get back to you as soon as possible.",
            //     style: TextStyle(fontSize: 16),
            //   ),
            // ),
            // Row(
            //   children: [
            //     const Padding(
            //       padding: EdgeInsets.all(8.0),
            //       child: Text(
            //         'Email:',
            //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //     TextButton(
            //       onPressed: () {},
            //       child: const Text('devdashapp@official.com', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
        size.width / 4,
        size.height - 40,
        size.width / 2,
        size.height - 20,
      )
      ..quadraticBezierTo(
          3 / 4 * size.width, size.height, size.width, size.height - 30)
      ..lineTo(size.width, 0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}