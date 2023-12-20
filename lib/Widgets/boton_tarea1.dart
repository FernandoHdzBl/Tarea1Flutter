import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(       
        maximumSize: const Size(300, 90),
        backgroundColor: Colors.yellow,
        textStyle: const TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: const Text('Empezar a Jugar'),
    );
  }
}