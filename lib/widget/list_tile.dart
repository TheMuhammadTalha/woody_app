import 'package:flutter/material.dart';
import 'package:woody_app/Screens/const.dart';

class ListTileWidget extends StatelessWidget {
  final String leading;
   ListTileWidget({Key? key,required this.leading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
          tileColor: primaryColor,
          leading: Text(
            leading,
            style: TextStyle(color: Colors.white),
          ),
          title: Text(
            'View details',
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.white),
          ),
          trailing: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          )),
    );
  }
}
