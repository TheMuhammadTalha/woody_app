import 'package:flutter/material.dart';

import '../Screens/const.dart';

class TextFormWidget2 extends StatelessWidget {
  final String hint;
  final String label;
  TextEditingController controller;
  FormFieldValidator<String?> validator;
  TextInputType? keyboard;

  TextFormWidget2(
      {Key? key,
        required this.hint,
        required this.label,
        this.keyboard,
        required this.validator,
        required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        keyboardType: keyboard,
        validator: validator,
        decoration: InputDecoration(
            focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            hintText: hint,
            // hintStyle: TextStyle(color: primaryColor),
            labelText: label,
            labelStyle: TextStyle(color: primaryColor.withOpacity(0.6)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
                ),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      ),
    );
  }
}
