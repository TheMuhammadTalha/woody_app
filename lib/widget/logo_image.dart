import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/woodyLogo.png',
      height: 80.0,
    );
  }
}
