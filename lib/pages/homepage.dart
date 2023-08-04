import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo/components/todolist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todoList = [("Flutter Animations", false), ("Food Ui", true)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "TO DO",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
                taskName: todoList[index][0],
                taskCompleted: todoList[index][1],
                onChanged: onChanged);
          },
        ));
  }
}
