import 'package:flutter/material.dart';
import 'package:my_weather_app/utilities/constants.dart';

class LoginTextField extends StatelessWidget {
  LoginTextField({
    this.icon,
    this.hideText = false,
    this.hintText,
    this.controller,
  });

  final Icon? icon;
  final String? hintText;
  final bool hideText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Color(0xFF5483a6),
      ),
      child: TextField(
        controller: controller,
        cursorColor: Colors.blueGrey,
        textAlign: TextAlign.center,
        obscureText: hideText,
        decoration: kLoginTextFieldInputDecoration.copyWith(
          hintText: hintText,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: icon,
          ),
        ),
      ),
    );
  }
}
