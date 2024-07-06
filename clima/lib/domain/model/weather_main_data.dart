import 'package:json_annotation/json_annotation.dart';

part 'weather_main_data.g.dart';

@JsonSerializable()
class WeatherMainData {
  @JsonKey(name: "temp_min")
  double tempMin;

  @JsonKey(name: "temp_max")
  double tempMax;
  @JsonKey(name: "temp")
  double temp;

  @JsonKey(name: "feels_like")
  double feelsLike;

  @JsonKey(name: "humidity")
  int humidity;

  WeatherMainData(
      {required this.temp,
      required this.humidity,
      required this.tempMax,
      required this.tempMin,
      required this.feelsLike});

  factory WeatherMainData.fromJson(Map<String, dynamic> json) =>
      _$WeatherMainDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherMainDataToJson(this);
}
