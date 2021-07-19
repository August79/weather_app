import 'package:flutter/material.dart';

const kWelcomeScreenPadding = EdgeInsets.symmetric(horizontal: 40.0);
const kTextFieldIconsColor = Colors.blueGrey;
const loginButtonColor = Color(0xFF5483a6);
const kLoginTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.black54),
  contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 3),
      borderRadius: BorderRadius.all(Radius.circular(12))),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF5483a6), width: 3),
      borderRadius: BorderRadius.all(Radius.circular(12))),
);

const homeScreenCardTextStyle = TextStyle(color: Colors.white, fontSize: 30);