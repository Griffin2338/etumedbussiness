import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etumedbussiness/widgets/toaster.dart';
import 'package:flutter/material.dart';

class AddUser extends StatelessWidget {
  final String first_name;
  final String last_name;
  final String email;
  final String password;

  AddUser(this.first_name, this.last_name, this.email, this.password);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'first_name': first_name, // John Doe
            'last_name': last_name, // Stokes and Sons
            'email': email,
            'password': password,
            'department': 'Not given',
            'graduation_date': 'Not given',
            'is_admin': false
          })
          .then((value) => print('User Added'))
          .catchError((error) => () {
                print('Failed to add user: $error');
                showToast(context, 'Failed to add user: $error');
              });
    }

    return InkWell(
      onTap: addUser,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).accentColor.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
            ),
          ],
          color: Theme.of(context).accentColor,
        ),
        child: const Text(
          'SignUp',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
