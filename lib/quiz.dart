import 'package:flutter/material.dart';
import 'question.dart';
import 'questions-and-answers.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final int randomInt;
  final Function increaseQuestionIndex;
  Quiz(this.randomInt, this.increaseQuestionIndex);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [Question(questionsAndAnswers[randomInt]
        ['questionText'] as String),
          ...(questionsAndAnswers[randomInt]['answers']
          as List<Map<String, Object>>)
              .map((answer) {
            return Answer(
                answer['answerText'] as String, () => increaseQuestionIndex(randomInt, answer['score']));
          }).toList(),]
    );
  }
}
