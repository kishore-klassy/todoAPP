import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/components/todo_tile.dart';
import 'package:todoapp/components/dialogbox.dart';
import 'package:todoapp/data/database.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/pages/new_task_page.dart';

class HomePage extends StatefulWidget {
  final Box<dynamic>? box;
  const HomePage({super.key, this.box});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  // reference the hive box
  final _myBox = Hive.box('mybox');
  TodoDataBase db = TodoDataBase();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDataBase();
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
  }

  void createNewTask() {
    _controller.clear();
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controller: _controller,
              onCancel: () => Navigator.of(context).pop(),
              onSave: saveNewTask);
        });
  }

  void editTask(String taskName) {
    _controller.text = taskName;
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: () {
            int index = db.todoList.indexWhere((task) => task[0] == taskName);
            if (index != -1) {
              setState(() {
                db.todoList[index][0] = _controller.text;
              });
              _controller.clear();
              Navigator.of(context).pop();
            }
          },
        );
      },
    );
  }

  @override
  void initState() {
    // if this is the 1st time ever opening the app, then create default data
    if (widget.box!.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 52, 53, 67),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: createNewTask,
      //   child: const Icon(Icons.add),
      // ),
      // appBar: AppBar(
      //   title: const Text(
      //     "TO DO",
      //     style: TextStyle(fontWeight: FontWeight.w500),
      //   ),
      //   backgroundColor: Colors.lightBlueAccent,
      // ),
      // body: Column(
      //   children: [
      //     Expanded(
      //       child: Container(
      //           child: db.todoList.length == 0
      //               ? const Center(child: Text("No Task,Add Some thing"))
      //               : ListView.builder(
      //                   itemCount: db.todoList.length,
      //                   itemBuilder: (context, index) {
      //                     return TodoTile(
      //                       taskName: db.todoList[index][0],
      //                       taskCompleted: db.todoList[index][1],
      //                       onChanged: (value) => checkBoxChanged(value, index),
      //                       deleteFunction: (context) => deleteTask(index),
      //                       editFunction: editTask,
      //                     );
      //                   },
      //                 )),
      //     ),
      //     MaterialButton(
      //         onPressed: () => Navigator.push(context,
      //             MaterialPageRoute(builder: (context) => NewTaskPage(controller: _controller,))),
      //             color: Colors.blue,
      //                  child: Text("Create New Task"),

      //             )
      //   ],
      // ),
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    //Color.fromRGBO(91, 71, 180, 1),
                    Color.fromRGBO(37, 32, 65, 1),
                    Color.fromRGBO(29, 31, 37, 1)
                    // Colors.red,
                    // Colors.blue
                  ],
                  begin: Alignment(0,-1),
                  //end: Alignment(10, 10),
                  stops: [0.30, 1])),
          padding: const EdgeInsets.only(top: 50,left: 20,right:0),
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today's schedule",
                          style: GoogleFonts.aBeeZee(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Monday 19",
                          style: GoogleFonts.aBeeZee(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(154, 115, 239, 1)),
                        ),
                      ],
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      child: Lottie.asset("assets/clips/avatar.json"))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
