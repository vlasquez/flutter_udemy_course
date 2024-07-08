import 'package:clima/domain/model/weather_response.dart';
import 'package:clima/domain/usecase/get_weater_by_city_name.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/util/constants.dart';

class LocationScreen extends StatefulWidget {
  final weatherData;
  LocationScreen({this.weatherData});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double temperature = 0.0;
  int weatherId = 0;
  String cityName = "";

  void getWeatherByCityName(String cityName) async {
    GetWeaterByCityName getWeaterByCityName = GetWeaterByCityName();
    var weatherResponse =
        await getWeaterByCityName.getWeatherByCityName(cityName);
    updateUI(weatherResponse);
  }

  void updateUI(WeatherResponse? weatherResponse) {
    setState(() {
      if (weatherResponse == null) {
        return;
      }
      temperature = weatherResponse.weatherMainData.temp;
      weatherId = weatherResponse.weather[0].id;
      cityName = weatherResponse.name;
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = WeatherModel();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var cityQuery =
                          await Navigator.pushNamed(context, '/city')
                              as String?;
                      if (cityQuery != null) {
                        getWeatherByCityName(cityQuery);
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherModel.getWeatherIcon(weatherId),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "${weatherModel.getMessage(temperature.toInt())} in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
