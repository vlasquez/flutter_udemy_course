import 'package:clima/domain/model/weather.dart';
import 'package:json_annotation/json_annotation.dart';
import 'coordinates.dart';
import 'weather_main_data.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  WeatherResponse(
      {required this.coordinates,
      required this.id,
      required this.name,
      required this.weatherMainData,
      required this.weather});

  @JsonKey(name: "coord")
  Coordinates coordinates;

  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "main")
  WeatherMainData weatherMainData;

  @JsonKey(name: "weather")
  List<Weather> weather;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}
