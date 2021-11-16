import 'package:flutter/material.dart';
import 'package:woody_app/widget/logo_image.dart';
import 'package:woody_app/widget/paragraph.dart';

import 'const.dart';
import 'create_account_page.dart';
import 'login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogoImage(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text('Service My Woody',style: TextStyle(fontSize: 30.0,color: Colors.white,fontWeight: FontWeight.bold),),
            ),
            Paragraph(
              label:
                  'Welcome to the Woody Ford Service My Woody\u1d40\u1d39 mobile app.',
              clr: Colors.white,
            ),
            SizedBox(height: 20),
            Paragraph(
                label:
                    'Manage your Service appointments, schedule mobile appointments, and more.',
                clr: Colors.white),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CreateAccount()));
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0)),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        color: primaryColor.withOpacity(0.8),
                        fontWeight: FontWeight.bold),
                  ),
                )),
              ),
            ),
            SizedBox(height: 20.0),
            GestureDetector(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (content)=>LogIn()));
            },
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.white)),
                  child: Center(
                      child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text('Log in',
                              style: TextStyle(
                                color: Colors.white,
                              ))))),
            ),
          ],
        ),
      ),
    );
  }
}
