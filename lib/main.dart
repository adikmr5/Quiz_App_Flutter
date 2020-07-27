import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questions = [
    {
      'question': 'What\'s your favorite animal?',
      'answer': [
        {'text': 'dog', 'score': 10},
        {'text': 'rabbit', "score": 10},
        {'text': 'donkey', "score": 5},
        {'text': 'horse', "score": 30},
      ]
    },
    {
      'question': 'What\'s your favorite food?',
      'answer': [
        {'text': 'pizza', 'score': 10},
        {'text': 'pasta', "score": 10},
        {'text': 'noodle', "score": 5},
        {'text': 'pasta', "score": 30},
      ]
    }
  ];
  int question = 0;
  int _totalscore = 0;
  void reset() {
    question = 0;
    _totalscore = 0;
    print(question);
  }

  void _answedQuestion(int score) {
    setState(() {
      question += 1;
    });
    _totalscore += score;
    print(question);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('hello'),
            ),
            body: question < questions.length
                ? Column(
                    children: <Widget>[
                      Question(questions[question]['question']),
                      ...(questions[question]['answer'] as List<Map>)
                          .map((e) => Answer(
                              () => _answedQuestion(e['score']), e['text']))
                          .toList(),
                    ],
                  )
                : Center(
                    child: Column(
                      children: <Widget>[
                        Text("Done!" + _totalscore.toString()),
                        RaisedButton(
                          onPressed: reset,
                          child: Text("RESET"),
                        )
                      ],
                    ),
                  )));
  }
}
