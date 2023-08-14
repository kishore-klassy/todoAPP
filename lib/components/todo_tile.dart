import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

// ignore: must_be_immutable
class TodoTile extends StatefulWidget {
  final String taskName;
  bool taskCompleted;
  void Function(bool) onChanged;
  Function(BuildContext)? deleteFunction;
  Function(String)? editFunction;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    required this.editFunction,
  });

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: widget.deleteFunction,
            icon: Icons.delete_forever,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
        ]),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black,
              )
            ],
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Row(
            children: [
              // Checkbox(value: taskCompleted, onChanged: onChanged),
              MSHCheckbox(
                size: 30,
                value: widget.taskCompleted,
                colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                  checkedColor: Colors.blue,
                ),
                style: MSHCheckboxStyle.stroke,
                onChanged:widget.onChanged,
              ),
              SizedBox(width: 10,),
              Text(
               style:  widget.taskCompleted==true ?TextStyle(decoration: TextDecoration.lineThrough,fontSize: 20,color: Colors.grey): TextStyle(decoration:TextDecoration.none,fontSize: 20),
                widget.taskName,
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.edit, size: 30),
                onPressed: () => widget.editFunction!(widget.taskName),
              )
            ],
          ),
        ),
      ),
    );
  }
}
