import 'package:flutter/material.dart';
import 'package:woody_app/Screens/const.dart';
import 'package:woody_app/widget/medium_container.dart';
import 'package:woody_app/widget/paragraph.dart';

import 'appointment_availability_page.dart';

class PageView1 extends StatefulWidget {
  const PageView1({Key? key}) : super(key: key);

  @override
  _PageView1State createState() => _PageView1State();
}

class _PageView1State extends State<PageView1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              onTap: () {
                // Navigator.pushNamed(context, Appointment.pageName);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Appointment()));
              },
              paragraph:
              'Check availability to schedule a new service appointment ',
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 15.0, horizontal: 18.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: primaryColor, width: 2)),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Call service',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text('Speak with someone on our service team',
                            style: TextStyle(
                              color: primaryColor.withOpacity(0.5),
                              fontSize: 14.0,
                            )),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.call_rounded,
                    color: primaryColor,
                    size: 40.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
