import 'package:flutter/material.dart';

import '../const.dart';

class AppButtonWidget extends StatelessWidget {
  final label, onTap;

  AppButtonWidget({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ))),
      ),
    );
  }
}
