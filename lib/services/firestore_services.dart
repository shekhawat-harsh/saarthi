import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");

  Future<void> addUsersData(String name, String age, String gender,
      String contactNo, String address) {
    return users.add({
      "Name": name,
      "Age": age,
      "Gender": gender,
      "ContactNo": contactNo,
      "Address": address,
      "timestamp": Timestamp.now(),
    });
  }
}
