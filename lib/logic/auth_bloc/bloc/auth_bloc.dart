import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_weather_app/services/authentication.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationService _authenticationService;

  AuthBloc(this._authenticationService) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is LogIn) {
      try {
        yield AuthLoading();
        final user = await _authenticationService.logIn(
            email: event.email, password: event.password);
        yield AuthLogined(user);
      } on FirebaseAuthException catch (e) {
        yield AuthErrore(e.message.toString());
      }
    } else if (event is CreateUser) {
      try {
        yield AuthLoading();
        final newUser = await _authenticationService.createUser(
            email: event.email, password: event.password);
        yield AuthLogined(newUser);
      } on FirebaseAuthException catch (e) {
        yield AuthErrore(e.message.toString());
      }
    }
  }
}
