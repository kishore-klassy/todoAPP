import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
class TodoDataBase {
   List todoList = [];

  // reference our box
  final _myBox = Hive.box('mybox');
   final TimeOfDay _timeOfDay = TimeOfDay(hour:5, minute: 23);
   
     late BuildContext context;

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
   todoList = [
      ["Make Coffee ", false,TimeOfDay.now().format(context).toString()],
      ["Do Exercise", false,TimeOfDay.now().format(context).toString()],
    ];
  }
            
  // load the data from database
  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", todoList);
  }
}