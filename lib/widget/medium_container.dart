import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const.dart';

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
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 18),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(heading,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                      )),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Icon(
                    CupertinoIcons.calendar_today,
                    color: Colors.white,
                    size: 40.0,
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(paragraph,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 13.0,
                      )),
                ),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
