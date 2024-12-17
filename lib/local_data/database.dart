import 'package:hive_flutter/adapters.dart';

class ToDoDatabase {
  List toDoList = [];
  // reference to the hive box
  final _myBox = Hive.box('mybox');

  //run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      [
        ["Sample to do 1", false],
        ["Sample to do 2", false]
      ]
    ];
  }

  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  void updateDataBase() {
    _myBox.put('TODOLIST', toDoList);
  }
}
