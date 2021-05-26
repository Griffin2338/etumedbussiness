import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:etumedbussiness/pages/edit_profile.dart';

/// Entrypoint example for various sign-in flows with Firebase.
class ProfilePage extends StatefulWidget {
  /// The page title.
  final String title = 'Edit & View Your Profile';

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context) /*!*/ .push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        title: Text(widget.title),
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('https://i.ibb.co/1RBt4sf/bg.jpg'),
                    fit: BoxFit.cover)),
            child: Container(
              width: double.infinity,
              height: 200,
              child: Container(
                alignment: const Alignment(0, 2.5),
                child: const CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://i.ibb.co/N7vn6QZ/indir.jpg'),
                  radius: 60,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          const Text(
            'Mesut Ozil',
            style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                letterSpacing: 2,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Istanbul, Turkey',
            style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
                letterSpacing: 2,
                fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Software Developer at SuperGame LLC.',
            style: TextStyle(
                fontSize: 15,
                color: Colors.white60,
                letterSpacing: 2,
                fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child:  Column(
                      children: <Widget>[
                        const Text(
                          'Project',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text(
                          '15',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Followers',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text(
                          '2000',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          RaisedButton(
            onPressed: () {
              _pushPage(context, EditProfilePage());
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80),
            ),
            child: Ink(
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 100,
                  maxHeight: 40,
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
