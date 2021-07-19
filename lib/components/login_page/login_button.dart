import 'package:flutter/material.dart';

Widget loginButton({
  required final Color color,
  required final Function() function,
  required final String title,
  final double width = double.infinity,
}) {
  return ElevatedButton(
    onPressed: function,
    child: Text(title),
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
      backgroundColor: MaterialStateProperty.all(color),
      elevation: MaterialStateProperty.all(5),
      minimumSize: MaterialStateProperty.all(Size(width, 40)),
    ),
  );
}
