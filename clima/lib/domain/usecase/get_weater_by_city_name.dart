import 'package:clima/data/WeatherAPI.dart';
import 'package:clima/domain/model/weather_response.dart';

class GetWeaterByCityName {
  Future<WeatherResponse> getWeatherByCityName(String cityName) async {
    WeatherAPI weatherAPI = WeatherAPI();
    return weatherAPI.getWeatherByCityName(cityName);
  }
}
