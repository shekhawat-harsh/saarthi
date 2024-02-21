import 'package:flutter/material.dart';
import 'package:sarthi/features/landing_page/screen/landing_page.dart';
import 'package:sarthi/features/verify_email/verify_email_screen.dart';
import 'package:sarthi/services/firebase_services.dart';

class SignUp extends StatelessWidget {
  SignUp({
    super.key,
  });
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;
  late String _confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 64.0),
              buildTextFieldWithIcon("Email", Icons.email, (value) {
                _email = value!;
              }, (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email';
                }
                // Basic email format check
                if (!value.contains('@') || !value.contains('.')) {
                  return 'Please enter a valid email';
                }
                return null;
              }),
              const SizedBox(height: 16.0),
              buildPasswordFieldWithIcon("Password", Icons.lock, (value) {
                _password = value!;
              }, (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                if (value.length < 6) {
                  return "Password length can not be less than 6";
                }
                return null;
              }),
              const SizedBox(height: 16.0),
              buildPasswordFieldWithIcon("Confirm Password", Icons.lock,
                  (value) {
                _confirmPassword = value!;
              }, (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password password';
                }
                if (value != _password) {
                  return 'Passwords do not match';
                }
                return null;
              }),
              const SizedBox(height: 32.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.all(16.0),
                    ),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Handle sign up logic here
                      // You can access _email and _password variables here
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return PopScope(
                              canPop: false,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          });
                      var email = _email.trim();
                      print("email - $email");

                      var res = await FirebaseServices()
                          .createAccount(email, _password.trim(), context);
                      if (res == "Success") {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const VerifyEmail()),
                            (route) => false);
                      } else
                        Navigator.pop(context);
                    }
                  },
                ),
              ),
              const SizedBox(height: 5),
              const Text('Already have an account ?'),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle register logic here
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => LandingPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text(
                    'LogIn',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFieldWithIcon(String labelText, IconData icon,
      Function(String?) onChanged, String? Function(String?)? validator) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Set background color to white
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            const SizedBox(width: 8.0),
            Expanded(
              child: TextFormField(
                style: const TextStyle(
                    color: Colors.black), // Set text color to black
                decoration: InputDecoration(
                  labelText: labelText,
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                onChanged: onChanged,
                validator: validator,
              ),
            ),
            Icon(icon),
          ],
        ),
      ),
    );
  }

  Widget buildPasswordFieldWithIcon(String labelText, IconData icon,
      Function(String?) onChanged, String? Function(String?)? validator) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Set background color to white
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            const SizedBox(width: 8.0),
            Expanded(
              child: TextFormField(
                style: const TextStyle(
                    color: Colors.black), // Set text color to black
                decoration: InputDecoration(
                  labelText: labelText,
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                obscureText: true,
                onChanged: onChanged,
                validator: validator,
              ),
            ),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
