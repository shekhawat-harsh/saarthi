import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:sarthi/features/landing_page/screen/landing_page.dart';

import 'package:sarthi/firebase_options.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    home: LandingPage(),
  ));
}
