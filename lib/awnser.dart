import 'package:flutter/material.dart';

class Awnser extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const Awnser(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(onPressed: onPressed, child: Text(text)),
    );
  }
}
