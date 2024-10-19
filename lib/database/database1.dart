import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{

  List toDoList = [];

  final _myBox = Hive.box('myBox');

  // runs if it's the first time opening the app
  void createInitialData(){
    toDoList = [
      ['Make Breakfast', false],
      ['Do chores', false],
    ];
  }

  // update the database
  void update(){
    _myBox.put("todoList", toDoList);
  }

  // loads data from database
  void loadData(){
    toDoList = _myBox.get("todoList");
  }
}