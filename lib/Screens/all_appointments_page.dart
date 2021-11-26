import 'package:flutter/material.dart';
import 'package:woody_app/Screens/const.dart';

import 'appointment_availability_page_2.dart';

class AllAppointments extends StatefulWidget {
  AllAppointments({
    Key? key,
  }) : super(key: key);

  @override
  _AllAppointmentsState createState() => _AllAppointmentsState();
}

class _AllAppointmentsState extends State<AllAppointments> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  tileColor: primaryColor,
                  leading: Text(
                    'October 23,2021',
                    style: TextStyle(color: Colors.white),
                  ),
                  title: Text(
                    'view details',
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )),
            );
          }),
    );
  }
}
