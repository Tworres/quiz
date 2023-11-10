import 'package:flutter/material.dart';
import 'package:quiz/awnser.dart';
import 'package:quiz/question.dart';

class Quiz extends StatelessWidget {
  final int selectedQuestion;
  final List<Map<String, Object>> listQuestionsAndAwnsers;
  final void Function() onRespond;

  const Quiz({
    required this.selectedQuestion,
    required this.listQuestionsAndAwnsers,
    required this.onRespond,
  });

  @override
  Widget build(BuildContext context) {
    List<String> awnsers = listQuestionsAndAwnsers[selectedQuestion].cast()['awnsers'];

    return Column(children: [
      Question(listQuestionsAndAwnsers[selectedQuestion]['question'].toString()),
      ...awnsers.map((e) => Awnser(e, onRespond)),
    ]);
  }
}
