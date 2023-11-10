import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';
import 'package:quiz/quizResult.dart';

main() {
  runApp(QuizApp());
}

const List<Map<String, Object>> questions = [
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

class _QuizAppState extends State<QuizApp> {
  int _selectedQuestion = 0;
  bool _finished = false;

  void _respond() {
    if ((_selectedQuestion + 1) < questions.length) {
      setState(() {
        _selectedQuestion++;
      });
    } else {
      setState(() {
        _finished = true;
      });
    }
    print(_selectedQuestion);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Quiz')),
        body: _finished
            ? const QuizFinished(text: "Finished")
            : Quiz(selectedQuestion: _selectedQuestion, listQuestionsAndAwnsers: questions, onRespond: _respond),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  _QuizAppState createState() {
    return _QuizAppState();
  }
}
