import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etumedbussiness/elements/user.dart';
import 'package:etumedbussiness/widgets/toaster.dart';
import 'package:flutter/material.dart';
import 'package:etumedbussiness/widgets/custombody.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  @override
  State createState() => SignInState();
}

class SignInState extends State<SignIn> {
  //String _contactText = '';

  TextEditingController emailctrl = TextEditingController();
  TextEditingController passctrl = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final usersRef = FirebaseFirestore.instance.collection('users').withConverter(
        fromFirestore: (snapshot, _) => EtuPerson.fromJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson(),
      );

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void initState() {
    super.initState();
    _changeUserID('');
  }

  Future<void> _changeUserID(String userID) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('userID', userID);
  }

  void disponse() {
    passctrl.dispose();
    emailctrl.dispose();
    super.dispose();
  }

  // ignore: avoid_void_async
  void showAlert(BuildContext context, TextEditingController email,
      TextEditingController passwd) async {
    //Put your code here which you want to execute on Yes button click.
    try {
      List<QueryDocumentSnapshot<EtuPerson?>> currentusers = await usersRef
          .where('email', isEqualTo: email.text)
          .get()
          .then((snapshot) => snapshot.docs);
      if (currentusers.isNotEmpty) {
        if (currentusers[0].get('password').toString().compareTo(passwd.text) ==
                0 &&
            currentusers[0].get('email').toString().compareTo(email.text) ==
                0) {
          await _changeUserID(currentusers[0].id);
          await Navigator.pushReplacementNamed(context, '/main');
        } else {
          showToast(context, 'Your password is not true, Check it...');
        }
      } else {
        showToast(context, 'There is no user with email "${email.text}"');
      }
    } catch (e) {
      showToast(context, 'Sign in Failed. Check your connection');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BaseBodyLayout(
        asset: 'assets/pattern.jpg',
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 1),
                      blurRadius: 2)
                ],
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[800],
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Center(
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: const BoxDecoration(
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
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: emailctrl,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter valid email id as abc@gmail.com',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: TextField(
                      obscureText: true,
                      controller: passctrl,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password',
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    child: TextButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: Colors.orangeAccent[600], fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showAlert(context, emailctrl, passctrl);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).accentColor.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                          ),
                        ],
                        color: Theme.of(context).accentColor,
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text('New User? Create Account'),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
