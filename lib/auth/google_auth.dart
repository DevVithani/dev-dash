// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// class AuthenticationService {
//   final auth = FirebaseAuth.instance;
//   final googleLogin = GoogleSignIn();
//
//   signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleSignInAccount =
//       await googleLogin.signIn();
//       if (googleSignInAccount != null) {
//         final GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;
//         final AuthCredential authCredential = GoogleAuthProvider.credential(
//           accessToken: googleSignInAuthentication.accessToken,
//           idToken: googleSignInAuthentication.idToken,
//         );
//         await auth.signInWithCredential(authCredential);
//       }
//     } on FirebaseException catch (e) {
//       print('google error ${e.toString()}');
//     }
//   }
//
//   Future<void> signOut() async {
//     await googleLogin.signOut();
//   }
// }

