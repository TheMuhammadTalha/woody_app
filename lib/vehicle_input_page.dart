import 'package:flutter/material.dart';

import 'home_page.dart';
import 'widget/text_field.dart';

class VehicleInput extends StatefulWidget {
  const VehicleInput({Key? key}) : super(key: key);

  @override
  _VehicleInputState createState() => _VehicleInputState();
}

class _VehicleInputState extends State<VehicleInput> {
  var year = TextEditingController();
  var make = TextEditingController();
  var model = TextEditingController();
  var vin = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LogoImage(),
                Heading(label: 'Complete your profile'),
                Paragraph(
                    label: 'What vehicle needs service?',
                    clr: Colors.grey.shade600),
                SizedBox(height: 30),
                TextFormWidget(
                  validator: (String? value) {
                    if (value!.isEmpty)
                      return "Year is required";
                    else
                      return null;
                  },
                  hint: 'Year',
                  label: 'Year',
                  controller: year,
                ),
                TextFormWidget(
                  validator: (String? value) {
                    if (value!.isEmpty)
                      return "Make is required";
                    else
                      return null;
                  },
                  hint: 'Make',
                  label: 'Make',
                  controller: make,
                ),
                TextFormWidget(
                  validator: (String? value) {
                    if (value!.isEmpty)
                      return "Model is required";
                    else
                      return null;
                  },
                  hint: 'Model',
                  label: 'Model',
                  controller: model,
                ),
                TextFormWidget(
                  validator: (String? value) {
                    if (value!.isEmpty)
                      return "VIN is required";
                    else
                      return null;
                  },
                  hint: 'VIN',
                  label: 'VIN',
                  controller: vin,
                ),
                AppButtonWidget(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        print('validate');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage()));
                      } else
                        setState(() {
                          autoValidateMode = AutovalidateMode.always;
                        });
                    },
                    label: 'Complete'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
