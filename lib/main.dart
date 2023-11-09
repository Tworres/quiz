import 'package:flutter/material.dart';
import 'package:quiz/question.dart';
import 'package:quiz/awnser.dart';

main() {
  runApp(QuizApp());
}

class _QuizAppState extends State<QuizApp> {
  int _selectedQuestion = 0;

  void _respond() {
    setState(() {
      _selectedQuestion++;
    });
    print(_selectedQuestion);
  }

  final List<Map<String, Object>> questions = [
    {
      "question": "question 1",
      "awnsers": ['awnser 1', 'awnser 2', 'awnser 3'],
    },
    {
      "question": "question 2",
      "awnsers": ['awnser 3', 'awnser 4', 'awnser 5'],
    },
    {
      "question": "question 3",
      "awnsers": ['awnser 4', 'awnser 5', 'awnser 6']
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<String> awnsers = questions[_selectedQuestion].cast()['awnsers'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Quiz')),
        body: Column(children: [
          Question(questions[_selectedQuestion]['question'].toString()),
          ...awnsers.map((e) => Awnser(e, _respond)),
        ]),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  _QuizAppState createState() {
    return _QuizAppState();
  }
}
