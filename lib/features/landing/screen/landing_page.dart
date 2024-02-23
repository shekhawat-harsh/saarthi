import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sarthi/core/user_data_provider.dart';
import 'package:sarthi/features/landing/forget_password.dart';
import 'package:sarthi/features/profile/screen/profile_page.dart';
import 'package:sarthi/features/signup/page/signup_page.dart';
import 'package:sarthi/services/firebase_services.dart';
import 'package:sarthi/services/firestore_services.dart';

class LandingPage extends ConsumerWidget {
  LandingPage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to SAARTHI',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _emailController,
                  labelText: 'Email',
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 44,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Handle login logic here
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return const PopScope(
                                canPop: false,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            });

                        var res = await FirebaseServices().LogIn(
                            _emailController.text.trim(),
                            _passwordController.text.trim(),
                            context);
                        if (res == "Success") {
                          ref.read(userDataProvider.notifier).state =
                              await FirestoreServices()
                                  .getUserByEmail(_emailController.text.trim());

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfilePage(),
                              ),
                              (route) => false);
                        } else {
                          Navigator.pop(context);
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: const Text(
                      'Log in',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => const ForgotPassWord()));
                        },
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                ),
                const SizedBox(height: 5),
                const Text('Do not have a account ?'),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle register logic here
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => SignUp()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool isPassword = false,
  }) {
    return Card(
      elevation: 4, // Adjust elevation as needed
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        obscureText: isPassword,
      ),
    );
  }
}
