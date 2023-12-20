import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BestResultWidget extends StatelessWidget {
  late String resultText;

  BestResultWidget(int highScore, {super.key}) {
    resultText = "El resultado a batir es $highScore";
  }

  @override
  Widget build(BuildContext context) {
    return Text(resultText, style: const TextStyle(fontSize: 38));
  }
}