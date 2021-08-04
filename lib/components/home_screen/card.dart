import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  MyCard({
    required this.cityName,
    required this.temperature,
    required this.condition,
  });

  final String cityName;
  final String temperature;
  final String condition;

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
            cityName,
            style: TextStyle(color: Colors.white, fontSize: 28.0),
          ),
          Text(
            '$temperature°C',
            style: TextStyle(color: Colors.white, fontSize: 34.0),
          ),
          Text(
            condition,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
