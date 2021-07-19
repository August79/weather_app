part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthErrore extends AuthState {
  final String message;
  const AuthErrore(this.message);
}

class AuthLogined extends AuthState{
  final user;
  const AuthLogined(this.user);
}
