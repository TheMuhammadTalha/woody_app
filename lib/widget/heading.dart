import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../const.dart';

class Heading extends StatelessWidget {
  final label;

  Heading({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 8.0),
      child: Text(label,
          style: TextStyle(
            fontSize: 30.0,
            color: primaryColor,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}









