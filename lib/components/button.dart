import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {

  final VoidCallback onPressed;

  MyButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(149, 72, 243, 1),
                      Color.fromRGBO(149, 72, 243, 1),
                    ], stops: [
                      0.2,
                      0.8,
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  ),
                    child: Center(
                        child: Text(
                      "Create Task",
                      style: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.white),
                    ))
    )));
  }


}


