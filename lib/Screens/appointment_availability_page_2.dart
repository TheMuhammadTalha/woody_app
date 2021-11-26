import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:woody_app/Screens/thank_you_Page.dart';
import 'package:woody_app/widget/app_button.dart';
import 'const.dart';

class Details {
  String serviceType;
  String date;
  String address;
  String timeRange;
  String city;
  String state;
  String zip;

  Details({
    required this.serviceType,
    required this.date,
    required this.address,
    required this.timeRange,
    required this.city,
    required this.state,
    required this.zip,
  });
}

class AppointmentDetails extends StatefulWidget {
  final Details detail;

  // static final pageName = '/AppointmentDetails';

  AppointmentDetails({Key? key, required this.detail}) : super(key: key);

  @override
  _AppointmentDetailsState createState() => _AppointmentDetailsState();
}

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
                                      color: Color(0xff133a7c).withOpacity(0.6))),
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
                        Text(widget.detail.serviceType,
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
                        Text(widget.detail.date,
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
                        Text(widget.detail.timeRange,
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
                  label: 'Submit appointment request', onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThanksPage()));
              })
            ],
          ),
        ),
      ),
    );
  }
}
