import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {required this.color,
      required this.textColor,
      required this.title,
      required this.onPressed});

  final Color color;
  final Color textColor;
  final Color redColor = const Color.fromARGB(255, 112, 12, 12);
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(27),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200,
          height: 65,
          child: Text(
            title,
            style: GoogleFonts.robotoCondensed(
              letterSpacing: 1,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
