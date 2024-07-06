import 'package:flutter/material.dart';
import '/services/location.dart';
import 'package:clima/data/WeatherAPI.dart';
import 'package:clima/domain/usecase/get_weather_by_location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getWeatherByLocation();
  }

  void getWeatherByLocation() async {
    GetWeatherByLocation getWeatherByLocation = GetWeatherByLocation();
    var weatherResponse = await getWeatherByLocation.getWeatherByLocation();
    print(weatherResponse.coordinates.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
