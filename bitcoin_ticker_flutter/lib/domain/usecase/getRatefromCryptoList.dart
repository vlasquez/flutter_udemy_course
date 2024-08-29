import 'package:bitcoint_ticker_flutter/data/coinAPI.dart';
import 'package:bitcoint_ticker_flutter/domain/coin.dart';
import 'package:bitcoint_ticker_flutter/domain/model/asset_rate.dart';

class GetRateFromCryptoList {
  Future<List<AssetRate>> invoke(String legalCurrency) async {
    List<AssetRate> assetRateList = [];
    for (var crypto in cryptoList) {
      var assetRate = await CoinAPI().getCoin(crypto, legalCurrency);
      assetRateList.add(AssetRate(
          cryptoCurrency: crypto,
          legalCurrency: legalCurrency,
          rate: assetRate.rate.toString()));
    }

    return Future.value(assetRateList);
  }
}
