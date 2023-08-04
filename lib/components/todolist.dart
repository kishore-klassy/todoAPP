import 'package:flutter/material.dart';
import 'package:todo/pages/homepage.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: Colors.lightBlueAccent,
    ),
    child: Row(
    children: [
      Checkbox(value: taskCompleted, onChanged: onChanged),
      Text(taskName),
    ],
    ),
    );
  }
}
