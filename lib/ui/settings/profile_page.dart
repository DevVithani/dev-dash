import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? _user;
  String name = '';
  String email = '';
  String number = '';
  String photoUrl = '';
  bool _isPasswordVisible = true;

  @override
  void initState() {
    super.initState();
    _getUserDetails();
  }

  _getUserDetails() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _user = user;
        name = user.displayName ?? '';
        email = user.email ?? '';
        number = user.phoneNumber ?? '';
        photoUrl = user.photoURL ?? '';
      });
    }
  }

  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
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
        title: const Text(
          'Profile Page',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: photoUrl.isNotEmpty
                        ? NetworkImage(photoUrl)
                        : const NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-Z25aOD1KWgPXJyUdl0BTf_3du8oqoe0FOw&s',
                          ),
                  ),
                  Positioned(
                    bottom: 2,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: Colors.deepPurpleAccent,
                      child: IconButton(
                        icon: const Icon(
                          Icons.add_a_photo,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          pickImageCamera();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.abc),
                  labelText: 'Name',
                  hintText: _user?.displayName ?? 'Enter Your Name',
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),
                ),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.mail),
                  labelText: 'Email',
                  hintText: _user?.email ?? 'Enter your Email',
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone),
                  labelText: 'Mobile Number',
                  hintText: _user?.phoneNumber ?? 'Enter your Mobile Number',
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  labelText: 'Create Password',
                  hintText: 'Enter Your Password (Optional)',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                      size: 22,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                ),
                obscureText: !_isPasswordVisible,
                keyboardType: TextInputType.number,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        backgroundColor: Colors.deepPurpleAccent,
                        elevation: 5,
                        padding: const EdgeInsets.all(20),
                      ),
                      child: const Text(
                        'Complete Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
