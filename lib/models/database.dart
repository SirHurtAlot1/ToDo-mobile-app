import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/models/task.dart';

class TasksDatabase {
  List toDoList = [];

  final box = Hive.box('tasks');

  void createInitialData() {
    toDoList = [
      Task(isComplete: false, taskName: 'Feed my cat'),
      Task(isComplete: false, taskName: 'Go to sleep')
    ];
  }

  void loadData() {
    toDoList = box.get("TODOLIST");
  }

  void updateData() {
    box.put("TODOLIST", toDoList);
  }
}
