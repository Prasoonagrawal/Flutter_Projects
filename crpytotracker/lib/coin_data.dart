import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const coinapiurl = 'http://rest.coinapi.io/v1/exchangerate';
const apikey = '09F1C7C5-BCE9-47DC-A309-15AFF7A0A3F1';
String curency = '';

class CoinData {
  Future getcoindata(String selectCurrency) async {
    String url =
        'http://rest.coinapi.io/v1/exchangerate/BTC/$selectCurrency?apikey=09F1C7C5-BCE9-47DC-A309-15AFF7A0A3F1';

    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var decodedata = jsonDecode(response.body);
      var price = decodedata['rate'];
      print(price);
      return price;
    } else {
      print("URL not found");
      throw 'Problem with the get request';
    }
  }
}
