import 'package:flutter/material.dart';
import 'package:todoapp/components/todo_tile.dart';
import 'package:todoapp/components/dialogbox.dart';
import 'package:todoapp/data/database.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/pages/new_task_page.dart';

class HomePage extends StatefulWidget {
  final Box<dynamic> box;
  const HomePage({super.key, required this.box});

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
    if (widget.box.get("TODOLIST") == null) {
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
      backgroundColor: Color.fromARGB(255, 52, 53, 67),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(
          "TO DO",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
                child: db.todoList.length == 0
                    ? const Center(child: Text("No Task,Add Some thing"))
                    : ListView.builder(
                        itemCount: db.todoList.length,
                        itemBuilder: (context, index) {
                          return TodoTile(
                            taskName: db.todoList[index][0],
                            taskCompleted: db.todoList[index][1],
                            onChanged: (value) => checkBoxChanged(value, index),
                            deleteFunction: (context) => deleteTask(index),
                            editFunction: editTask,
                          );
                        },
                      )),
          ),
          MaterialButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewTaskPage(controller: _controller,))),
                  color: Colors.blue,
                       child: Text("Create New Task"),
      
                  
                  )
        ],
      ),
    );
  }
}
