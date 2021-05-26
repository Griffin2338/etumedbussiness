import 'package:etumedbussiness/firebase/firestore.dart';
import 'package:etumedbussiness/widgets/toaster.dart';
import 'package:flutter/material.dart';
import 'package:etumedbussiness/widgets/custombody.dart';

class SignUp extends StatefulWidget {
  @override
  State createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  TextEditingController fnamectrl = TextEditingController();
  TextEditingController lnamectrl = TextEditingController();
  TextEditingController emailctrl = TextEditingController();
  TextEditingController passctrl = TextEditingController();
  TextEditingController pass2ctrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    fnamectrl.dispose();
    lnamectrl.dispose();
    emailctrl.dispose();
    passctrl.dispose();
    pass2ctrl.dispose();
    super.dispose();
  }

  void showAlert(
      BuildContext context,
      TextEditingController fname,
      TextEditingController lname,
      TextEditingController email,
      TextEditingController passwd) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sign Up Confirmation'),
          content: Text('Are You Sure Want To Proceed ?'),
          actions: <Widget>[
            FlatButton(
              child: Text('YES'),
              onPressed: () async {
                //Put your code here which you want to execute on Yes button click.
                bool result = await AddUser(
                        fname.text, lname.text, email.text, passwd.text)
                    .addUser(context);
                if (result == true) {
                  Navigator.of(context).pop();
                  showToast(context, 'User Created Successfully. You can go to sign in and sign using credentials');
                } else {
                  Navigator.of(context).pop();
                  showToast(context, 'User Creation Failed. Check given credentials');
                }
              },
            ),
            FlatButton(
              child: Text('NO'),
              onPressed: () {
                //Put your code here which you want to execute on No button click.
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () {
                //Put your code here which you want to execute on Cancel button click.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

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
                    padding: const EdgeInsets.only(top: 16, bottom: 20),
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
                    padding:
                        const EdgeInsets.only(right: 15, left: 15, top: 15),
                    child: TextField(
                      controller: fnamectrl,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        hintText: 'Please give your first name',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 15, left: 15, top: 15),
                    child: TextField(
                      controller: lnamectrl,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Surname',
                        hintText: 'Please give your surname.',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 15, left: 15, top: 15),
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
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 15, bottom: 20),
                    child: TextField(
                      obscureText: true,
                      controller: pass2ctrl,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Again Password',
                        hintText: 'Enter secure password',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showAlert(
                          context, fnamectrl, lnamectrl, emailctrl, passctrl);
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
                        'Sign up',
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
                        Navigator.pushNamed(context, '/signin');
                      },
                      child: const Text('Already have account? Sign in')),
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
