import 'package:flutter/material.dart';
import 'package:bmicalculator/inputpage.dart';

void main() => runApp(BMICalculatoer());

class BMICalculatoer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF1D1E33),
        scaffoldBackgroundColor: Color(0xFF0D1117),
      ),
      home: InputPage(),
    );
  }
}
