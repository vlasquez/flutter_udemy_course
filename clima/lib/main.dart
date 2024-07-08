import 'package:clima/domain/model/weather_response.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:clima/screens/city_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => LoadingScreen(),
        "/weather": (context) => LocationScreen(),
        "/city": (context) => CityScreen(),
      },
      theme: ThemeData.dark(),
      onGenerateRoute: (settings) {
        print("settings: ${settings.name}");
        switch (settings.name) {
          case '/weather':
            {
              final args = settings.arguments as WeatherResponse?;
              print("args: $args");
              return MaterialPageRoute(
                  builder: (context) => LocationScreen(weatherData: args));
            }
          case '/city':
            {
              return MaterialPageRoute(builder: (context) => CityScreen());
            }
          default:
            return MaterialPageRoute(builder: (context) => LoadingScreen());
        }
      },
    );
  }
}
