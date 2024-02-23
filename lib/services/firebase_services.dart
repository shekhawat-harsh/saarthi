import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sarthi/features/landing/screen/landing_page.dart';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> createAccount(
      String email, String password, BuildContext context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // showSnackbar(context, 'Account created successfully');
      return "Success";
    } catch (e) {
      // showSnackbar(context, e.toString());
      // showSnackBar(context, "Oops", e.toString(), ContentType.failure);
      return "Failed";
    }
  }

// To Do -> same as above
  Future<String> LogIn(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      //  showSnackbar(context, 'LogIn successfully');
      return "Success";
    } catch (e) {
      // showSnackbar(context, e.toString());
      print(e.toString());
      // showSnackBar(context, "Oops", e.toString(), ContentType.failure);
      return "Failed";
    }
  }

  Future<String> logOut(BuildContext context) async {
    try {
      await _auth.signOut().then((value) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => LandingPage()), (route) => false);
      });

      return "Success";
    } catch (e) {
      // showSnackbar(context, e.toString());
      return "Failed";
    }
  }
}
