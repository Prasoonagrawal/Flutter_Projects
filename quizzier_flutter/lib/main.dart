import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekepper = [];
  void checkAnswer(bool userAnswer) {
    bool answer_option = quizBrain.GetAnswer();
    setState(() {
      if (answer_option == true) {
        scorekepper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scorekepper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      if (quizBrain.isFinshed() == true) {
        Alert(context: context, title: "Quiz Finished", desc: "End Bye Bye..")
            .show();
        quizBrain.reset();
        scorekepper = [];
      }
      quizBrain.GetQuestionNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.GetQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                "True",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                "False",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Row(
          children: scorekepper,
        )
      ],
    );
  }
}
