import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "Who's your Favorite Coach?",
      'answers': [
        {'text': 'Arsene Wenger', 'score': 40},
        {'text': 'Sir Alex Ferguson', 'score': 30},
        {'text': 'Jurgen Klop', 'score': 20},
        {'text': 'Jose Mourinho', 'score': 10},
      ],
    },
    {
      'questionText': "Who's your Favorite Player?",
      'answers': [
        {'text': 'Thiery Henry', 'score': 99},
        {'text': 'Denis Bergkamp', 'score': 99},
        {'text': 'Mesut Ozil', 'score': 99},
        {'text': 'Robert Pires', 'score': 99},
      ],
    },
    {
      'questionText': "Who's your Favorite Position?",
      'answers': [
        {'text': 'Center Forward', 'score': 40},
        {'text': 'Midfielder', 'score': 30},
        {'text': 'Center Back', 'score': 20},
        {'text': 'Goalkeeper', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion)
            : Result(
                resultScore: _totalScore,
                resetHandler: () => setState(() {
                      _questionIndex = 0;
                      _totalScore = 0;
                    })),
      ),
    );
  }
}
