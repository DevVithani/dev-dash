import 'package:dev_dash/ui/login_page.dart';
import 'package:dev_dash/utils/snackbar_show.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var code = '';

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Color(0xFF7E57C2),
                // Colors.deepPurple
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                      width: double.infinity,
                      height: 350,
                      color: const Color(0xFF7E57C2),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 55, top: 175),
                    child: const Text(
                      'Verification',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 165),
                        margin: const EdgeInsets.only(
                          top: 200,
                          left: 25,
                          right: 25,
                        ),
                        child: Pinput(
                          length: 6,
                          onChanged: (value) {
                            code = value;
                          },
                          showCursor: true,
                          onCompleted: (pin) => print('OTP $pin'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(25),
                        margin: const EdgeInsets.only(left: 50, right: 50),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(15),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: () async {
                            try {
                              PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                verificationId: LoginPage.verify,
                                smsCode: code,
                              );
                              await auth.signInWithCredential(credential);
                              Navigator.pushNamedAndRemoveUntil(
                                  context, 'home', (route) => false);
                              snackbarShow(context, 'Login Successful');
                            } catch (e) {
                              showSnackbar(context, 'Invalid Code');
                            }
                          },
                          child: const Text(
                            'Verify',
                            style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Resend Code',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}