import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are awesome! Your score is ${resultScore}';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable! Your score is ${resultScore}';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange?! Your score is ${resultScore}';
    } else {
      resultText = 'You are bad! Your score is ${resultScore}';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 36,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz!'),
            textColor: Colors.red,
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
