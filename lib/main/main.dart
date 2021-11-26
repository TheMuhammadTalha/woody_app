import 'package:flutter/material.dart';
import 'package:woody_app/Screens/appointment_availability_page.dart';
import 'package:woody_app/Screens/appointment_availability_page_2.dart';
import 'package:woody_app/Screens/create_account_page.dart';
import 'package:woody_app/Screens/login_page.dart';
import 'package:woody_app/Screens/splash_screen.dart';
import 'package:woody_app/data.dart';
import '../Screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppData.initialize();
  runApp(MaterialApp(
    theme: ThemeData(
        fontFamily: 'Lexend',
        primaryColor: Color(0xff133a7c),
        accentColor: Color(0xff133a7c)),
    debugShowCheckedModeBanner: false,
    // routes: {
    //   '/': (context) => SplashScreen(),
    //   LogIn.pageName: (context) => LogIn(),
    //   CreateAccount.pageName: (context) => CreateAccount(),
    //   HomePage.pageName: (context) => HomePage(),
    //   Appointment.pageName: (context) => Appointment(),
    //   AppointmentDetails.pageName: (context) => AppointmentDetails(),
    // },
    home: SplashScreen(),
    // home: Appointment(),
    // home: HomePage(),
    // home: AppointmentDetails(),
  ));
}
