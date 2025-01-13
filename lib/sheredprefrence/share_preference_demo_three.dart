import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceDemoThree extends StatefulWidget {
  const SharePreferenceDemoThree({super.key});

  @override
  State<SharePreferenceDemoThree> createState() => _SharePreferenceDemoThreeState();
}

class _SharePreferenceDemoThreeState extends State<SharePreferenceDemoThree> {
  var nameController = TextEditingController();

  static const String keyName = "name";
  var nameValue = "No value Saved";

  @override
  void initState() {
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Shared Preference',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Center(
          child: SizedBox(
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    label: const Text('Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                  controller: nameController,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: ElevatedButton(
                    onPressed: () async {
                      var prefs = await SharedPreferences.getInstance();

                      prefs.setString(keyName, nameController.text.toString());
                    },
                    child: const Text('Save'),
                  ),
                ),
                const SizedBox(height: 11),
                Text(nameValue),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();
    var getName = prefs.getString(keyName);
    nameValue = getName ?? "No value Saved";

    setState(() {});
  }
}
