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
const coinapiurl = "http://rest.coinapi.io/v1/exchangerate";
const apikey = "EA662E7C-379B-4E33-A690-CE3BEDE2BC46";

class CoinData {
  Future getcoindata() async {
    String url = '$coinapiurl/BTC/USD/$apikey';
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var decodedata = jsonDecode(response.body);
      var price = decodedata['rate'];
      return price;
    } else {
      print("URL not found");
    }
  }
}
