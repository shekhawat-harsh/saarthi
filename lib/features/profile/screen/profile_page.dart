import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
                width: double.infinity,
                child: CircleAvatar(
                  radius: 80,
                )),
            const SizedBox(height: 16.0),
            const Text(
              "Name",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            buildTextFieldWithIcon("Name", Icons.person, (value) {
              // Validation logic can be added here if needed
            }),
            const SizedBox(height: 16.0),
            const Text(
              "Age",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            buildTextFieldWithIcon("Age", Icons.calendar_today, (value) {
              // Validation logic can be added here if needed
            }),
            const SizedBox(height: 16.0),
            const Text(
              "Gender",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            buildTextFieldWithIcon("Gender", Icons.person_outline, (value) {
              // Validation logic can be added here if needed
            }),
            const SizedBox(height: 16.0),
            const Text(
              "Contact No",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            buildTextFieldWithIcon("Contact No", Icons.phone, (value) {
              // Validation logic can be added here if needed
            }),
            const SizedBox(height: 16.0),
            const Text(
              "Address",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            buildTextFieldWithIcon("Address", Icons.location_on, (value) {
              // Validation logic can be added here if needed
            }),
            const SizedBox(height: 32.0),
          ],
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
        child: SizedBox(
          height: 55,
          child: Row(
            children: [
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  labelText,
                  style: const TextStyle(
                      color: Colors.black), // Set text color to black
                ),
              ),
              Icon(icon),
            ],
          ),
        ),
      ),
    );
  }
}
