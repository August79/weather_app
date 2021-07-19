import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_weather_app/components/welcome_screen/animated_img.dart';
import 'package:my_weather_app/components/welcome_screen/gradient_wrapper.dart';
import 'package:my_weather_app/screens/home_screen.dart';
import 'package:my_weather_app/utilities/constants.dart';
import 'package:my_weather_app/components/login_page/login_button.dart';
import 'login_screen.dart';
import 'regist_screen.dart';
import 'navBar/navigation_.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BgrGradientWrapper(
      color1: Colors.blue.shade400,
      color2: Colors.blue.shade200,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: kWelcomeScreenPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'welcome to',
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.grey[100],
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 20.0),
                AnimatedImage(),
                SizedBox(height: 14.0),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Hero(
                          tag: 'main_logo',
                          child: Image.asset('images/main_logo.png'),
                        ),
                        height: 47,
                      ),
                      SizedBox(width: 8.0),
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'DRIZZL',
                            textStyle: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w500,
                            ),
                            speed: const Duration(milliseconds: 300),
                            curve: Curves.bounceInOut,
                          ),
                        ],
                        totalRepeatCount: 1,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 26.0),
                loginButton(
                  title: 'Login',
                  color: loginButtonColor,
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
                SizedBox(height: 0.5),
                loginButton(
                  title: 'Registration',
                  color: loginButtonColor,
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationScreen(),
                        ));
                  },
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Continue as a guest',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      width: 32,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return HomeScreen();
                            }),
                          );
                        },
                        icon: Icon(
                          Icons.login,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
