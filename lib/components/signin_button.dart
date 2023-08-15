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
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromRGBO(41, 46, 60, 1)),
      child: Row(
        children: [
          Image.asset(widget.imageUrl),
          Image.asset("assets/images/facebooklogo.png"),
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
