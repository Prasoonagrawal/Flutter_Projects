import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';
import 'buttomButton.dart';
import 'inputpage.dart';
import 'resuable_card.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.resultText,
      required this.Interpretation});

  final String bmiResult;
  final String resultText;
  final String Interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("BMI Calculator"),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Text(
                "Your Result",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: kresultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    Interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttomTitle: "CALCULATE AGAIN",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
