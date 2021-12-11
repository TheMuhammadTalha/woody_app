import 'package:flutter/material.dart';
import 'package:woody_app/Screens/home_page.dart';
import 'package:woody_app/Screens/splash_screen.dart';
import 'package:woody_app/data.dart';
import 'package:woody_app/demo/api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _id = await APIService().getPersonID();
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
    // home: SplashScreen(),
    home:( _id?.isNotEmpty ?? false )? HomePage() : SplashScreen(),
    // home: Appointment(),
    // home: HomePage(),
    // home: AppointmentDetails(),
  ));
}
