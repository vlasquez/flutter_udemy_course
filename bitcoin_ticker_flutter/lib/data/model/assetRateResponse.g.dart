// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assetRateResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssertRateResponse _$AssertRateResponseFromJson(Map<String, dynamic> json) =>
    AssertRateResponse(
      assetBase: json['asset_id_base'] as String,
      assetCuote: json['asset_id_quote'] as String,
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$AssertRateResponseToJson(AssertRateResponse instance) =>
    <String, dynamic>{
      'asset_id_base': instance.assetBase,
      'asset_id_quote': instance.assetCuote,
      'rate': instance.rate,
    };
