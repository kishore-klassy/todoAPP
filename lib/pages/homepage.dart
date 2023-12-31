import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/components/create_task_page.dart';
import 'package:todoapp/data/database.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/pages/signup_page.dart';

import '../components/todo_tile.dart';

class HomePage extends StatefulWidget {
  final Box<dynamic>? box;
  const HomePage({super.key, this.box});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  int _currentIndex = 0;
  // reference the hive box
  // ignore: unused_field
  final _myBox = Hive.box('mybox');
  TodoDataBase db = TodoDataBase();
  void _refreshTaskList() {
    setState(() {
      // Reload the task list from the database
      db.loadData();
    });
  }
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 1) {
        // Navigate to AddTaskPage
        var materialPageRoute = MaterialPageRoute(
              builder: (context) => CreateNewTaskPage(
                    controller: _controller,
                    onSave: saveNewTask,
                  ));
        Navigator.push(
          context,
          materialPageRoute, // Create AddTaskPage
        ).then((value) {
          // Handle the result of the pushed page if needed
          if (value != null && value is bool && value) {
            // If the user saved a new task, refresh the list
            _refreshTaskList();
          }
        });;
      } else if (index == 2) {
        // Navigate to SettingsPage
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SignUpPage(box: widget.box,)), // Create SettingsPage
        );
      }
    });

    // Rest of the navigation logic
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDataBase();
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false,_timeOfDay]);
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
          return CreateNewTaskPage(
              controller: _controller, onSave: saveNewTask);
        });
  }

  void editTask(String taskName) {
    _controller.text = taskName;
    showDialog(
      context: context,
      builder: (context) {
        return CreateNewTaskPage(
          controller: _controller,
          onSave: () async {
            int index = db.todoList.indexWhere((task) => task[0] == taskName);
            if (index != -1) {
              db.todoList[index][0] = _controller.text;

              _controller.clear();
              Navigator.of(context).pop();
              db.updateDataBase();
              await Future.delayed(Duration.zero); // Delay the setState() call

              setState(() {});
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
  TimeOfDay? _timeOfDay = TimeOfDay(hour:5, minute: 23);
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
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _onTabTapped,
          currentIndex: _currentIndex,
          backgroundColor: Color.fromRGBO(29, 31, 37, 1),
          elevation: 3,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 30,
                  shadows: [
                    Shadow(
                        blurRadius: 6, color: Colors.white, offset: Offset.zero)
                  ],
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/iconadd.png",
                  width: 50,
                ),
                backgroundColor: Colors.purple,
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Colors.grey,
                  size: 30,
                ),
                activeIcon: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 30,
                  shadows: [
                    Shadow(
                        blurRadius: 6, color: Colors.white, offset: Offset.zero)
                  ],
                ),
                label: ""),
          ]),

      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(37, 32, 65, 1),
                  Color.fromRGBO(29, 31, 37, 1)
                ],
                begin: Alignment(0, -1),
                //end: Alignment(10, 10),
                stops: [0.30, 1])),
        child: Container(
            padding: const EdgeInsets.only(top: 50, left: 20),
            margin: EdgeInsets.only(right: 10),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(
                      parent: NeverScrollableScrollPhysics()),
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
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Monday 19",
                            style: GoogleFonts.aBeeZee(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(154, 115, 239, 1)),
                          ),
                        ],
                      ),
                      SizedBox(
                          width: 150,
                          height: 150,
                          child: Lottie.asset("assets/clips/avatar.json"))
                    ],
                  ),
                ),
                
                Expanded(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: db.todoList.length == 0
                          ? Center(
                              child: Column(
                              children: [
                                Lottie.asset(
                                    "assets/clips/notaskanimation.json"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "No Task,Create below!",
                                  style: GoogleFonts.itim(
                                      fontSize: 30,
                                      color: const Color.fromARGB(
                                          255, 166, 107, 177)),
                                )
                              ],
                            ))
                          : ListView.builder(
                              itemCount: db.todoList.length,
                              itemBuilder: (context, index) {
                                return TodoTile(
                                  taskName: db.todoList[index][0],
                                 // taskTime:db.todoList[index][2],
                                  taskCompleted: db.todoList[index][1],
                                  onChanged: (value) =>
                                      checkBoxChanged(value, index),
                                  deleteFunction: (context) =>
                                      deleteTask(index),
                                  editFunction: editTask,
                                );
                              },
                            )),
                ),
              ],
            )),
      ),
    );
  }
}
