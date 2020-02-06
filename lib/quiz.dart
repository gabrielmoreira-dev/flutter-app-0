import 'package:flutter/material.dart';
import 'package:test_app/answer.dart';
import 'package:test_app/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionsIndex;
  final Function handleAnswer;

  Quiz({
    @required this.questions,
    @required this.questionsIndex,
    @required this.handleAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionsIndex]['question']),
        ...(questions[questionsIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(answer['text'], () => handleAnswer(answer['score']));
        }).toList(),
      ],
    );
  }
}
