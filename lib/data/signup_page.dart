import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/components/signin_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(91,71,180,1),
                  Color.fromRGBO(44, 38, 57, 1),
                  Color.fromRGBO(29, 31, 37, 1)
                  // Colors.red,
                  // Colors.blue
                ],
                begin: Alignment.topLeft,
                stops: [0.04,0.60, 1])),
        padding: EdgeInsets.only(top: 50),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          children: [
            Icon(
              Icons.task_rounded,
              size: 400,
            ),
            Text(
              "Organize your works",
              style: GoogleFonts.aBeeZee(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Let's organize your works with priority",
              style: GoogleFonts.aBeeZee(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[500]),
            ),
            SizedBox(height: 5,),
            Text(
              "and do everything without stress",
              style: GoogleFonts.aBeeZee(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[500]),
            ),
            SizedBox(height: 40,),
            SignInButton(imageUrl: "assets\images\facebooklogo.png",name: "Continue with Facebook"),
            SignInButton(imageUrl: "assets\images\facebooklogo.png",name: "Continue with Google",),
            SignInButton(imageUrl: "assets\images\facebooklogo.png",name: "Continue with email",)
          ],
        ),
      ),
    );
  }
}
