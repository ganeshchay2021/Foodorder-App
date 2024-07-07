import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
//get instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    //try sign user in
    try {
      //sign user in
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    //catch any error
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

//sign up
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
    //try sign user in
    try {
      //sign user in
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    //catch any error
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

//signout
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
