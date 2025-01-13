import 'package:country_picker/country_picker.dart';
import 'package:dev_dash/utils/snackbar_show.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String verify = '';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController countryCode = TextEditingController();

  String phone = '';

  @override
  void initState() {
    countryCode.text = "+91";
    super.initState();
  }

  Country country = Country(
    phoneCode: '91',
    countryCode: 'IN',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'India',
    example: 'India',
    displayName: 'India',
    displayNameNoCountryCode: 'IN',
    e164Key: '',
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              tileMode: TileMode.mirror,
              colors: [
                Color(0xFFAF9DDB),
                Color(0xFF8A7DDD),
              ],
            ),
          ),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF7E57C2),
                              Color(0xFFAF9DDB),
                            ],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                          ),
                        ),
                        width: double.infinity,
                        height: 350,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 55, top: 85),
                      child: const Text(
                        'Hello.',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 150, left: 32),
                            margin: const EdgeInsets.only(bottom: 10),
                            child: const Text(
                              "Let's Get Started",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 200,
                              bottom: 30,
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                  child: TextField(
                                    decoration: const InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.all(10),
                                    ),
                                    controller: countryCode,
                                    keyboardType: TextInputType.phone,
                                    style: const TextStyle(
                                      color: Colors.deepPurpleAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Center(
                                    child: TextField(
                                      decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        contentPadding: EdgeInsets.all(10),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                        hintText: 'Enter your Mobile Number',
                                        // labelText: 'Mobile Number',
                                        hintStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepPurpleAccent,
                                          fontSize: 16,
                                        ),
                                      ),
                                      expands: false,
                                      cursorColor: Colors.blueAccent,
                                      onChanged: (value) {
                                        phone = value;
                                      },
                                      keyboardType: TextInputType.phone,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: SizedBox(
                              // margin: const EdgeInsets.only(left: 96),
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  backgroundColor: Colors.blue,
                                  elevation: 5,
                                  padding: const EdgeInsets.all(15),
                                ),
                                onPressed: () async {
                                  snackbarShow(
                                    context,
                                    'Verification code sent Successfully',
                                  );
                                  await FirebaseAuth.instance.verifyPhoneNumber(
                                    timeout: const Duration(seconds: 60),
                                    phoneNumber: countryCode.text + phone,
                                    verificationCompleted:
                                        (PhoneAuthCredential credential) {},
                                    verificationFailed: (e) {
                                      print('Error: $e');
                                      if (e.code == 'invalid-phone-number') {
                                        showSnackbar(context,
                                            'Provided number is Invalid');
                                      } else if (e.code ==
                                          'network-request-failed') {
                                        showSnackbar(context,
                                            'Network Error: Please check your Internet Connection');
                                      } else {
                                        showSnackbar(context,
                                            'Something went wrong, try again later');
                                      }
                                    },
                                    codeSent: (String verificationId,
                                        int? resendToken) {
                                      LoginPage.verify = verificationId;
                                      Navigator.pushNamed(context, 'OtpPage');
                                    },
                                    codeAutoRetrievalTimeout:
                                        (String verificationId) {},
                                  );
                                  Navigator.pushNamed(context, 'verify');
                                },
                                child: const Text(
                                  "Verify Number",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          const Center(
                            child: Text(
                              'OR',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.double,
                                decorationColor: Colors.deepPurpleAccent,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  elevation: 5,
                                  padding: const EdgeInsets.all(10),
                                ),
                                onPressed: () async {
                                  var result = await signInWithGoogle();
                                  if (result != null && context.mounted) {
                                    snackbarShow(context, 'Login Successful');
                                    Navigator.pushReplacementNamed(
                                        context, "home");
                                  }
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 35),
                                      child: Image.asset(
                                        'assets/google.png',
                                        height: 30,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 45),
                                      child: const Text(
                                        'Sign In with Google',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.deepPurpleAccent,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  signInWithGoogle() async {
    await GoogleSignIn().signOut();
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    try {
      GoogleSignInAuthentication? auth = await googleUser?.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: auth?.accessToken,
        idToken: auth?.idToken,
      );
      UserCredential userCred =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return userCred.user;
    } catch (e) {
      if (googleUser == null) {
        print('error $e');
        showSnackbar(context, 'SignIn cancel by the user');
      } else {
        showSnackbar(context, 'Something went Wrong! Try again later');
      }
    }
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
