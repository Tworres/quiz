import 'package:flutter/material.dart';

class QuizFinished extends StatelessWidget {
  final int points;
  final void Function() onReset;

  QuizFinished({required this.points, required this.onReset});

  String get fraseResultado {
    if (points <= 3) return 'less or equal 3';
    if (points <= 6) return 'bigger than 3 and less or equal 6';
    if (points <= 9) return 'bigger than 6 and less or equal 9';
    return 'well, you break the points counter, congratulations';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(fraseResultado, style: const TextStyle(fontSize: 28)),
          ElevatedButton(onPressed: onReset, child: const Text("Reset Quiz"))
        ],
      ),
    );
  }
}
