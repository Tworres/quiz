import 'package:flutter/material.dart';

class QuizFinished extends StatelessWidget {
  final String text;

  const QuizFinished({required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text, style: const TextStyle(fontSize: 28)),
    );
  }
}
