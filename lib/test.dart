import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestorePage extends StatefulWidget {
  @override
  _FirestorePageState createState() => _FirestorePageState();
}

class _FirestorePageState extends State<FirestorePage> {
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _addUser,
              child: Text('Add User'),
            ),
            ElevatedButton(
              onPressed: _getUsers,
              child: Text('Get Users'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _addUser() async {
    try {
      await usersCollection.add({
        'name': 'Jane Smith',
        'email': 'janesmith@example.com',
        'age': 25,
      });
      print('User added successfully.');
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  Future<void> _getUsers() async {
    try {
      QuerySnapshot querySnapshot = await usersCollection.get();
      querySnapshot.docs.forEach((doc) {
        print('User ID: ${doc.id}');
        print('Name: ${doc['name']}');
        print('Email: ${doc['email']}');
        print('Age: ${doc['age']}');
        print('---');
      });
    } catch (e) {
      print('Error getting users: $e');
    }
  }
}
