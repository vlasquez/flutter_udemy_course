import 'package:flutter/material.dart';
import 'package:clima/domain/usecase/get_weather_by_location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

    Navigator.pushNamed(context, '/weather', arguments: weatherResponse);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: const Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
