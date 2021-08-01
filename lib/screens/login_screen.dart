import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/components/welcome_screen/gradient_wrapper.dart';
import 'package:my_weather_app/logic/auth_bloc/bloc/auth_bloc.dart';
import 'package:my_weather_app/screens/home_screen.dart';
import 'package:my_weather_app/utilities/constants.dart';
import 'package:my_weather_app/components/login_page/login_text_field.dart';
import 'package:my_weather_app/components/login_page/login_button.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_weather_app/components/login_page/loading_circle_ind.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BgrGradientWrapper(
      color1: Colors.blue.shade300,
      color2: Colors.blue.shade200,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: kWelcomeScreenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 300,
                    child: Hero(
                      tag: 'main_logo',
                      child: Image.asset('images/main_logo.png'),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      LoginTextField(
                        icon: Icon(Icons.email),
                        controller: emailController,
                        hintText: 'Enter your email',
                      ),
                      SizedBox(height: 6.0),
                      LoginTextField(
                        icon: Icon(Icons.lock),
                        controller: passwordController,
                        hintText: 'Enter your pasword',
                        hideText: true,
                      ),
                      SizedBox(height: 8.0),
                      BlocConsumer<AuthBloc, AuthState>(
                          builder: (context, state) {
                        if (state is AuthLoading) {
                          return ProgressSpinKit();
                        } else {
                          return loginButton(
                            title: 'Login',
                            color: loginButtonColor,
                            function: () {
                              eventOnTap(
                                context,
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                            },
                          );
                        }
                      }, listener: (context, state) {
                        if (state is AuthErrore) {
                          showToast(state.message);
                        } else if (state is AuthLogined) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomeScreen(currentUser: state.user),
                            ),
                          );
                        }
                      })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void eventOnTap(BuildContext context,
    {required String email, required String password}) {
  final authBloc = context.read<AuthBloc>();
  authBloc.add(
    LogIn(email: email, password: password),
  );
}

void showToast(String message) {
  Fluttertoast.showToast(
    gravity: ToastGravity.TOP,
    msg: message,
  );
}
