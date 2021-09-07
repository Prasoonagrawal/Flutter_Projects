import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:climateapp/services/location.dart';
import 'package:climateapp/services/networking.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getlocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper helper = NetworkHelper(
        'https://samples.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=148118c920f5cf579fcbb1d02f63d0e9');

    var weatherData = await helper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
