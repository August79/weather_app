import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/logic/auth_bloc/bloc/auth_bloc.dart';
import 'package:my_weather_app/screens/home_screen.dart';
import 'package:my_weather_app/screens/navBar/navigation_.dart';
import 'package:my_weather_app/screens/slider.dart';
import 'screens/welcome_screen.dart';
import 'services/authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthBloc(AuthenticationService(FirebaseAuth.instance)),
      child: MaterialApp(
        theme: ThemeData.light(),
        home: 
        HomeScreen(),
        //WelcomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// class AuthenticationWrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final firebaseUser = context.watch<User?>();
//     if (firebaseUser != null) {
//       return HomePage();
//     } else {
//       return WelcomeScreen();
//     }
//   }
// }
