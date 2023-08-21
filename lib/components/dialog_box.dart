import 'package:flutter/material.dart';
import 'package:todoapp/components/button.dart';
import 'package:todoapp/components/create_task_page.dart';
import 'package:todoapp/components/save_cancel_btn.dart';

import '../pages/edit_task_page.dart';

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
    return 
       EditTaskPage(
        onSave:onSave,
        controller: controller,
      );
  }}
  
  
//   margin: const EdgeInsets.symmetric(horizontal: 10),
//         child: Column(
//           children: [
//             TextField(
//               controller: controller,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Add a new Task",
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SaveCancelBtn(buttonName: "Save", onPressed: onSave),
//                 const SizedBox(width: 10),
//                 SaveCancelBtn(buttonName: "Cancel", onPressed: onCancel),
//               ],
//             ),
//           ],
//         ),
//       ),
   
//   }
// }
