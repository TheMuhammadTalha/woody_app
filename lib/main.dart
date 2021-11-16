import 'package:flutter/material.dart';
import 'package:woddy_app/home_page.dart';
import 'package:woddy_app/splash_screen.dart';

import 'appointment_availability_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Lexend'),
    home: SplashScreen(),
    // home: HomePage(),
  ));
}
