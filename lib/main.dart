// Copyright 2021 The Etumed Bussiness Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

//import 'package:etumedbussiness/homepage.dart';
import 'package:etumedbussiness/pages/homepage.dart';
import 'package:etumedbussiness/pages/signup.dart';
import 'package:etumedbussiness/pages/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Requires that the Firebase Auth emulator is running locally
// e.g via `melos run firebase:emulator`.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.useEmulator('http://localhost:9099');
  runApp(AuthExampleApp());
}

/// The entry point of the application.
///
/// Returns a [MaterialApp].
class AuthExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Etumed App',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SignIn(),
      ),
      routes: {
//        "/homepage": (_) => HomePage(),
        '/signin': (_) => SignIn(),
        '/signup': (_) => SignUp(),
        '/main': (_) => HomePage(),
      },
    );
  }
}
