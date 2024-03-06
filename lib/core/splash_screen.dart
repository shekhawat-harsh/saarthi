import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sarthi/core/screen_binder.dart';
import 'package:sarthi/core/user_data_provider.dart';
import 'package:sarthi/services/firebase_services.dart';
import 'package:sarthi/services/firestore_services.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  Future<void> updateData(WidgetRef ref) async {
    String? email = FirebaseServices().getUserEmail();
    var userData = FirestoreServices().getUserByEmail(email!);
    ref.read(userDataProvider.notifier).state = await userData;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: updateData(ref),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return const ScreenBinder();
        }
      },
    );
  }
}
