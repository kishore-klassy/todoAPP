import 'dart:async';
import 'package:todo/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:todo/components/button.dart';
import 'package:todo/data/database.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {Key? key,
      required this.controller,
      required this.onSave,
      required this.onCancel,

      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 120,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new Task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(buttonName: "Save", onPressed: onSave),
                SizedBox(width: 10),
                MyButton(buttonName: "Cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
