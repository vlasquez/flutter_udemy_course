import 'dart:convert';

import 'package:flutter/material.dart';
import '/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:clima/domain/model/weather_response.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }

  void getLocation() async {
    var location = Location();
    await location.getCurrentLocation();
  }

  void getData() async {
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': '33.44',
      'lon': '-94.04',
      'exclude': 'hourly,daily',
      'appid': '1f6ca21456731b9de44ce0ea03c478d0'
    });

    var response =
        await http.get(url, headers: {'name': 'doodle', 'color': 'blue'});

    var weatherResponse = WeatherResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);

    print('name: ${weatherResponse.name}'
        'Latitude: ${weatherResponse.coordinates.latitude} Longitude: ${weatherResponse.coordinates.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
