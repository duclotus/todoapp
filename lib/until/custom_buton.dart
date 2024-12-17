import 'package:flutter/material.dart';

class CustomButon extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButon({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.yellow,
      child: Text(text),
    );
  }
}
