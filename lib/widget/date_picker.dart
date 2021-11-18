import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:woody_app/const.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 2, color: primaryColor)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (selectedDate != null)
                      ? Text(
                    '${selectedDate!.day} - ${selectedDate!.month} - ${selectedDate!.year}',
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                      : Text(
                    'Select date',
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold,color: primaryColor),
                  ),
                  GestureDetector(
                      onTap: () async {
                        DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: selectedDate ?? DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime((DateTime.now().year + 50)));
                        if (date != null) selectedDate = date;
                        setState(() {});
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
    );
  }
}
