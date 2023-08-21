import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/components/button.dart';

import '../components/save_cancel_btn.dart';

class EditTaskPage extends StatefulWidget {
  final TextEditingController controller;
  VoidCallback onSave; 
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
            "Edit Task",
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

        
   
         
           Column(
          children: [
        
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SaveCancelBtn(buttonName: "Save", onPressed: widget.onSave),
                const SizedBox(width: 10),
                SaveCancelBtn(buttonName: "Cancel", onPressed:Navigator.of(context).pop),
              ],
            ),
          ],
        ),
        
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
