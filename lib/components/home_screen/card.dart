import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Column(
        children: [
          Container(
            height: 100,
            child: Image(
              image: AssetImage('images/weather_cond_icons/021-cloudy-1.png'),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Moscow',
            style: TextStyle(color: Colors.white, fontSize: 28.0),
          ),
          Text(
            '30°C',
            style: TextStyle(color: Colors.white, fontSize: 34.0),
          ),
          Text(
            'cloudy',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
