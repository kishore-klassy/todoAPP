import 'package:flutter/material.dart';
import 'package:todoapp/components/button.dart';

class DialogBox extends StatefulWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    Key? key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
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
    return AlertDialog(
      content: Container(
        height: 200,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            TextField(
              controller: widget.controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new Task",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              child: const Text("Time"),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              color: Colors.blue,
              onPressed: _showTimePicker,
            ),
            if (_timeOfDay != null)
              Container(child: Text(_timeOfDay!.format(context).toString())),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(buttonName: "Save", onPressed: widget.onSave),
                const SizedBox(width: 10),
                MyButton(buttonName: "Cancel", onPressed: widget.onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
