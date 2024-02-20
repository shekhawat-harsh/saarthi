import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sarthi/features/signup_page/page/signup_page.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(MaterialApp(
    home: SignUp(),
  ));
}
