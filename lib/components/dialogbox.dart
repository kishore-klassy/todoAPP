import 'package:flutter/material.dart';

class DialogBox extends StatefulWidget {
  const DialogBox({super.key});

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height:250 ,
        child: Column(children: [
          //get user input
          TextField(),
          
          // save button and cancel button

          
        ]),
      ),
    );
  }
}