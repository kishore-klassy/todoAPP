import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SaveCancelBtn extends StatelessWidget {
  final String buttonName;
  VoidCallback onPressed;

  SaveCancelBtn({super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
         padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
             decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(colors: [
                      Color.fromRGBO(138, 49, 246, 1),
                      Color.fromRGBO(149, 99, 211, 1),
                      Color.fromRGBO(138, 49, 246, 1),
                    ], stops: [
                      0.2,
                      0.8,
                      1
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  ),
        
        child: Text(buttonName,style: GoogleFonts.preahvihear(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),)),
    );
  }
}
