import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/save_cancel_btn.dart'; // Import custom SaveCancelBtn component

class EditTaskPage extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSave; // Callback for save action

  EditTaskPage({
    Key? key,
    required this.onSave,
    required this.controller,
  }) : super(key: key);

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        // Main container for the Edit Task page
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(37, 32, 65, 1),
              Color.fromRGBO(29, 31, 37, 1),
            ],
            begin: Alignment(0, -1),
            stops: [0.30, 1],
          ),
        ),
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              // Back button to navigate back
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Edit Task", // Page title
              style: GoogleFonts.aBeeZee(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              // Text field for editing task title
              style: const TextStyle(color: Colors.white),
              showCursor: true,
              cursorColor: Colors.grey,
              cursorOpacityAnimates: true,
              controller: widget.controller, // Use the provided controller
              decoration: const InputDecoration(
                // Text field decoration
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                hintText: "Task Title",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                fillColor: Color.fromARGB(255, 41, 46, 60),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Save and Cancel buttons using SaveCancelBtn component
                    SaveCancelBtn(buttonName: "Save", onPressed: widget.onSave),
                    const SizedBox(width: 10),
                    SaveCancelBtn(
                      buttonName: "Cancel",
                      onPressed: Navigator.of(context).pop,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
