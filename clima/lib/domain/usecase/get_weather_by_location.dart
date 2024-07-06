import 'package:clima/data/WeatherAPI.dart';
import 'package:clima/domain/model/weather_response.dart';
import 'package:clima/services/location.dart';

class GetWeatherByLocation {
  Future<WeatherResponse> getWeatherByLocation() async {
    double latitude = 0.0;
    double longitude = 0.0;

    var location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude?.toDouble() ?? 0.0;
    longitude = location.longitude?.toDouble() ?? 0.0;

    WeatherAPI weatherAPI = WeatherAPI();
    return weatherAPI.getWeather(latitude, longitude);
  }
}
