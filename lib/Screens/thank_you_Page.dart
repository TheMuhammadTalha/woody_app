import 'package:flutter/material.dart';
import 'package:woody_app/Screens/const.dart';
import 'package:woody_app/widget/medium_container.dart';

class ThanksPage extends StatelessWidget {
  const ThanksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 25),
        child: Column(
          children: [
            Text('John, thanks for requesting an appointment.',
                style: TextStyle(
                  fontSize: 30.0,
                  color: primaryColor,
                )),

            Padding(
              padding: const EdgeInsets.only(top: 18.0,bottom: 30),
              child: Text('Thanks for scheduling! Check your email for appointment details',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: primaryColor.withOpacity(0.6),
                  )),
            ),

            MediumContainer(heading: 'Questions? Call us!',
            paragraph: 'Our service team is here to help. Give us a call',
            onTap: (){
            },),

          ],
        ),
      ),
    );
  }
}
