import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:woody_app/widget/app_button.dart';
import 'package:woody_app/widget/date_picker.dart';
import 'package:woody_app/widget/paragraph.dart';
import 'package:woody_app/widget/text_form_widget.dart';
import 'package:woody_app/widget/text_widget.dart';
import 'const.dart';

class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  String? serviceType;
  List<String> category = ['Birthday', 'Wedding'];
  String? timeRange;
  List<String> range = [
    '9:00 AM - 10:00 AM',
    '10:00 AM - 11:00 AM',
    '11:00 AM - 12:00 PM',
    '12:00 PM - 1:00 PM',
    '1:00 PM - 2:00 PM',
    '2:00 PM - 3:00 PM',
    '3:00 PM - 4:00 PM',
    '4:00 PM - 5:00 PM',
    '5:00 PM - 6:00 PM',
    '6:00 PM - 7:00 PM'
  ];
  var descriptionController = TextEditingController();
  var addressLine1Controller = TextEditingController();
  var addressLine2Controller = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var zipCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                child: Paragraph(
                    label: 'Appointment type',
                    clr: primaryColor.withOpacity(0.6)),
              ),
              Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: primaryColor)),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TabBar(
                      controller: _tabController,
                      unselectedLabelColor: primaryColor,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: primaryColor),
                      tabs: [
                        Tab(text: 'Mobile service'),
                        Tab(text: 'Drop off')
                      ],
                    ),
                  )),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(label: 'What service do you need?'),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: primaryColor, width: 2)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: DropdownButton(
                                  underline: SizedBox(height: 0),
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  iconSize: 25,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  isExpanded: true,
                                  hint: Text(
                                    'Select Service type',
                                    style: TextStyle(color: primaryColor),
                                  ),
                                  onChanged: (String? value) {
                                    serviceType = value;
                                    setState(() {});
                                    print(serviceType);
                                  },
                                  value: serviceType,
                                  items: category
                                      .map((e) => DropdownMenuItem(
                                          child: Text(e), value: e))
                                      .toList()),
                            ),
                          ),
                          TextWidget(
                              label:
                                  'Provide a brief description of your issue'),
                          TextFormField(
                            maxLines: 5,
                            controller: descriptionController,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                hintText: 'Start typing..',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2),
                                    borderRadius: BorderRadius.circular(5.0))),
                          ),
                          TextWidget(label: 'Preferred date & time'),
                          DatePicker(),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: primaryColor, width: 2)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: DropdownButton(
                                  underline: SizedBox(height: 0),
                                  icon: Icon(
                                    Icons.access_time,
                                    color: primaryColor,
                                  ),
                                  iconSize: 25,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  isExpanded: true,
                                  hint: Text(
                                    'Select time range',
                                    style: TextStyle(color: primaryColor),
                                  ),
                                  onChanged: (String? value) {
                                    timeRange = value;
                                    setState(() {});
                                    print(timeRange);
                                  },
                                  value: timeRange,
                                  items: range
                                      .map((e) => DropdownMenuItem(
                                          child: Text(e), value: e))
                                      .toList()),
                            ),
                          ),
                          TextWidget(
                              label: 'Where are we Servicing your vehicle?'),
                          TextFormWidget(
                              hint: 'Address line 1',
                              label: 'Address line 1',
                              validator: (value) {
                                if (value!.isEmpty)
                                  return "Address is required";
                                else
                                  return null;
                              },
                              controller: addressLine1Controller),
                          TextFormWidget(
                              hint: 'Address line 2',
                              label: 'Address line 2',
                              validator: (value) {},
                              controller: addressLine2Controller),
                          TextFormWidget(
                              hint: 'City',
                              label: 'City',
                              validator: (value) {
                                if (value!.isEmpty)
                                  return "City is required";
                                else
                                  return null;
                              },
                              controller: cityController),
                          TextFormWidget(
                              hint: 'State',
                              label: 'State',
                              validator: (value) {
                                if (value!.isEmpty)
                                  return "State is required";
                                else
                                  return null;
                              },
                              controller: stateController),
                          TextFormWidget(
                              hint: 'ZIP Code',
                              label: 'ZIP Code',
                              keyboard: TextInputType.phone,
                              validator: (value) {
                                if (value!.isEmpty)
                                  return "ZIP Code is required";
                                else
                                  return null;
                              },
                              controller: zipCodeController),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: AppButtonWidget(
                                label: 'View Summary', onTap: () {}),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(label: 'What service do you need?'),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                Border.all(color: primaryColor, width: 2)),
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10.0),
                              child: DropdownButton(
                                  underline: SizedBox(height: 0),
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  iconSize: 25,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  isExpanded: true,
                                  hint: Text(
                                    'Select Service type',
                                    style: TextStyle(color: primaryColor),
                                  ),
                                  onChanged: (String? value) {
                                    serviceType = value;
                                    setState(() {});
                                    print(serviceType);
                                  },
                                  value: serviceType,
                                  items: category
                                      .map((e) => DropdownMenuItem(
                                      child: Text(e), value: e))
                                      .toList()),
                            ),
                          ),
                          TextWidget(
                              label:
                              'Provide a brief description of your issue'),
                          TextFormField(
                            maxLines: 5,
                            controller: descriptionController,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: primaryColor)),
                                hintText: 'Start typing..',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2),
                                    borderRadius: BorderRadius.circular(5.0))),
                          ),
                          TextWidget(label: 'Preferred date & time'),
                          DatePicker(),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                Border.all(color: primaryColor, width: 2)),
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10),
                              child: DropdownButton(
                                  underline: SizedBox(height: 0),
                                  icon: Icon(
                                    Icons.access_time,
                                    color: primaryColor,
                                  ),
                                  iconSize: 25,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  isExpanded: true,
                                  hint: Text(
                                    'Select time range',
                                    style: TextStyle(color: primaryColor),
                                  ),
                                  onChanged: (String? value) {
                                    timeRange = value;
                                    setState(() {});
                                    print(timeRange);
                                  },
                                  value: timeRange,
                                  items: range
                                      .map((e) => DropdownMenuItem(
                                      child: Text(e), value: e))
                                      .toList()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: AppButtonWidget(
                                label: 'View Summary', onTap: () {}),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
