import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:EtumedBusiness/auth/register/register.dart';
import 'package:EtumedBusiness/components/password_text_field.dart';
import 'package:EtumedBusiness/components/text_form_builder.dart';
import 'package:EtumedBusiness/utils/validation.dart';
import 'package:EtumedBusiness/view_models/auth/login_view_model.dart';
import 'package:EtumedBusiness/widgets/indicators.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = Provider.of<LoginViewModel>(context);

    return ModalProgressHUD(
      progressIndicator: circularProgress(context),
      inAsyncCall: viewModel.loading,
      child: Scaffold(
        backgroundColor: Colors.white,
        key: viewModel.scaffoldKey,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end:
              Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
              colors: [Colors.red, Colors.black],
              tileMode: TileMode.repeated, // repeats the gradient over the canvas
            ),
          ),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            children: [
              SizedBox(height: 60.0),
              Container(
                height: 170.0,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/etu_med_logo.png',
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Log into your account and get started!',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              buildForm(context, viewModel),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(CupertinoPageRoute(builder: (_) => Register()));
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.deepPurple,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildForm(BuildContext context, LoginViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormBuilder(
            enabled: !viewModel.loading,
            prefix: Feather.mail,
            hintText: "Email",
            textInputAction: TextInputAction.next,
            validateFunction: Validations.validateEmail,
            onSaved: (String val) {
              viewModel.setEmail(val);
            },
            focusNode: viewModel.emailFN,
            nextFocusNode: viewModel.passFN,
          ),
          SizedBox(height: 15.0),
          PasswordFormBuilder(
            enabled: !viewModel.loading,
            prefix: Feather.lock,
            suffix: Feather.eye,
            hintText: "Password",
            textInputAction: TextInputAction.done,
            validateFunction: Validations.validatePassword,
            submitAction: () => viewModel.login(context),
            obscureText: true,
            onSaved: (String val) {
              viewModel.setPassword(val);
            },
            focusNode: viewModel.passFN,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: InkWell(
                onTap: () => viewModel.forgotPassword(),
                child: Container(
                  width: 130,
                  height: 40,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ), 
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            height: 45.0,
            width: 180.0,
            child: RaisedButton(
              highlightElevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              color: Colors.indigo,
              child: Text(
                'Log in'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () => viewModel.login(context),
            ),
          ),
        ],
      ),
    );
  }
}
