import 'package:flutter/material.dart';

class Paragraph extends StatelessWidget {
  final label, clr;

  Paragraph({Key? key, required this.label, required this.clr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.0,
          color: clr,
        ));
  }
}
