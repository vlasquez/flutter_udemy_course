import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:clima/domain/model/weather_response.dart';

class WeatherAPI {
  static const String openWeatherApiKey = '1f6ca21456731b9de44ce0ea03c478d0';

  Future<WeatherResponse> getWeather(double latitude, double longitude) async {
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': latitude.toString(),
      'lon': longitude.toString(),
      'exclude': 'hourly,daily',
      'appid': openWeatherApiKey,
      'units': 'metric',
    });

    var response =
        await http.get(url, headers: {'name': 'doodle', 'color': 'blue'});

    var weatherResponse = WeatherResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);

    return weatherResponse;
  }
}
