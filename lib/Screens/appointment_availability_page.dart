import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:woody_app/api_models/appointment-model.dart';
import 'package:woody_app/api_models/time-slot_model.dart';
import 'package:woody_app/api_models/vehicle_model.dart';
import 'package:woody_app/demo/api_service.dart';
import 'package:woody_app/widget/app_button.dart';
import 'package:woody_app/widget/date_picker.dart';
import 'package:woody_app/widget/paragraph.dart';
import 'package:woody_app/widget/text-form-2.dart';
import 'package:woody_app/widget/text_widget.dart';
import 'appointment_availability_page_2.dart';
import 'const.dart';

class Appointment extends StatefulWidget {
  // static final pageName = '/appointment';

  const Appointment({Key? key}) : super(key: key);

  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  String? serviceType;
  List<String> category = ['Oil Change', 'Tunning'];

  VehicleModel? selectedCar;
  var cars = <VehicleModel>[];

  TimeSlotModel? selectedTimeRange;
  var timeRange = <TimeSlotModel>[];

  List<String> range = [];
  DateTime? selectedDate;
  String? formattedDate;
  var descriptionController = TextEditingController();
  var addressLine1Controller = TextEditingController();
  var addressLine2Controller = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var zipCodeController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _fetchCars();
    _fetchTimeRange();
  }

  void _fetchCars() async {
    try {
      cars = (await APIService().getAll('vehicle'))
          .map<VehicleModel>((e) => VehicleModel.fromJson(e))
          .toList();
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  void _fetchTimeRange() async {
    try {
      timeRange = (await APIService().getAll('time-slot'))
          .map((e) => TimeSlotModel.fromJson(e))
          .toList();
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: primaryColor, //change your color here
            ),
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
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: primaryColor)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10),
                                child: DropdownButton(
                                    underline: SizedBox(height: 0),
                                    icon: Icon(Icons.keyboard_arrow_down,
                                        color: primaryColor.withOpacity(0.6)),
                                    iconSize: 25,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                    isExpanded: true,
                                    hint: Text(
                                      'Select Service type',
                                      style: TextStyle(
                                          color: primaryColor.withOpacity(0.6),
                                          fontFamily: 'Lexend'),
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
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                              ),
                            ),
                            TextWidget(
                                label: 'Which Car do you want to get served?'),
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: primaryColor)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10),
                                child: DropdownButton<VehicleModel>(
                                    underline: SizedBox(height: 0),
                                    icon: Icon(Icons.keyboard_arrow_down,
                                        color: primaryColor.withOpacity(0.6)),
                                    iconSize: 25,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                    isExpanded: true,
                                    hint: Text(
                                      'Select Car',
                                      style: TextStyle(
                                          color: primaryColor.withOpacity(0.6),
                                          fontFamily: 'Lexend'),
                                    ),
                                    onChanged: (VehicleModel? value) {
                                      selectedCar = value;
                                      setState(() {});
                                      print(selectedCar);
                                    },
                                    value: selectedCar,
                                    items: cars
                                        .map(
                                          (e) => DropdownMenuItem<VehicleModel>(
                                            child: Text('${e.model} ${e.year}'),
                                            value: e,
                                          ),
                                        )
                                        .toList()),
                              ),
                            ),
                            TextWidget(label: 'Preferred date & time'),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border:
                                            Border.all(color: primaryColor)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          (selectedDate != null)
                                              ? Text(
                                                  '$formattedDate',
                                                  style: TextStyle(
                                                    color: primaryColor
                                                        .withOpacity(0.6),
                                                    fontSize: 15,
                                                  ),
                                                )
                                              : Text(
                                                  'Select date',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: primaryColor
                                                          .withOpacity(0.6)),
                                                ),
                                          GestureDetector(
                                              onTap: () async {
                                                DateTime? date =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            selectedDate ??
                                                                DateTime.now(),
                                                        firstDate:
                                                            DateTime.now(),
                                                        lastDate: DateTime(
                                                            (DateTime.now()
                                                                    .year +
                                                                50)));
                                                if (date != null)
                                                  selectedDate = date;
                                                formattedDate =
                                                    Jiffy(selectedDate).yMMMMd;
                                                setState(() {});
                                                print(formattedDate);
                                              },
                                              child: Icon(
                                                CupertinoIcons.calendar,
                                                color: primaryColor,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: primaryColor)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: DropdownButton(
                                    underline: SizedBox(height: 0),
                                    icon: Icon(
                                      Icons.access_time,
                                      color: primaryColor,
                                    ),
                                    iconSize: 25,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: primaryColor.withOpacity(0.6)),
                                    isExpanded: true,
                                    hint: Text(
                                      'Select time range',
                                      style: TextStyle(
                                          color: primaryColor.withOpacity(0.6)),
                                    ),
                                    onChanged: (TimeSlotModel? value) {
                                      selectedTimeRange = value!;
                                      setState(() {});
                                      print(selectedTimeRange);
                                    },
                                    value: selectedTimeRange,
                                    items: timeRange
                                        .map((e) => DropdownMenuItem(
                                            child: Text('${e.to}-${e.from}'),
                                            value: e))
                                        .toList()),
                              ),
                            ),
                            TextWidget(
                                label: 'Where are we Servicing your vehicle?'),
                            TextFormWidget2(
                                hint: 'Address line 1',
                                label: 'Address line 1',
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return "Address is required";
                                  else
                                    return null;
                                },
                                controller: addressLine1Controller),
                            TextFormWidget2(
                                hint: 'Address line 2',
                                label: 'Address line 2',
                                validator: (value) {},
                                controller: addressLine2Controller),
                            TextFormWidget2(
                                hint: 'City',
                                label: 'City',
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return "City is required";
                                  else
                                    return null;
                                },
                                controller: cityController),
                            TextFormWidget2(
                                hint: 'State',
                                label: 'State',
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return "State is required";
                                  else
                                    return null;
                                },
                                controller: stateController),
                            TextFormWidget2(
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: AppButtonWidget(
                                label: 'View Summary',
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AppointmentDetails(
                                          detail: AppointmentModel(
                                            address:
                                                addressLine1Controller.text,
                                            date: selectedDate!,
                                            service:0,
                                            timeSlot: selectedTimeRange,
                                            city: cityController.text,
                                            state: stateController.text,
                                            zip: zipCodeController.text,
                                            vehicle: selectedCar,
                                            personID: '',
                                            description: '',
                                            status: 0,
                                            type: 0,
                                          ),
                                        ),
                                      ),
                                    );
                                    return print('Validate');
                                  }
                                },
                              ),
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
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: primaryColor)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10),
                                child: DropdownButton(
                                    underline: SizedBox(height: 0),
                                    icon: Icon(Icons.keyboard_arrow_down,
                                        color: primaryColor.withOpacity(0.6)),
                                    iconSize: 25,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                    isExpanded: true,
                                    hint: Text(
                                      'Select Service type',
                                      style: TextStyle(
                                          color: primaryColor.withOpacity(0.6),
                                          fontFamily: 'Lexend'),
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
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                              ),
                            ),
                            TextWidget(label: 'Preferred date & time'),
                            DatePicker(),
                            SizedBox(height: 10),
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: primaryColor)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: DropdownButton(
                                    underline: SizedBox(height: 0),
                                    icon: Icon(
                                      Icons.access_time,
                                      color: primaryColor,
                                    ),
                                    iconSize: 25,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: primaryColor.withOpacity(0.6)),
                                    isExpanded: true,
                                    hint: Text(
                                      'Select time range',
                                      style: TextStyle(
                                          color: primaryColor.withOpacity(0.6)),
                                    ),
                                    onChanged: (TimeSlotModel? value) {
                                      selectedTimeRange = value!;
                                      setState(() {});
                                      print(timeRange);
                                    },
                                    value: selectedTimeRange,
                                    items: timeRange
                                        .map((e) => DropdownMenuItem(
                                            child: Text('${e.to}-${e.from}'),
                                            value: e))
                                        .toList()),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: AppButtonWidget(
                                  label: 'View 2nd Summary',
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      return print('Validate');
                                    }
                                  }),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
