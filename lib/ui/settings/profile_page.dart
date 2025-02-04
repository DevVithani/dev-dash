import 'package:dev_dash/utils/snackbar_show.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
  String verificationId = '';
  String smsCode = '';
  String photoUrl = '';

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

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  Future<void> updateNumber() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String phoneNumber = _phoneController.text;

    if (user == null) {
      print('No user logged in.');
      return;
    }

    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await user.updatePhoneNumber(credential);
        snackbarShow(context, 'Phone number linked: ${user.phoneNumber}');
        print('Phone number linked: ${user.phoneNumber}');
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print('Auto-retrieval timeout: $verificationId');
      },
    );
  }

  Future<void> verifyOTP() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: _otpController.text,
    );

    user?.linkWithCredential(credential).then((UserCredential userCredential) {
      snackbarShow(context, 'Phone number Linked successfully');
      if (kDebugMode) {
        print(
            'Phone number successfully linked: ${userCredential.user?.phoneNumber}');
      }
    }).catchError((e) {
      showSnackbar(context, "Can't link your Mobile Number");
      print('Error linking phone number: $e');
    });
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
                          // _showPicker(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  prefixIcon: const Icon(Icons.abc),
                  labelText: 'Name: ${_user?.displayName}',
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),
                ),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 25),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.mail),
                  labelText: 'Email: ${_user?.email}',
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 25),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone),
                  hintText: _user?.phoneNumber,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),
                  suffixIcon: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: Colors.deepPurpleAccent,
                    ),
                    onPressed: () {
                      snackbarShow(context, 'Verification code sent');
                      updateNumber();
                    },
                    child: const Text(
                      'Send Code',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 25),
              TextField(
                controller: _otpController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.numbers),
                  labelText: 'Enter Code',
                  labelStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),
                  suffixIcon: SizedBox(
                    height: 10,
                    width: 90,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: Colors.deepPurpleAccent,
                      ),
                      onPressed: () {
                        verifyOTP();
                      },
                      child: const Text(
                        'Verify',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 65.0),
                child: Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        elevation: 5,
                        padding: const EdgeInsets.all(20),
                      ),
                      child: const Text(
                        'Save',
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
