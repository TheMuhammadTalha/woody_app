import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final label;

  TextWidget({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, bottom: 10.0),
      child: Text(
          label,
          style: TextStyle(
              fontSize: 18.0, color: Color(0xff133a7c).withOpacity(0.6))),
    );
  }
}
