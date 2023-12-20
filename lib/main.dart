import 'package:flutter/material.dart';
import 'package:tarea1dart/Screens/home_tarea1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tarea 1 Flutter',
      home: Home(title: "HomePage"),
    );
  }
}
