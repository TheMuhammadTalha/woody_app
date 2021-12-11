import 'package:flutter/material.dart';
import 'package:woody_app/Screens/const.dart';
import 'package:woody_app/demo/api_service.dart';

import 'appointment_availability_page_2.dart';

class AllAppointments extends StatefulWidget {
  AllAppointments({
    Key? key,
  }) : super(key: key);

  @override
  _AllAppointmentsState createState() => _AllAppointmentsState();
}

class _AllAppointmentsState extends State<AllAppointments> {

  Future<List>? appointments;
  Future<List> _fetchAppointments()async{
      var response = await APIService().getAll('appointment');
    setState(() {});
      return response;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appointments = _fetchAppointments();
    print(appointments);
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
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
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
            ),
          );
        });
  }
}
