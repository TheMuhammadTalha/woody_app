import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:woody_app/Screens/const.dart';
import 'package:woody_app/Screens/vehicle_input_page.dart';
import 'package:woody_app/api_models/login_model.dart';
import 'package:woody_app/demo/api_service.dart';
import 'package:woody_app/widget/app_button.dart';
import 'package:woody_app/widget/heading.dart';
import 'package:woody_app/widget/logo_image.dart';
import 'package:woody_app/widget/password_form_widget.dart';
import 'package:woody_app/widget/text_form_widget.dart';
import '../api_models/create_account_model.dart';

class CreateAccount extends StatefulWidget {
  static final pageName = '/create-account';

  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  void initState() {
    fName.text = 'talha1';
    lName.text = 'talha1';
    email.text = 'talha1@gmail.com';
    password.text = '12345678';
    phone.text = '123123123123';
    confirmPassword.text = '12345678';

    super.initState();
  }

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
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LogoImage(),
                Heading(label: 'Create an account'),
                TextFormWidget(
                  keyboard: TextInputType.text,
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
                  keyboard: TextInputType.text,
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
                  keyboard: TextInputType.emailAddress,
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
                  keyboard: TextInputType.phone,
                  validator: (String? value) {
                    if (value!.isEmpty)
                      return "cell phone number is required";
                    else if (value.length < 11) {
                      return "number must be greater than 11";
                    } else
                      return null;
                  },
                  hint: 'Cell phone number',
                  label: 'Cell phone number',
                  controller: phone,
                ),
                PasswordFormWidget(
                  passKeyboard: TextInputType.text,
                  hint: 'Password',
                  label: 'Password',
                  controller: password,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Password is required";
                    } else if (value.length < 6) {
                      return "Password must at-least 6 characters";
                    } else {
                      return null;
                    }
                  },
                ),
                PasswordFormWidget(
                  passKeyboard: TextInputType.text,
                  hint: 'Confirm password',
                  label: 'Confirm password',
                  controller: confirmPassword,
                  validator: (String? value) {
                    if (password.text != confirmPassword.text) {
                      return "Password does not match";
                    } else {
                      return null;
                    }
                  },
                ),
                AppButtonWidget(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                        height: 25,
                                        width: 25,
                                        child: CircularProgressIndicator()),
                                    Text("Creating Account..."),
                                  ],
                                ),
                              );
                            });
                        var person = await  APIService().post(
                            context,
                            'person',
                           CreateAccountModel(
                              username: email.text,
                              firstName: fName.text,
                              lastName: lName.text,
                              email: email.text,
                              password: password.text,
                              phone: phone.text,
                              role: '0',
                            ).toJson());
                        print(person);

                        var token = await APIService().post(
                            context,
                            'auth/sign-in',
                            LoginModel(
                                    username: email.text,
                                    password: password.text)
                                .toJson());

                        await APIService()
                            .setAccessToken(token['access_token']);
                        await APIService().setPersonID(person['_id']);

                        Navigator.pop(context);
                        Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => VehicleInput()));
                      } else
                        setState(() {});
                    },
                    label: 'Create Account'),
                SizedBox(
                  height: 10,
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        // style: DefaultTextStyle.of(context).style,
                        children: [
                          TextSpan(
                              text:
                                  "By creating your account, you're \n agreeing to the",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontFamily: 'Lexend')),
                          TextSpan(
                              text: " Terms and Conditions \n",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: primaryColor,
                                  fontFamily: 'Lexend')),
                          TextSpan(
                              text: "and",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontFamily: 'Lexend')),
                          TextSpan(
                              text: " Privacy Policy",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: primaryColor,
                                  fontFamily: 'Lexend')),
                        ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
