import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/const.dart';

class MediumContainer extends StatelessWidget {
  final heading, paragraph, onTap;

  MediumContainer(
      {Key? key,
        required this.heading,
        required this.paragraph,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 18),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 8,
              // changes position of shadow
            ),
          ],
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(heading,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                      )),
                  SizedBox(height: 10),
                  Text(paragraph,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 14.0,
                  )),
                ],
              ),
            ),
            Icon(
              CupertinoIcons.calendar_today,
              color: Colors.white,
              size: 40.0,
            ),
      ])),
    );
  }
}
