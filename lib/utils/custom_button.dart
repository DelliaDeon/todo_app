import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),),
      color: Colors.pink.shade500,
    );
  }
}
