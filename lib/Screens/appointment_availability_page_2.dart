import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:woody_app/Screens/thank_you_Page.dart';
import 'package:woody_app/api_models/appointment-model.dart';
import 'package:woody_app/demo/api_service.dart';
import 'package:woody_app/widget/app_button.dart';
import 'all_appointments_page.dart';
import 'const.dart';

class AppointmentDetails extends StatefulWidget {
  final AppointmentModel detail;

  // static final pageName = '/AppointmentDetails';

  AppointmentDetails({Key? key, required this.detail}) : super(key: key);

  @override
  _AppointmentDetailsState createState() => _AppointmentDetailsState();
}
// String getDate(date){
//   return Jiffy(date).yMMMMd;
// }
class _AppointmentDetailsState extends State<AppointmentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: primaryColor, //change your color here
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 1,
                        // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text('Appointment type',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color:
                                          Color(0xff133a7c).withOpacity(0.6))),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: primaryColor,
                                size: 20.0,
                              ),
                            )
                          ],
                        ),
                        Text('Mobile Service',
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24)),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text('Service type',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Color(0xff133a7c).withOpacity(0.6))),
                        ),
                        Text(widget.detail.service.toString(),
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24)),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text('Date',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Color(0xff133a7c).withOpacity(0.6))),
                        ),
                        Text(widget.detail.date.toIso8601String(),
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24)),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text('Time range',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Color(0xff133a7c).withOpacity(0.6))),
                        ),
                        Text(
                            '${widget.detail.timeSlot!.to}PM-${widget.detail.timeSlot!.from}PM',
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24)),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text('Service address',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Color(0xff133a7c).withOpacity(0.6))),
                        ),
                        Text(
                            widget.detail.address +
                                ', ' +
                                widget.detail.state +
                                ', ' +
                                widget.detail.city +
                                ', ' +
                                widget.detail.zip,
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              AppButtonWidget(
                  label: 'Submit appointment request',
                  onTap: () async {
                    final _personId=await APIService().getPersonID();
                    print(jsonEncode(AppointmentModel(
                        status: 0,
                        personID: _personId,
                        type: 0,
                        service: 0,
                        description: 'abc',
                        date: widget.detail.date,
                        timeSlot: widget.detail.timeSlot,
                        address: widget.detail.address,
                        city: widget.detail.city,
                        state: widget.detail.state,
                        zip: widget.detail.zip,
                        vehicle: widget.detail.vehicle)
                        .toJson()));

                    await APIService().specialPostCase(
                        context,
                        'appointment',
                        AppointmentModel(
                                status: 0,
                                personID: _personId,
                                type: 0,
                                service: 0,
                                description: 'description',
                                date: widget.detail.date,
                                timeSlot: widget.detail.timeSlot,
                                address: widget.detail.address,
                                city: widget.detail.city,
                                state: widget.detail.state,
                                zip: widget.detail.zip,
                                vehicle: widget.detail.vehicle)
                            .toJson());
                   print("Successfully created Appointment");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AllAppointments()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
