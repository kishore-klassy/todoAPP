import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInButton extends StatefulWidget {
  final String imageUrl;
  final String name;
  const SignInButton({super.key, required this.imageUrl, required this.name});

  @override
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromRGBO(41, 46, 60, 1)),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(widget.imageUrl)),
          
          Text(widget.name,
              style: GoogleFonts.aBeeZee(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white))
        ],
      ),
    );
  }
}
