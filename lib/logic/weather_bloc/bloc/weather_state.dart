part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherDataLoading extends WeatherState {}

class WeatherDataErrore extends WeatherState {
  final String message;
  WeatherDataErrore(this.message);
}

class WeatherDataLoaded extends WeatherState {
  final String city;
  final String temperature;
  final String condition;

  WeatherDataLoaded(this.city, this.temperature, this.condition);
}
