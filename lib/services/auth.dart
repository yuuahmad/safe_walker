// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:provider/provider.dart';

//  class AuthService {
//   final FirebaseAuth _firebaseAuth;
//   AuthService(this._firebaseAuth)

// _firebaseAuth.authStateChanges().listen((User? user) {
//     if (user == null) {
//       print('User is currently signed out!');
//     } else {
//       print('User is signed in!');
//     }
//   }) {
//   // TODO: implement listen
//   throw UnimplementedError();
//   }

//   Future<String?> signIn({required String email, required String password}) async {
// try{
//   await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
//   return "signIn";
// } on FirebaseAuthException catch (e){
//   return e.message!;
// }
//   }

//     Future<String?> signUp({required String email, required String password}) async {
// try{
//   await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
//   return "signIn";
// } on FirebaseAuthException catch (e){
//   return e.message!;
// }
//   }

//   // login dengan google
//   Future<void> _signInWithGoogle() async {
//     // Trigger the authentication flow
//     final googleUser = await GoogleSignIn().signIn();

//     // Obtain the auth details from the request
//     final googleAuth = await googleUser?.authentication;

//     if (googleAuth != null) {
//       // Create a new credential
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       // Once signed in, return the UserCredential
//       await auth.signInWithCredential(credential);
//     }
//   }



// }
