import 'package:flutter/material.dart';

import '../const.dart';
import 'logo_image.dart';

class TopBar extends StatelessWidget with PreferredSizeWidget {
  final String label;

  TopBar({Key? key, required this.label}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
                color: primaryColor
        ),
      ),
      toolbarHeight: 100,
      backgroundColor: Colors.transparent,
      title: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Image.asset(
                'assets/images/woodyLogo.png',
                height: 50,
              ),
            ),
            Text(label,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
      ),
    );
  }
}
