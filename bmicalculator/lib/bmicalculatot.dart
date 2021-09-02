import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculator {
  Calculator({required this.height, required this.weight});

  final int height;
  final int weight;
  double _bmi = 0;
  String calculation() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25)
      return 'OverWeight';
    else if (_bmi > 18.5)
      return 'Normal';
    else
      return 'UnderWeight';
  }

  String getInterpretation() {
    if (_bmi >= 25)
      return 'Try to exercise and diet';
    else if (_bmi > 18.5)
      return 'All Good. Miantain this';
    else
      return 'Eat moreeee';
  }

  Color getcolour() {
    if (_bmi >= 25)
      return Colors.red;
    else if (_bmi > 18.5)
      return Colors.green;
    else
      return Colors.yellow;
  }
}
