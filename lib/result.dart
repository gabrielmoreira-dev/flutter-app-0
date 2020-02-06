import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function restartQuiz;

  Result(this.score, this.restartQuiz);

  String get result {
    return 'You did ' + score.toString() + ' points';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            result,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlatButton(
            child: Text(
              'Restart Quiz'.toUpperCase(),
            ),
            textColor: Colors.blue,
            onPressed: restartQuiz,
          )
        ],
      ),
    );
  }
}
