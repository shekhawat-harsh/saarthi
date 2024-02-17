import 'package:flutter/material.dart';

class Regester extends StatelessWidget {
  Regester({super.key});

  @override
  String? _name, _age, _gender, _contactNo, _address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: "Name"),
              onChanged: (value) {},
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Age"),
              onChanged: (value) {},
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Gender"),
              onChanged: (value) {},
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Contact No"),
              onChanged: (value) {},
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Address"),
              onChanged: (value) {},
            ),
            ElevatedButton(
              child: const Text("Register"),
              onPressed: () {
                // handle registration logic here
              },
            )
          ],
        ),
      ),
    );
  }
}
