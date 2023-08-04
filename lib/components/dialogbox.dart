import 'dart:async';
import 'package:todo/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:todo/components/button.dart';
import 'package:todo/data/database.dart';
class DialogBox extends StatefulWidget {
  final TextEditingController controller;

  DialogBox({Key? key, required this.controller}) : super(key: key);

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 120,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new Task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  buttonName: "Save",
                  onPressed: () {
                    setState(() {
                      todoList.add([widget.controller.text, false]);
                    });
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(width: 10),
                MyButton(
                  buttonName: "Cancel",
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
