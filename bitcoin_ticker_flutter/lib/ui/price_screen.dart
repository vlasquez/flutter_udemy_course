import 'package:bitcoint_ticker_flutter/domain/usecase/getRatefromCryptoList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bitcoint_ticker_flutter/domain/coin.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedCurrency = currenciesList[0];
  Map<String, String> coinValues = {};
  bool isWaiting = false;

  void getAssetRate() async {
    isWaiting = true;
    try {
      var assetRate = await GetRateFromCryptoList().invoke(selectedCurrency!);
      isWaiting = false;
      setState(() {
        for (var asset in assetRate) {
          coinValues[asset.cryptoCurrency] = asset.rate;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getAssetRate();
  }

  DropdownButton<String> getDropdownButton() {
    return DropdownButton<String>(
      value: selectedCurrency,
      items: currenciesList.map((String coin) {
        return DropdownMenuItem<String>(
          value: coin,
          child: Text(coin),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getAssetRate();
        });
      },
    );
  }

  CupertinoPicker getCupertinoPicker() {
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getAssetRate();
        });
      },
      children: currenciesList
          .map((coin) => Text(
                coin,
                style: const TextStyle(color: Colors.white),
              ))
          .toList(),
    );
  }

  Widget getCoinPicker() {
    if (Platform.isIOS) {
      return getCupertinoPicker();
    } else {
      return getDropdownButton();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //3: You'll need to use a Column Widget to contain the three CryptoCards.
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CryptoCard(
                cryptoCurrency: 'BTC',
                value: isWaiting ? '?' : coinValues['BTC'],
                selectedCurrency: selectedCurrency,
              ),
              CryptoCard(
                cryptoCurrency: 'ETH',
                value: isWaiting ? '?' : coinValues['ETH'],
                selectedCurrency: selectedCurrency,
              ),
              CryptoCard(
                cryptoCurrency: 'LTC',
                value: isWaiting ? '?' : coinValues['LTC'],
                selectedCurrency: selectedCurrency,
              ),
            ],
          ),

          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getCoinPicker(),
          ),
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  const CryptoCard({
    super.key,
    this.value,
    this.selectedCurrency,
    required this.cryptoCurrency,
  });

  final String? value;
  final String? selectedCurrency;
  final String cryptoCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoCurrency = $value $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
