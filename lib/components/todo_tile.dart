import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

// ignore: must_be_immutable
class TodoTile extends StatefulWidget {
  final String taskName;
   final TimeOfDay? taskTime ;
  bool taskCompleted;
  void Function(bool) onChanged;
  Function(BuildContext)? deleteFunction;
  Function(String)? editFunction;

  TodoTile({
    super.key,
    required this.taskName,
     this.taskTime,
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
    // return Padding(
    //   padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
    //   child: Slidable(
    //     endActionPane: ActionPane(motion: const StretchMotion(), children: [
    //       SlidableAction(
    //         onPressed: widget.deleteFunction,
    //         icon: Icons.delete_forever,
    //         backgroundColor: Colors.red,
    //         borderRadius: BorderRadius.circular(12),
    //       ),
    //     ]),
    //     child: Container(
    //       padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    //       decoration: BoxDecoration(
    //         boxShadow: [
    //           const BoxShadow(
    //             blurRadius: 5,
    //             color: Colors.black,
    //           )
    //         ],
    //         borderRadius: BorderRadius.circular(12),
    //         color: Colors.white,
    //       ),
    //       child: Row(
    //         children: [
    //           // Checkbox(value: taskCompleted, onChanged: onChanged),
    //           MSHCheckbox(
    //             size: 30,
    //             value: widget.taskCompleted,
    //             colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
    //               checkedColor: Colors.blue,
    //             ),
    //             style: MSHCheckboxStyle.stroke,
    //             onChanged:widget.onChanged,
    //           ),
    //           const SizedBox(width: 10,),
    //           Text(
    //            style:  widget.taskCompleted==true ?const TextStyle(decoration: TextDecoration.lineThrough,fontSize: 20,color: Colors.grey): const TextStyle(decoration:TextDecoration.none,fontSize: 20),
    //             widget.taskName,
    //           ),
    //           const Spacer(),
    //           IconButton(
    //             icon: const Icon(Icons.edit, size: 30),
    //             onPressed: () => widget.editFunction!(widget.taskName),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    return Container(
      width: MediaQuery.of(context).size.width - 20,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          MSHCheckbox(
            size: 25,
            value: widget.taskCompleted,
            colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                checkedColor: Colors.green,
                uncheckedColor: const Color.fromARGB(255, 115, 112, 112)),
            style: MSHCheckboxStyle.stroke,
            onChanged: widget.onChanged,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Slidable(
              startActionPane:
                  ActionPane(motion: const StretchMotion(), children: [
                SlidableAction(
                  autoClose: true,
                  onPressed: widget.deleteFunction,
                  icon: Icons.edit,
                  backgroundColor: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                )
              ]),
              endActionPane:
                  ActionPane(motion: const StretchMotion(), children: [
                SlidableAction(
                  onPressed: widget.deleteFunction,
                  icon: Icons.delete_forever,
                  backgroundColor: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
              ]),
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: widget.taskCompleted == true
                        ? const Color.fromRGBO(77, 125, 237, 1)
                        : const Color.fromRGBO(41, 46, 60, 1)),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Icon(
                        Icons.access_alarms_outlined,
                        color: Colors.orange,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          constraints: const BoxConstraints(minWidth: 150),
                          child: Text(
                            widget.taskName,
                            style: GoogleFonts.preahvihear(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                       Text(
                        widget.taskTime!=null ?
                        widget.taskTime!.format(context).toString() : "",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
