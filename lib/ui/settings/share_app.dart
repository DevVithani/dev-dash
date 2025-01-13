import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareApp extends StatelessWidget {
  const ShareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          "Share App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Image.asset('assets/share_app.jpg'),
          const Text(
            'Share App',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Invite friends and both boost your flutter skills',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const Text('Share to your friends by using this: '),
          ElevatedButton(
            onPressed: () {
              Share.share('com.example.dev_dash');
            },
            child: const Text('Share App'),
          ),
        ],
      ),
    );
  }
}
