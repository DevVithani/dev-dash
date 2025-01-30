import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareApp extends StatelessWidget {
  const ShareApp({super.key});

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
              fontSize: 35,
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Share.share('com.example.dev_dash');
              },
              child: const Text('Share App'),
            ),
          ),
        ],
      ),
    );
  }
}
