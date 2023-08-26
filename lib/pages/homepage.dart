import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';//this google_font package is to 
import 'package:intl/intl.dart';//this intl is used for formating 
import 'package:lottie/lottie.dart'; //this lottie package is for animations
import 'package:todoapp/pages/create_task_page.dart';
import 'package:todoapp/data/database.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../components/dialog_box.dart';
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

  void _onTabTapped(int index) {
  setState(() {
    _currentIndex = index;
      if (index == 1) {
    // Navigate to AddTaskPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateNewTaskPage(controller: _controller,onSave: saveNewTask,)), // Create AddTaskPage
    );

  }
  });

  // Rest of the navigation logic
}

  //This method is to change the state of the checkbox whether the task is completed or not 
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDataBase();
  }

  // save new task and will add the new task in the database
  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }
  //this method will remove the task when delete button is pressed
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
  }
 //this method will create new task and return the createNewATaskPage with parameter controller and saveNewTask function
  void createNewTask() {
    _controller.clear();
    showDialog(
        context: context,
        builder: (context) {
          return CreateNewTaskPage(
              controller: _controller, onSave: saveNewTask);
        });
  }

  //this method will return the editTaskPage and  will update  on the database 
void editTask(String taskName) {
  _controller.text = taskName;
  showDialog(
    context: context,
    builder: (context) {
      return DialogBox(
      controller: _controller,
      onCancel: () => Navigator.of(context).pop(), //when cancel button is clicked the current page will get poped and the previous page will be displayed
      onSave: () {
        int index = db.todoList.indexWhere((task) => task[0] == taskName);//task[0] is the name of the task 
        if (index != -1) {
          setState(() {
            db.todoList[index][0] = _controller.text; //todoList[index][0]  is the name of the task
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
    if (widget.box?.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }

    super.initState();
  }
  String getFormattedDate() {
  var now = DateTime.now();
  var formatter = DateFormat('MMMM d, yyyy');
  return formatter.format(now);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _onTabTapped,
          currentIndex: _currentIndex,
          backgroundColor: const Color.fromRGBO(29, 31, 37, 1),
          elevation: 3,
          items: [
            const BottomNavigationBarItem(
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
            const BottomNavigationBarItem(
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
          padding: const EdgeInsets.only(top: 50, left: 20, right: 0),
          height: MediaQuery.of(context).size.height,
          width:MediaQuery.of(context).size.width ,
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(
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
                          getFormattedDate(),
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
                              Lottie.asset("assets/clips/notaskanimation.json"),
                              const SizedBox(
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
                                currentIndex: index,
                                taskName: db.todoList[index][0],
                                taskCompleted: db.todoList[index][1],
                                onChanged: (value) =>
                                    checkBoxChanged(value, index),
                                deleteFunction: (context) => deleteTask(index),
                                editFunction: editTask,//editTask is the method which is defined in this same file
                              );
                            },
                          )),
              ),
            ],
          )),
    );
  }
}
