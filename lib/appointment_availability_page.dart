import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:woody_app/widget/paragraph.dart';
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
  var controller = TextEditingController();

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
          leading: Icon(Icons.arrow_back, color: primaryColor),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                    padding: const EdgeInsets.all(2.0),
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
                    Column(
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
                                const EdgeInsets.only(left: 10.0, right: 10),
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
                            label: 'Provide a brief description of your issue'),
                        TextFormField(
                          maxLines: 5,
                          controller: controller,
                          validator: (String? value) {
                            if (value!.isEmpty)
                              return "This field is required";
                            else
                              return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Start typing..',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                      ],
                    ),
                    Column(
                      children: [Text('data')],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
