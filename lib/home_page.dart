import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:woody_app/widget/medium_container.dart';
import 'package:woody_app/widget/paragraph.dart';
import 'package:woody_app/widget/top_bar.dart';

import 'appointment_availability_page.dart';
import 'const.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TopBar(label: 'Service My Woody'),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Paragraph(
                      label: 'What would you like to do?',
                      clr: primaryColor.withOpacity(0.6)),
                ),
                MediumContainer(
                  heading: 'Check appointment availability',
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Appointment()));
                  },
                  paragraph:
                      'Check availability to schedule a new service appointment',
                ),
                SizedBox(height: 15,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: primaryColor,width: 2)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 18.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text('Call service',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 17.0,
                                    fontWeight: FontWeight.bold
                                  )),
                            ),
                            GestureDetector(onTap: (){},
                              child: Icon(Icons.call_rounded,color: primaryColor,
                                size: 40.0,),
                            )
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(flex: 3,
                              child: Text('Speak with someone on our service team',
                                  style: TextStyle(
                                    color: primaryColor.withOpacity(0.5),
                                    fontSize: 13.0,

                                  )),
                            ),
                            Spacer(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: primaryColor,
          onTap: (value) {
            print('$value');
            // Respond to item press.
          },

          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.home,size: 40,color: Colors.white,),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(CupertinoIcons.calendar,size: 40,color: Colors.white,),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.account_circle_sharp,size: 40,color: Colors.white,),
            ),

          ],
        ),
      ),
    );
  }
}
