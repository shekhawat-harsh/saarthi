import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sarthi/features/landing/screen/landing_page.dart';
import 'package:sarthi/features/profile/screen/profile_page.dart';
import 'package:sarthi/features/record/screen/privious_record_screen.dart';
import 'package:sarthi/features/verify_email/verify_email_screen.dart';
import 'package:sarthi/firebase_options.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MaterialApp(home: PriviousRecord()));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return const Material(
      color: Colors.black,
      child: SizedBox(
        child: Center(
          child: Text(
            "OOPs!!, Some problem occurred...",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),
          ),
        ),
      ),
    );
  };
  runApp(MaterialApp(
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Something went wrong !!!"),
              );
            } else if (snapshot.hasData) {
              bool isemailVerified =
                  FirebaseAuth.instance.currentUser!.emailVerified;

              print(isemailVerified);
              print(FirebaseAuth.instance.currentUser!.email);

              if (isemailVerified) {
                return const ProfilePage();
              } else {
                return const VerifyEmail();
              }
            }
            return LandingPage();
          })));
}
