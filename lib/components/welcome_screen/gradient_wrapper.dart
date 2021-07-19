import 'package:flutter/material.dart';

class BgrGradientWrapper extends StatelessWidget {
  BgrGradientWrapper({
    required this.color1,
    required this.color2,
    required this.child,
  });
  final Color color1;
  final Color color2;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: [
            color1,
            color2,
          ],
        ),
      ),
    );
  }
}
