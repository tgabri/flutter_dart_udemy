import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'question': 'What is your favourite color?',
        'answers': ['Red', 'Black', 'Blue', 'Green']
      },
      {
        'question': 'What is your favourite animal?',
        'answers': ['Dog', 'Cat', 'Dino', 'Lion']
      },
      {
        'question': 'Who is your favourite actor/actress?',
        'answers': [
          'Brad Pit',
          'Angelina Jolie',
          'Jason Statham',
          'Robert De Niro'
        ]
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test App'),
        ),
        body: Column(
          children: <Widget>[
            Question(
              questions[_questionIndex]['question'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
