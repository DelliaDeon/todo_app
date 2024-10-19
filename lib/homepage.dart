import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_todo_app/database/database1.dart';
import 'package:simple_todo_app/utils/creating_item.dart';
import 'package:simple_todo_app/utils/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();

  final _myBox = Hive.box('myBox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    super.initState();
    if (_myBox.get("todoList") == null){
      db.createInitialData();
    }
    else{
      db.loadData();
    }
  }

  void changeValue(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  }

  void createNewItem(){
    showDialog(
      context: context,
      builder: (context){
        return CreatingItem(
          controller: _controller,
          save: saveTask,
          cancel: Navigator.of(context).pop,
        );
      }
    );
  }

  void saveTask(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/images/to-do-list (1).png',
              height: 40,
            ),
            SizedBox(width: 15),
            Text(
              'T O D O   A P P',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.pink.shade500,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewItem,
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.pink.shade500,
      ),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index){
          return TodoItem(
            text: db.toDoList[index][0],
            value: db.toDoList[index][1],
            onChanged: (value) => changeValue(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}