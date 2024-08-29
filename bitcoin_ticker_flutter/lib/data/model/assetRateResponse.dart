import 'package:json_annotation/json_annotation.dart';

part 'assetRateResponse.g.dart';

@JsonSerializable()
class AssertRateResponse {
  AssertRateResponse(
      {required this.assetBase, required this.assetCuote, required this.rate});

  @JsonKey(name: "asset_id_base")
  final String assetBase;

  @JsonKey(name: "asset_id_quote")
  final String assetCuote;

  final double rate;

  factory AssertRateResponse.fromJson(Map<String, dynamic> json) =>
      _$AssertRateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AssertRateResponseToJson(this);
}
