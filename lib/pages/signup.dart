import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:etumedbussiness/widgets/custombody.dart';

class SignUp extends StatefulWidget {
  @override
  State createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  String _contactText = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BaseBodyLayout(
        asset: 'assets/pattern.jpg',
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 1),
                    blurRadius: 2.0)
              ],
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.grey[800],
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom:20),
                  child: Center(
                    child: Container(
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/etu_med_logo.png'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right:15.0 ,left: 15.0, top: 15, bottom: 0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      hintText: 'Please give your name',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right:15.0 ,left: 15.0, top: 15, bottom: 0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Surname',
                      hintText: 'Please give your surname.',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right:15.0 ,left: 15.0, top: 15, bottom: 0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15.0, bottom: 0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Again Password',
                      hintText: 'Enter secure password',
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    //print("click");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).accentColor.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 0),
                        ),
                      ],
                      color: Theme.of(context).accentColor,
                    ),
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/signin");
                    },
                    child: Text("Already have account? Sign in")),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
