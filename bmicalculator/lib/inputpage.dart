import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'resuable_card.dart';

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
                    Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 420,
                        activeColor: kBottomcontainerColor,
                        inactiveColor: KInactiveCardColor,
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                          ;
                        })
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
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(colour: kActiveCardColor),
                  )
                ],
              ),
            ),
            Container(
              color: kBottomcontainerColor,
              width: double.infinity,
              height: kBottomContainerHeight,
              margin: EdgeInsets.only(top: 10),
            )
          ],
        ));
  }
}
