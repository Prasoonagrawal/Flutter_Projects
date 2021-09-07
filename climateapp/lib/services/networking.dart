import 'dart:convert';
import 'package:climateapp/services/location.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    //  print(response.body);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
