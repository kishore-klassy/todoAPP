import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo/components/todolist.dart';
import 'package:todo/components/dialogbox.dart';
import 'package:todo/data/database.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();



  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
    //db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(controller: _controller);
        });
  }

  void saveTask() {
    todoList.add([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text(
            "TO DO",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Container(
          child: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                  taskName: todoList[index][0],
                  taskCompleted: todoList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index));
            },
          ),
        ));
  }
}
