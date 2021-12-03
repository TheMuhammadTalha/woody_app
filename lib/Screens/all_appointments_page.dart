import 'package:flutter/material.dart';
import 'package:woody_app/Screens/const.dart';
import 'package:woody_app/widget/list_tile.dart';

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
            return ListTileWidget(leading: 'October 32, 2021');
          }),
    );
  }
}
