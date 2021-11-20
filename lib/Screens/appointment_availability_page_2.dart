import 'package:flutter/material.dart';

import 'const.dart';

class AppointmentDetails extends StatefulWidget {
  const AppointmentDetails({Key? key}) : super(key: key);

  @override
  _AppointmentDetailsState createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(            crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              'Check Appointment',
              style: TextStyle(color: primaryColor, fontSize: 30.0),
            ),
            Text(
              'Availability',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                  fontSize: 35.0),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                  ],
                ),
              ),
            )
        ],),
      ),
    );
  }
}
