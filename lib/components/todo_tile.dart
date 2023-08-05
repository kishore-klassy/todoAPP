import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete_forever,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.lightBlueAccent,
          ),
          child: Row(
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged),
              Text(
                taskName,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
