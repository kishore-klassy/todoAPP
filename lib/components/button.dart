import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;

  MyButton({super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(buttonName),
      color: Colors.deepOrangeAccent,
    );
  }
}
