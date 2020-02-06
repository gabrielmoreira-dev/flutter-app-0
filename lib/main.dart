import 'package:flutter/material.dart';
import 'package:test_app/quiz.dart';
import 'package:test_app/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'question': 'What\'s your favorite color?',
      'answers': [
        {
          'text': 'Black',
          'score': 10,
        },
        {
          'text': 'Green',
          'score': 1,
        },
        {
          'text': 'Blue',
          'score': 8,
        },
        {
          'text': 'Red',
          'score': 2,
        }
      ]
    },
    {
      'question': 'What\'s your favorite animal?',
      'answers': [
        {
          'text': 'Rabbit',
          'score': 10,
        },
        {
          'text': 'Dog',
          'score': 4,
        },
        {
          'text': 'Cat',
          'score': 1,
        },
        {
          'text': 'Lion',
          'score': 7,
        }
      ],
    },
  ];

  var _questionsIndex = 0;
  var _score = 0;

  void _handleAnswer(score) {
    if (_questionsIndex < _questions.length) {
      setState(() {
        _questionsIndex++;
        _score += score;
      });
    }
  }

  void _restartQuiz(){
    setState(() {
      _questionsIndex = 0;
      _score = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("App"),
        ),
        body: _questionsIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionsIndex: _questionsIndex,
                handleAnswer: this._handleAnswer,
              )
            : Result(_score, this._restartQuiz),
      ),
    );
  }
}
