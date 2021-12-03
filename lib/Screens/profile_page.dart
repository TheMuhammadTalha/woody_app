import 'package:flutter/material.dart';
import 'package:woody_app/Screens/const.dart';
import 'package:woody_app/widget/list_tile.dart';
import 'package:woody_app/widget/paragraph.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
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
            Paragraph(label: 'Account information',clr: primaryColor.withOpacity(0.6)),
            ListTileWidget(leading: 'Name & contact info'),
            ListTileWidget(leading: 'Email & Password'),
            Paragraph(label: 'Your garage',clr: primaryColor.withOpacity(0.6)),
            ListTileWidget(leading: '2021 Ford F-150'),



          ],
        ),
      ),
    );
  }
}
