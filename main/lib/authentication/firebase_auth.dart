import 'package:firebase_auth/firebase_auth.dart';
import 'package:basic/toast.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> emailAndPassSignUp(String email, String password) async {

    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email : email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {

      if (e.code == 'email-already-in-use') {
        showToast(message: "The email is already in use.");
      } else {
        showToast(message: "An error occurred: ${e.code}");
      }
      
    }
    return null;
  }

  Future<User?> emailAndPassSignIn(String email, String password) async {

    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email : email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
         if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showToast(message: 'Invalid email or password.');
      } else {
        showToast(message: 'An error occurred: ${e.code}');
      }
    }
    return null;
  }

}

