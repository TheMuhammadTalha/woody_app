import 'package:flutter/material.dart';
import 'package:woody_app/widget/app_button.dart';
import 'package:woody_app/widget/heading.dart';
import 'package:woody_app/widget/logo_image.dart';
import 'package:woody_app/widget/password_form_widget.dart';
import 'package:woody_app/widget/text_form_widget.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  var fName = TextEditingController();
  var lName = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LogoImage(),
                Heading(label: 'Create an account'),
                TextFormWidget(
                  validator: (String? value) {
                    if (value!.isEmpty)
                      return "First name is required";
                    else
                      return null;
                  },
                  hint: 'First name',
                  label: 'First name',
                  controller: fName,
                ),
                TextFormWidget(
                  validator: (String? value) {
                    if (value!.isEmpty)
                      return "Last name is required";
                    else
                      return null;
                  },
                  hint: 'Last name',
                  label: 'Last name',
                  controller: lName,
                ),
                TextFormWidget(
                  validator: (String? value) {
                    if (value!.isEmpty)
                      return "email is required";
                    else
                      return null;
                  },
                  hint: 'Email address',
                  label: 'Email address',
                  controller: email,
                ),
                TextFormWidget(
                  validator: (String? value) {
                    if (value!.isEmpty)
                      return "cell phone number is required";
                    else if(value.length<4)
                      {
                        return null;
                      }
                    else
                      return null;
                  },
                  hint: 'Cell phone number',
                  label: 'Cell phone number',
                  controller: phone,
                ),
                PasswordFormWidget(
                  hint: 'Password',
                  label: 'Password',
                  controller: password,
                  validator: (String? value) {},
                ),
                PasswordFormWidget(
                  hint: 'Confirm password',
                  label: 'Confirm password',
                  controller: confirmPassword,
                  validator: (String? value) {},
                ),
                AppButtonWidget(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        print('validate');
                      } else
                        setState(() {});
                    },
                    label: 'Create Account'),
                Text("By creating your account, you're agreeing to the"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
