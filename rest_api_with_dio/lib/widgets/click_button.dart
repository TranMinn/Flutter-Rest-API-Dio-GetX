import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClickButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ClickButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 15, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.all(15),
      ),
    );
  }
}
