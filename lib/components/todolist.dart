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
    return Center(
        child: FractionallySizedBox(
      widthFactor: 0.8, // 80% of the available width
      heightFactor: 0.08, // 60% of the available height
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.lightBlueAccent,
        ),
        child: Row(
          children: [
            Checkbox(value: taskCompleted, onChanged: onChanged),
            Text("Leet Code Problems"),
          ],
        ),
      ),
    ));
  }
}
