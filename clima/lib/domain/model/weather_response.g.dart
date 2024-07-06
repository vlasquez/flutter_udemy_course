// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    WeatherResponse(
      coordinates: Coordinates.fromJson(json['coord'] as Map<String, dynamic>),
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      weatherMainData:
          WeatherMainData.fromJson(json['main'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'coord': instance.coordinates,
      'id': instance.id,
      'name': instance.name,
      'main': instance.weatherMainData,
    };
