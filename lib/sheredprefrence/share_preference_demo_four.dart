import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceDemoFour extends StatefulWidget {
  const SharedPreferenceDemoFour({super.key});

  @override
  _SharedPreferenceDemoFourState createState() => _SharedPreferenceDemoFourState();
}

class _SharedPreferenceDemoFourState extends State<SharedPreferenceDemoFour> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _keepLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _loadLoginPreference();
  }

  _loadLoginPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('keepLoggedIn');
    if (isLoggedIn == true) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const Home(),
        ),
      );
    }
  }

  _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('keepLoggedIn', _keepLoggedIn);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const Home(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            Row(
              children: [
                SwitchListTile(
                  value: _keepLoggedIn,
                  onChanged: (bool? value) {
                    setState(() {
                      _keepLoggedIn = value!;
                    });
                  },
                ),
                const Text("Keep me login"),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white),
              onPressed: _login,
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: const Center(
        child: Text("Welcome!"),
      ),
    );
  }
}
