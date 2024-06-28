import 'package:flutter/material.dart';
import '/services/location.dart';
import 'package:http/http.dart' as http;

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
    print('latitude: ${location.latitude} longitude: ${location.longitude}');
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

    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
