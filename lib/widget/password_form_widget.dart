import 'package:flutter/material.dart';

import '../Screens/const.dart';

class PasswordFormWidget extends StatefulWidget {
  String hint;
  String label;
  TextInputType passKeyboard;
  TextEditingController controller;

  FormFieldValidator<String> validator;

  PasswordFormWidget({
    Key? key,
    required this.hint,
    required this.label,
    required this.passKeyboard,
    required this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  _PasswordFormWidgetState createState() => _PasswordFormWidgetState();
}
class _PasswordFormWidgetState extends State<PasswordFormWidget> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        keyboardType: widget.passKeyboard,
        obscureText: obscure,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(

            focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            labelStyle: TextStyle(color: primaryColor),
            hintText: widget.hint,
            labelText: widget.label,
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    obscure = !obscure;print(obscure);
                  });
                },
                child:
                obscure ? Icon(Icons.visibility) : Icon(Icons.visibility_off)),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      ),
    );
  }
}
