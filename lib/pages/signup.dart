import 'package:etumedbussiness/firebase/firestore.dart';
import 'package:flutter/material.dart';
import 'package:etumedbussiness/widgets/custombody.dart';

class SignUp extends StatefulWidget {
  @override
  State createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  //String _contactText = '';
  late TextEditingController fnamectrl;
  late TextEditingController lnamectrl;
  late TextEditingController emailctrl;
  late TextEditingController passctrl;
  late TextEditingController pass2ctrl;

  @override
  void initState() {
    super.initState();
    fnamectrl = TextEditingController();
    lnamectrl = TextEditingController();
    emailctrl = TextEditingController();
    passctrl = TextEditingController();
    pass2ctrl = TextEditingController();
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
                    padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
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
                    padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
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
                    padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
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
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
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
                  AddUser(fnamectrl.text, lnamectrl.text, emailctrl.text,
                      passctrl.text),
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
