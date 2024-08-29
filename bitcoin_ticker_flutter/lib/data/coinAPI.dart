import 'package:bitcoint_ticker_flutter/data/model/assetRateResponse.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

class CoinAPI {
  static const String _url = 'rest.coinapi.io';
  static const String apiKey = 'API_KEY';

  Future<AssertRateResponse> getCoin(String from, String to) async {
    var url = Uri.https(_url, '/v1/exchangerate/$from/$to', {'apikey': apiKey});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return AssertRateResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load coin');
    }
  }
}
