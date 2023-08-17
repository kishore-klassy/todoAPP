import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/components/button.dart';

class CreateNewTaskPage extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  CreateNewTaskPage({
    Key? key,
    required this.controller,
    required this.onSave,
  }) : super(key: key);

  @override
  State<CreateNewTaskPage> createState() => _CreateNewTaskPageState();
}

class _CreateNewTaskPageState extends State<CreateNewTaskPage> {
  TimeOfDay? _timeOfDay;
  void _showTimePicker() async {
    final selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      if (selectedTime != null) {
        _timeOfDay = selectedTime;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false ,
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                //Color.fromRGBO(91, 71, 180, 1),
                Color.fromRGBO(37, 32, 65, 1),
                Color.fromRGBO(29, 31, 37, 1)
                // Colors.red,
                // Colors.blue
              ],
              begin: Alignment(0, -1),
              //end: Alignment(10, 10),
              stops: [0.30, 1])),
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
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
            "Create",
            style: GoogleFonts.aBeeZee(
                fontSize: 30, fontWeight: FontWeight.w800, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "New Task",
            style: GoogleFonts.aBeeZee(
                fontSize: 30, fontWeight: FontWeight.w800, color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
              style: const TextStyle(color: Colors.white),
              showCursor: true,
              cursorColor: Colors.grey,
              cursorOpacityAnimates: true,
              controller: widget.controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                hintText: "Task Title",
                hintStyle:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 239, 237, 237))),
                fillColor: Color.fromARGB(255, 41, 46, 60),
                filled: true,
              )),
          const SizedBox(
            height: 15,
          ),
          Text("Task type",
              style: GoogleFonts.aBeeZee(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800)),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 39, 101, 250)),
                child: Text(
                  "Important",
                  style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 136, 137, 139)),
                child: Text(
                  "Planned",
                  style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
         
                Text("Choose time",
                  style: GoogleFonts.aBeeZee(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: _showTimePicker,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 200),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey)),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.date_range_rounded,
                          color: Colors.grey,
                        ),
                        Text(
                          "Select a time",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                        )
                      ]),
                ),
              ),
          const SizedBox(
            height: 100,
          ),

          const Spacer(),
          GestureDetector(
              onTap: widget.onSave,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
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
                  //   child: Center(
                  //       child: Text(
                  //     "Create Task",
                  //     style: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.white),
                  //   )),
                  // ),
                  child: MyButton(buttonName: "Create task", onPressed: widget.onSave),
                ),
              ))
        ],
      ),
    ));
  }
}





// AlertDialog(
//       content: Container(
//         height: 200,
//         margin: const EdgeInsets.symmetric(horizontal: 10),
//         child: Column(
//           children: [
//             TextField(
//               controller: widget.controller,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Add a new Task",
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             MaterialButton(
//               child: const Text("Time"),
//               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
//               color: Colors.blue,
//               onPressed: _showTimePicker,
//             ),
//             if (_timeOfDay != null)
//               Container(child: Text(_timeOfDay!.format(context).toString())),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 MyButton(buttonName: "Save", onPressed: widget.onSave),
//                 const SizedBox(width: 10),
//                 MyButton(buttonName: "Cancel", onPressed: widget.onCancel),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
