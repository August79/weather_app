part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LogIn extends AuthEvent {
  final String email;
  final String password;

  LogIn({required this.email, required this.password});
}

class CreateUser extends AuthEvent {
  final String email;
  final String password;

  CreateUser({required this.email, required this.password});
}
