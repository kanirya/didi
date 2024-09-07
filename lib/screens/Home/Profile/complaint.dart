import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class DataStorageScreen extends StatelessWidget {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store Data to Firebase'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _storeData, // Call the function to store data
          child: Text('Store Data to Firebase'),
        ),
      ),
    );
  }

  // Function to store data
  void _storeData() async {
    // Creating a unique ID
    String id = _database.child("users").push().key!;

    // Create data to store
    Map<String, dynamic> data = {
      "id": id,
      "name": "John Doe",
      "email": "john.doe@example.com",
      "phone": "+123456789",
    };

    // Store data at the path `users/id`
    await _database.child("users/$id").set(data).then((_) {
      print("Data stored successfully!");
    }).catchError((error) {
      print("Failed to store data: $error");
    });
  }
}
