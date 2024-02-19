import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_picture.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'Mukesh',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              '20',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Male',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '1234567890',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
