// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_main_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherMainData _$WeatherMainDataFromJson(Map<String, dynamic> json) =>
    WeatherMainData(
      temp: (json['temp'] as num).toDouble(),
      humidity: (json['humidity'] as num).toInt(),
      tempMax: (json['temp_max'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherMainDataToJson(WeatherMainData instance) =>
    <String, dynamic>{
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'humidity': instance.humidity,
    };
