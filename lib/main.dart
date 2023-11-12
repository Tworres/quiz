import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';
import 'package:quiz/quizResult.dart';

main() {
  runApp(QuizApp());
}

const List<Map<String, Object>> questions = [
  {
    "question": "question 1",
    "awnsers": [
      {"text": 'awnser 1', "points": "1"},
      {"text": 'awnser 2', "points": "2"},
      {"text": 'awnser 3', "points": "3"},
    ],
  },
  {
    "question": "question 2",
    "awnsers": [
      {"text": 'awnser 3', "points": "1"},
      {"text": 'awnser 4', "points": "2"},
      {"text": 'awnser 5', "points": "3"},
    ],
  },
  {
    "question": "question 3",
    "awnsers": [
      {"text": 'awnser 4', "points": "1"},
      {"text": 'awnser 5', "points": "2"},
      {"text": 'awnser 6', "points": "3"},
    ]
  },
];

class _QuizAppState extends State<QuizApp> {
  int _selectedQuestion = 0;
  int _pointsTotal = 0;
  bool _finished = false;

  void _respond(int points) {
    setState(() {
      if ((_selectedQuestion + 1) < questions.length) {
        _selectedQuestion++;
      } else {
        _finished = true;
      }
      _pointsTotal += points;
    });
    print(_selectedQuestion);
  }

  void _resetQuiz() {
    setState(() {
      _selectedQuestion = 0;
      _pointsTotal = 0;
      _finished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Quiz'), centerTitle: true),
        body: _finished
            ? QuizFinished(points: _pointsTotal, onReset: _resetQuiz)
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
