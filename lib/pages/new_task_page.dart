import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/pages/homepage.dart';
import 'package:todoapp/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class NewTaskPage extends StatefulWidget {
  final TextEditingController controller;
  const NewTaskPage({super.key, required this.controller});

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: const Color.fromARGB(255, 52, 53, 67),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () => Navigator.of(context).pop()),
                  Text(
                    "Todays Task",
                    style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                  // Container(
                  //   child: Lottie.network("https://lottie.host/?file=3183d921-6407-4e35-8889-bc1ced558933/6BjNGjz1Pb.json",
                  //       width: 20, height: 20),
                  // ),
                  const Icon(
                    Icons.account_circle_rounded,
                    color: Colors.white,
                    size: 40,
                  )
                ],
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Create",
                                  style: GoogleFonts.aBeeZee(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text("New Task",
                                    style: GoogleFonts.aBeeZee(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600)),
                              ]),
                        ),
                        Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Task title",
                                  style: GoogleFonts.aBeeZee(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                TextField(
                                  controller: widget.controller,
                                  decoration: const InputDecoration(
                                      hintText: "Add Task Name....",
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 239, 237, 237))),
                                      fillColor:
                                          Color.fromARGB(255, 239, 237, 237),
                                      filled: true,
                                      border: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide.none)),
                                ),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Category",
                            style: GoogleFonts.aBeeZee(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 239, 237, 237),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.person_outline_sharp,
                                          size: 50,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Personal",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20),
                                        )
                                      ]),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[350],
                                      borderRadius: BorderRadius.circular(12)),
                                  child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.groups_2,
                                          size: 50,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Teams",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20),
                                        )
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Center(child:Container(
                        //   height: 49,
                        //   width: 50,
                        //   child: Lottie.asset(
                        //       "assets/clips/animation_lks6kj22.json"),
                        // )),
                      ],
                    ),
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
