import 'package:bmicalculator/result_page.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttomTitle});
  final Function()? onTap;
  final String buttomTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttomTitle,
            style: klargeboxtext,
          ),
        ),
        color: kBottomcontainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        margin: EdgeInsets.only(top: 10),
      ),
    );
  }
}
