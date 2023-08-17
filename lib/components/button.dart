import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;

  MyButton({super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(colors: [
                      Color.fromRGBO(149, 72, 243, 1),
                      Color.fromRGBO(149, 72, 243, 1),
                    ], stops: [
                      0.2,
                      0.8,
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  ),
                    child: Center(
                        child: Text(
                      buttonName,
                      style: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.white),
                    ))
    )));
  }


}


