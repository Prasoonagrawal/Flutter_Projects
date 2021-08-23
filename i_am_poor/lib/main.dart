import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[800],
        appBar: AppBar(
          title: Text('I Am Poor'),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/poor.png'),
          ),
        ),
      ),
    ),
  );
}
