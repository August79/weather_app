import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProgressSpinKit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: Color(0xFF5483a6),
      size: 36.0,
      duration: Duration(seconds: 1),
    );
  }
}