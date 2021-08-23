import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'resuable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const bottomcontainerColor = Color(0xFFF75C1E);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("BMI Calculator")),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.male,
                        text: "Male",
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColor,
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
                colour: activeCardColor,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(colour: activeCardColor),
                  )
                ],
              ),
            ),
            Container(
              color: bottomcontainerColor,
              width: double.infinity,
              height: bottomContainerHeight,
              margin: EdgeInsets.only(top: 10),
            )
          ],
        ));
  }
}