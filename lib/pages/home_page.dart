import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/local_data/database.dart';
import 'package:todoapp/until/dialog_box.dart';
import 'package:todoapp/until/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // referance to the hive box
  final _myBox = Hive.box('mybox');
  // final List toDoList = [];
  final _controller = TextEditingController();
  ToDoDatabase db = ToDoDatabase();
  //init todo list when app is opened on first time
  @override
  void initState() {
    // if this is the first time ever opening this app

    if (_myBox.get('TODOLIST') == null) {
      //create default data
      db.createInitialData();
    } else {
      //there already exist data
      db.loadData();
    }
    super.initState();
  }

  //handle checkbox changed
  void handleCheckboxChanged(int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  //create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: () {
              setState(() {
                db.toDoList.add([_controller.text, false]);
              });
              db.updateDataBase();
              _controller.clear();
              Navigator.of(context).pop();
            },
          );
        });
  }

  //delete task
  void handleDelete(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text('TO DO'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
          backgroundColor: Colors.yellow,
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return TodoItem(
              isDone: db.toDoList[index][1],
              title: db.toDoList[index][0],
              onChanged: (value) => handleCheckboxChanged(index),
              onDelete: (context) => handleDelete(index),
            );
          },
        ));
  }
}
