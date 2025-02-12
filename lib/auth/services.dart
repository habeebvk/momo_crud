

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices{
  final _auth = FirebaseAuth.instance;

  Future<User?> createUserWithEmailAndPassword(String email,String password) async {
    try {
         final credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
         return credential.user;
    } catch (e) {
      print("Something went wrong");
    }
  }

  Future<User?> loginUserWithEmailAndPassword(String email,String password) async {
    try {
         final credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return credential.user;
    } catch (e) {
      print("Something went wrong");
    }
  }

  Future<void> signout() async{
    try {
      await _auth.signOut();
    } catch (e) {
      print("Something went wrong");
    }
  }

  Future<void> sendPasswordResetLink(String email) async{
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
     print(e.toString()); 
    }
  }
}