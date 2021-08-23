import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text("I am Super Rich"),
          backgroundColor: Colors.grey[900],
          centerTitle: true,
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/diamond.jpg'),
          ),
        ),
      ),
    ),
  );
}
