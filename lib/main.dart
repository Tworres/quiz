import 'package:flutter/material.dart';
import 'package:quiz/question.dart';
import 'package:quiz/awnser.dart';

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

  // EVENT WHEN ANWSER QUESTIONS
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
    List<String> awnsers = questions[_selectedQuestion].cast()['awnsers'];

    // BODY QUESTIONS
    Widget bodyQuestion = Column(children: [
      Question(questions[_selectedQuestion]['question'].toString()),
      ...awnsers.map((e) => Awnser(e, _respond)),
    ]);

    // BODY FINISHED
    Widget bodyFinished = const Center(
      child: Text("Finished", style: TextStyle(fontSize: 28)),
    );

    // APP
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Quiz')),
        body: _finished ? bodyFinished : bodyQuestion,
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  _QuizAppState createState() {
    return _QuizAppState();
  }
}
