import 'package:flutter/material.dart';

import '../const.dart';
import 'logo_image.dart';

class TopBar extends StatelessWidget with PreferredSizeWidget {
  final label;

  TopBar({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          )),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          LogoImage(),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            child: Text(label,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(150);
}
