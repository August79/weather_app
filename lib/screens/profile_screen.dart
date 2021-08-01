import 'package:flutter/material.dart';
import 'package:my_weather_app/components/welcome_screen/gradient_wrapper.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({this.userEmail});
  final String? userEmail;

  @override
  Widget build(BuildContext context) {
    return BgrGradientWrapper(
      color1: Colors.blue.shade300,
      color2: Colors.red,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
