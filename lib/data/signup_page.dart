import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/components/signin_button.dart';
import 'package:todoapp/pages/homepage.dart';

class SignUpPage extends StatefulWidget {
  final Box<dynamic>? box;

  const SignUpPage({super.key,this.box});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(91, 71, 180, 1),
                  Color.fromRGBO(44, 38, 57, 1),
                  Color.fromRGBO(29, 31, 37, 1)
                  // Colors.red,
                  // Colors.blue
                ],
                begin: Alignment.topLeft,
                stops: [0.04, 0.60, 1])),
        padding: const EdgeInsets.only(top: 50),
        height: double.infinity,
        width: double.maxFinite,
        child: Column(
          children: [
            Container(
                width: 400,
                height: 400,
                child: Lottie.asset("assets/clips/animation_llchwdpd.json")),
            Text(
              "Organize your works",
              style: GoogleFonts.aBeeZee(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Let's organize your works with priority",
              style: GoogleFonts.aBeeZee(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[500]),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "and do everything without stress",
              style: GoogleFonts.aBeeZee(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[500]),
            ),
            const SizedBox(
              height: 20,
            ),
            const SignInButton(
              imageUrl: "assets/images/emaillogo.png",
              name: "Continue with email",
            ),
            const SignInButton(
              imageUrl: "assets/images/googlelogo.png",
              name: "Continue with Google",
            ),
            GestureDetector(
              child: const SignInButton(
                imageUrl: "assets/images/skipfornow.png",
                name: "Continue without signing in",
              ),
              onTap: () =>Navigator.push(context, MaterialPageRoute(builder:(context)=>HomePage(box: widget.box,))),
            ),
          ],
        ),
      ),
    );
  }
}
