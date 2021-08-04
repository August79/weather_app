import 'location.dart';
import 'network_req.dart';

const openWeatherMapUrl = 'http://api.openweathermap.org/data/2.5/weather';
const apiKey = '9d8371500afc247df425c0f8cbc8b5b5';

class WeatherModel {
  Future<void> getWeatherByCoordinats() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkReq networkReq = NetworkReq(
        '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey');

    var weatherData = await networkReq.getData();
    return weatherData;
  }

  Future<void> getWeatherByCityName(String cityName) async {
    NetworkReq networkReq =
        NetworkReq('$openWeatherMapUrl?id=$cityName&appid=$apiKey');

    var weatherData = await networkReq.getData();
    return weatherData;
  }
}
