import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:woddy_app/const.dart';

class Heading extends StatelessWidget {
  final label;

  Heading({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 8.0),
      child: Text(label,
          style: TextStyle(
            fontSize: 30.0,
            color: primaryColor,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}

class Paragraph extends StatelessWidget {
  final label, clr;

  Paragraph({Key? key, required this.label, required this.clr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.0,
          color: clr,
        ));
  }
}

class TextWidget extends StatelessWidget {
  final label;

  TextWidget({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, bottom: 10.0),
      child: Text(label,
          style: TextStyle(
              fontSize: 18.0, color: Color(0xff133a7c).withOpacity(0.6))),
    );
  }
}

class LogoImage extends StatelessWidget {
  const LogoImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/woodyLogo.png',
      height: 80.0,
    );
  }
}

class TextFormWidget extends StatelessWidget {
  final hint, label, controller, validator;

  TextFormWidget(
      {Key? key,
      required this.hint,
      required this.label,
      required this.validator,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            hintText: hint,
            // hintStyle: TextStyle(color: primaryColor),
            labelText: label,
            labelStyle: TextStyle(color: primaryColor),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      ),
    );
  }
}

class PasswordFormWidget extends StatefulWidget {
  String hint;
  String label;
  TextEditingController controller;

  FormFieldValidator<String> validator;

  PasswordFormWidget({
    Key? key,
    required this.hint,
    required this.label,
    required this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  _PasswordFormWidgetState createState() => _PasswordFormWidgetState();
}

class _PasswordFormWidgetState extends State<PasswordFormWidget> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        obscureText: obscure,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
            validator: widget.validator,
        decoration: InputDecoration(
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            labelStyle: TextStyle(color: primaryColor),
            hintText: widget.hint,
            labelText: widget.label,
            suffixIcon: GestureDetector(
                onTap: () {
                 setState(() {
                   obscure = !obscure;print(obscure);
                 });
                },
                child:
                    obscure ? Icon(Icons.arrow_back) : Icon(Icons.visibility)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      ),
    );
  }
}

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

class MidContainer extends StatelessWidget {
  final heading, paragraph, onTap;

  MidContainer(
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
