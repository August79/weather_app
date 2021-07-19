// import 'package:flutter/material.dart';
// import 'package:intro_slider/intro_slider.dart';
// import 'package:intro_slider/slide_object.dart';
// import 'package:my_weather_app/components/home_screen/card.dart';

// class IntroSlidePage extends StatefulWidget {
//   @override
//   _IntroSlidePageState createState() => _IntroSlidePageState();
// }

// class _IntroSlidePageState extends State<IntroSlidePage> {
//   List<Slide> slides = [];

//   @override
//   void initState() {
//     super.initState();
//     slides.add(
//       Slide(
//         centerWidget: MyCard(),
//         colorBegin: Colors.blue[500],
//         colorEnd: Colors.red[200],
//         description: 'weahter digrese and some more information',
//       ),
//     );
//     slides.add(
//       Slide(
//         centerWidget: MyCard(),
//         colorBegin: Colors.blue[500],
//         colorEnd: Colors.red[200],
//         description: 'weahter digrese and some more information',
//       ),
//     );
//   }

//   // List<Widget> renderListCustomTabs(){
//   //   List<Widget> renderListCustomTabs = [];
//   //   for(int i = 0; i < slides.length; i++) {

//   //   }

//   //   return renderListCustomTabs;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return IntroSlider(
//       //listCustomTabs: [],
//       slides: slides,

//       backgroundColorAllSlides: Colors.transparent,
//     );
//   }
// }
