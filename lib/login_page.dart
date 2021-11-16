import 'package:flutter/material.dart';
import 'package:woody_app/reset_password_page.dart';
import 'package:woody_app/widget/text_field.dart';

import 'const.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var email = TextEditingController();
  var password = TextEditingController();
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  LogoImage(),
                  Heading(label: 'Log in'),
                  TextFormWidget(
                    validator: (String? value) {
                      if (value!.isEmpty)
                        return "Email is required";
                      else
                        return null;
                    },
                    hint: 'Email address',
                    label: 'Email address',
                    controller: email,
                  ),
                  PasswordFormWidget(
                    // validator: (String? value) {
                    //   if (value!.isEmpty)
                    //     return "Password required";
                    //   else
                    //     return null;
                    // },
                    hint: 'Password',
                    label: 'Password',
                    controller: password, validator: (String? value) {},
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetPassword()));
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: primaryColor.withOpacity(0.8)),
                      )),
                  SizedBox(height: 180),
                  AppButtonWidget(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          print('validate');
                        } else {
                          setState(() {
                            autoValidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                      label: 'Sign in'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
