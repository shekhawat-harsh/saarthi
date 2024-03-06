import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sarthi/features/regester/screen/regester_page.dart';
import 'package:sarthi/features/signup/screen/signup_page.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;
  // String? password;
  String? email;

  @override
  initState() {
    super.initState();

    var user = FirebaseAuth.instance.currentUser!;
    isEmailVerified = user.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();
    }
    timer =
        Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      // Utils.showSnackBar(e.toString());
      print(e);
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    if (!mounted) return;
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: ((context) => Register())),
          (route) => false);
      timer?.cancel();
    }
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * .157),

                /// Email Image
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Image(
                      image: AssetImage("assets/images/email_black.png"),
                      width: 107,
                      height: 107,
                      // color: brightness ? Colors.white : Colors.black,
                      fit: BoxFit.contain),
                ),

                /// Verify Text
                Text(
                  'Verify your email address',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Divider(),

                const SizedBox(height: 17),

                /// Verify Text
                Text(
                  'Please confirm that you want to use this as your email address.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                /// Resent Button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 17.0),
                  child: Center(
                    child: SizedBox(
                      width: size.width,
                      height: size.height * .06,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            // splashFactory: NoSplash.splashFactory,
                            backgroundColor:
                                // brightness ? Colors.white : Colors.black,
                                (!canResendEmail) ? Colors.grey : Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0))),
                        onPressed: () async {
                          await sendVerificationEmail();
                        },
                        child: const Center(
                          child: SizedBox(
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "Resend",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),

                /// Cancel Button
                SizedBox(
                  width: size.width,
                  height: size.height * .05,
                  child: TextButton(
                    onPressed: (() async {
                      // await FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (ctx) => SignUp()));
                    }),
                    style: ElevatedButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                            side: const BorderSide(
                                color: Colors.white, width: .7))),
                    child: Text(
                      "cancel",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(fontFamily: 'NimbusRegular'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
