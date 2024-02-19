import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 16.0),
              buildTextFieldWithIcon("Name", Icons.person, (value) {
                // Validation logic can be added here if needed
              }),
              const SizedBox(height: 16.0),
              buildTextFieldWithIcon("Age", Icons.calendar_today, (value) {
                // Validation logic can be added here if needed
              }),
              const SizedBox(height: 16.0),
              buildTextFieldWithIcon("Gender", Icons.person_outline, (value) {
                // Validation logic can be added here if needed
              }),
              const SizedBox(height: 16.0),
              buildTextFieldWithIcon("Contact No", Icons.phone, (value) {
                // Validation logic can be added here if needed
              }),
              const SizedBox(height: 16.0),
              buildTextFieldWithIcon("Address", Icons.location_on, (value) {
                // Validation logic can be added here if needed
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
                    "Register",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Handle registration logic here
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFieldWithIcon(
      String labelText, IconData icon, Function(String?) onChanged) {
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
