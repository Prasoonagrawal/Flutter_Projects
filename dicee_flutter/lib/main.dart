import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Dice'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: DicePage(),
    ),
  ));
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  @override
  int leftdicenumber = 1;
  int rightdicenumber = 1;
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      leftdicenumber = Random().nextInt(6) + 1;
                    });
                  },
                  child: Image.asset("images/dice$leftdicenumber.png"),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      rightdicenumber = Random().nextInt(6) + 1;
                    });
                  },
                  child: Image.asset("images/dice$rightdicenumber.png"),
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              leftdicenumber = Random().nextInt(6) + 1;
              rightdicenumber = Random().nextInt(6) + 1;
            });
          },
          child: Text(
            "Press here to Roll dise",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
        )
      ],
    );
  }
}
