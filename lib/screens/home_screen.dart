import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_weather_app/components/home_screen/card.dart';
import 'package:my_weather_app/components/welcome_screen/gradient_wrapper.dart';
import 'package:my_weather_app/screens/profile_screen.dart';
import 'package:my_weather_app/screens/search_screen.dart';
import 'package:my_weather_app/services/location.dart';
import 'package:my_weather_app/services/weather_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({this.currentUser});

  final User? currentUser;
  final Location location = Location();

  @override
  Widget build(BuildContext context) {
    // print(currentUser);
    return BgrGradientWrapper(
      color1: Colors.blue.shade300,
      color2: Colors.red.shade400,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 32,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ),
                          );
                        }),
                    MyCard(
                      cityName: 'Moscow',
                      temperature: '30',
                      condition: 'cloudy',
                    ),
                    Column(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 32,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchScreen()));
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.near_me,
                              color: Colors.white,
                              size: 32,
                            ),
                            onPressed: () async {
                              
                            }),
                      ],
                    ),
                  ],
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      height: 140,
                      width: double.infinity,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(6),
                        children: [...weatherDay()],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      width: double.infinity,
                      child: ListView(
                        padding: EdgeInsets.all(8),
                        children: [
                          WeekWeather('Tusday'),
                          WeekWeather('Tusday'),
                          WeekWeather('Tusday'),
                          WeekWeather('Tusday'),
                          WeekWeather('Tusday'),
                          WeekWeather('Tusday'),
                          WeekWeather('Tusday'),
                          InformDay(
                            title: 'Today',
                            message:
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                          ),
                          InformDay(),
                          InformDay(),
                          InformDay(),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class Location {
//   double lon = 0;
//   double lat = 0;

//   Future<void> getCurrenLocation() async {
//     try {
//       Position pos = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.low);
//       lat = pos.latitude;
//       lon = pos.longitude;
//     } catch (e) {
//       print(e);
//     }

//     print(lon + lat);
//   }
// }

List<DayWeather> weatherDay() {
  List<DayWeather> weatherOnDay = [];
  for (int i = 0; i < 24; i++) {
    weatherOnDay.add(DayWeather(i.toString()));
  }
  return weatherOnDay;
}

class DayWeather extends StatelessWidget {
  DayWeather(this.hour);
  final String hour;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(hour, style: TextStyle(fontSize: 17)),
          Icon(
            Icons.cloud,
            color: Colors.white,
            size: 25,
          ),
          Text('23°', style: TextStyle(fontSize: 17)),
        ],
      ),
    );
  }
}

class WeekWeather extends StatelessWidget {
  WeekWeather(this.day);
  final String day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(day, style: TextStyle(color: Colors.black, fontSize: 21)),
          Icon(Icons.cloud, color: Colors.white, size: 28),
          Row(
            children: [
              Text('20°', style: TextStyle(color: Colors.black, fontSize: 18)),
              SizedBox(width: 6),
              Text('13°', style: TextStyle(color: Colors.black, fontSize: 18)),
            ],
          )
        ],
      ),
    );
  }
}

class InformDay extends StatelessWidget {
  InformDay({
    this.title,
    this.message,
  });
  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: Colors.black),
          Text(
            title ?? 'about',
            style: TextStyle(color: Colors.blueGrey.shade600),
          ),
          Text(
            message ?? '50',
            style: TextStyle(color: Colors.black, fontSize: 22),
          )
        ],
      ),
    );
  }
}
