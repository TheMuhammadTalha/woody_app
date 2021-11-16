import 'package:flutter/material.dart';
import 'package:woody_app/splash_screen.dart';

import 'appointment_availability_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Lexend'),
    debugShowCheckedModeBanner: false,
    
    home: SplashScreen(),
    // home: HomePage(),
  ));
}
