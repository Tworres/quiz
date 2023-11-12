import 'package:flutter/material.dart';
import 'package:quiz/awnser.dart';
import 'package:quiz/question.dart';

class Quiz extends StatelessWidget {
  final int selectedQuestion;
  final List<Map<String, Object>> listQuestionsAndAwnsers;
  final void Function(int) onRespond;

  const Quiz({
    required this.selectedQuestion,
    required this.listQuestionsAndAwnsers,
    required this.onRespond,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> awnsers = listQuestionsAndAwnsers[selectedQuestion].cast()['awnsers'];

    return Column(children: [
      Question(listQuestionsAndAwnsers[selectedQuestion]['question'].toString()),
      ...awnsers.map((resp) {
        return Awnser(
          resp['text'] as String,
          () => onRespond(int.parse(resp['points'].toString())),
        );
      }).toList(),
    ]);
  }
}
