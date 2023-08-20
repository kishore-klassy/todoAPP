import 'package:flutter/material.dart';
import 'package:todoapp/components/button.dart';

import 'button.dart';

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
                MyButton( onPressed: onSave),
                SizedBox(width: 10),
                MyButton( onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}