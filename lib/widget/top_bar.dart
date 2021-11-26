import 'package:flutter/material.dart';
class TopBar extends StatelessWidget {
  final String label;

  TopBar({Key? key, required this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Image.asset(
          'assets/images/woodyLogo.png',
          height: 50,
        ));
  }
}
