import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceDemoFive extends StatefulWidget {
  const SharePreferenceDemoFive({super.key});

  @override
  State<SharePreferenceDemoFive> createState() => _SharePreferenceDemoFiveState();
}

class _SharePreferenceDemoFiveState extends State<SharePreferenceDemoFive> {
  static const doubleSharedPreference = 'Double SharedPreference';
  SharedPreferences? prefs;

  // static Future setDouble() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.setDouble(doubleSharedPreference, 9.65);
  // }
  //
  // static Future getDouble() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getDouble(doubleSharedPreference) ?? 0.0;
  // }

  @override
  void initState() {
    super.initState();
    getValue();
  }

  // ? (optional means value can be null)
  // ! (not null - means value is not null)
  // ?? (default value)
  // ??=

  // Map<String,int?>? map;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   map = {
  //     'dixit':1,
  //     'nilesh': 2,
  //     'dev': 3,
  //   };
  //
  //   String name = map?['chandresh']?.toString() ?? 'unknown';
  //
  //   // output when map null = unknown
  //   // output when value is null = unknown
  // }

  // null
  // String? name = 'dev';
  // Map? map = { key : value}

  // Map? map = null
  // name = map?['name']; // output null
  // name = map?['name'] ?? 'Unknown'; // output Unknown

  // Map map ={ "name": null}
  // name = map['name']!; // output exception

  // Map map ={ "name": null}
  // name = map['name'] ?? 'Unknown'; // output unknown

  // Map map = {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text(
          'Share Preference',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              prefs?.setDouble(doubleSharedPreference, 9.65);
            },
            child: Builder(builder: (context) {
              return Center(
                child: Text("${(prefs?.getDouble(doubleSharedPreference) ?? 0.0)}"),
              );
            }),
          ),
          // Text(doubleValue),
        ],
      ),
    );
  }

  void getValue() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {});
  }
}
