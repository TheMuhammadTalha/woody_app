import 'package:flutter/material.dart';
import 'package:woody_app/Screens/splash_screen.dart';
import '../Screens/appointment_availability_page.dart';
import '../Screens/appointment_availability_page_2.dart';
import '../Screens/home_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        fontFamily: 'Lexend',
        primaryColor: Color(0xff133a7c),
        accentColor: Color(0xff133a7c)),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    // home: Appointment(),
    // home: HomePage(),
    // home: AppointmentDetails(),

  ));
}
