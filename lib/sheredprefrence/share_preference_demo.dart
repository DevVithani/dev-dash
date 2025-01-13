import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceDemo extends StatefulWidget {
  const SharePreferenceDemo({super.key});

  @override
  State<SharePreferenceDemo> createState() => _SharePreferenceDemoState();
}

class _SharePreferenceDemoState extends State<SharePreferenceDemo> {

  late String _userName;
  late bool _rememberMe;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  void _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? '';
      _rememberMe = prefs.getBool('RememberMe') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'Shared Preference',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your Username',
              ),
              onChanged: (value) {
                setState(() {
                  _userName = value;
                });
              },
            ),
            SwitchListTile(activeTrackColor: Colors.orange,activeColor: Colors.white,
              title: const Text('Remember Me'),
              value: _rememberMe,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: ElevatedButton(
                child: const Text('Save'),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString('username', _userName);
                  prefs.setBool('RememberMe', _rememberMe);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
