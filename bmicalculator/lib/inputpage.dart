import 'dart:math';
import 'package:bmicalculator/main.dart';

import 'RoundButtonClass.dart';
import 'result_page.dart';
import 'buttomButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'resuable_card.dart';
import 'bmicalculatot.dart';
import 'constants.dart';

enum Gender {
  male,
  female,
  None,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCaedColour = KInactiveCardColor;
  Color femaleCaedColour = KInactiveCardColor;
  Gender SelectedGender = Gender.None;
  int height = 180;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("BMI Calculator")),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          SelectedGender = Gender.male;
                        });
                      },
                      colour: SelectedGender == Gender.male
                          ? kActiveCardColor
                          : KInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.male,
                        text: "Male",
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          SelectedGender = Gender.female;
                        });
                      },
                      colour: SelectedGender == Gender.female
                          ? kActiveCardColor
                          : KInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.female,
                        text: "Female",
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(),
                            style: kLabelTextStyleForNumber),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: KInactiveCardColor,
                          activeTrackColor: Colors.white,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          thumbColor: kBottomcontainerColor,
                          overlayColor: kOverlayColor),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 320,
                          onChanged: (double newvalue) {
                            setState(() {
                              height = newvalue.round();
                            });
                            ;
                          }),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kLabelTextStyleForNumber,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kLabelTextStyleForNumber,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttomTitle: "CALCULATE",
              onTap: () {
                Calculator Mybmi = Calculator(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: Mybmi.calculation(),
                      Interpretation: Mybmi.getInterpretation(),
                      resultText: Mybmi.getResult(),
                      colors: Mybmi.getcolour(),
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
