import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sarthi/record_page/screen/privious_record_screen.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MaterialApp(home: PriviousRecord()));
}
