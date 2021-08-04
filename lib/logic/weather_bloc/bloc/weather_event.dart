part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherByLocation extends WeatherEvent {
  const GetWeatherByLocation();
}

class GetWeatherByCityName extends WeatherEvent {
  const GetWeatherByCityName(this.cityName);

  final String cityName;
}
