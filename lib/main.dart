import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'question': 'What is your favourite color?',
      'answers': [
        {'text': 'Red', 'score': 7},
        {'text': 'Black', 'score': 10},
        {'text': 'Blue', 'score': 4},
        {'text': 'Green', 'score': 4},
      ],
    },
    {
      'question': 'What is your favourite animal?',
      'answers': [
        {'text': 'Dog', 'score': 3},
        {'text': 'Cat', 'score': 9},
        {'text': 'Dino', 'score': 1},
        {'text': 'Lion', 'score': 3},
      ],
    },
    {
      'question': 'Who is your favourite actor/actress?',
      'answers': [
        {'text': 'Brad Pit', 'score': 6},
        {'text': 'Angelina Jolie', 'score': 1},
        {'text': 'Jason Statham', 'score': 4},
        {'text': 'Robert De Niro', 'score': 2},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
    if (_questionIndex < _questions.length) {
    } else {
      print('You have done it!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
