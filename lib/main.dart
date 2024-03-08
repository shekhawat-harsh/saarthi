import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sarthi/core/splash_screen.dart';
import 'package:sarthi/core/user_data_provider.dart';
import 'package:sarthi/features/landing/screen/landing_page.dart';
import 'package:sarthi/features/verify_email/verify_email_screen.dart';
import 'package:sarthi/firebase_options.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
var socket;
void main() async {
  Map<String, dynamic>? userData;
    print('--------------------connecting--------------------');
 
   socket =
      await Socket.connect('172.20.10.4', 8080); // Example socket connection
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // ErrorWidget.builder = (FlutterErrorDetails details) {
  //   return const Material(
  //     color: Colors.black,
  //     child: SizedBox(
  //       child: Center(
  //         child: Text(
  //           "OOPs!!, Some problem occurred...",
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //               color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),
  //         ),
  //       ),
  //     ),
  //   );
  // };
  runApp(ProviderScope(
    child: MaterialApp(
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(
                  color: Colors.black,
                );
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
                  final container = ProviderScope.containerOf(context);
                  container.read(userDataProvider.notifier).state = userData;

                  return const SplashScreen();
                } else {
                  return const VerifyEmail();
                }
              }
              return LandingPage();
            })),
  ));
}
