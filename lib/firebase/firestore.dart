import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etumedbussiness/widgets/toaster.dart';
import 'package:flutter/material.dart';

class AddUser {
  final String first_name;
  final String last_name;
  final String email;
  final String password;

  AddUser(this.first_name, this.last_name, this.email, this.password);
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<bool> addUser(BuildContext context) async {
    // Call the user's CollectionReference to add a new user
    var deger = 0;
    await users
        .add({
          'first_name': first_name, // John Doe
          'last_name': last_name, // Stokes and Sons
          'email': email,
          'password': password,
          'department': 'Not given',
          'graduation_date': 'Not given',
          'is_admin': false
        })
        .then((value) => () {
              debugPrint('user created');
              deger = 1;
            })
        .catchError((error) => () {
              debugPrint('user not created');
              deger = 0;
          });
          
    if (deger == 0) {
      return false;
    } else {
      return true;
    }
  }
}
