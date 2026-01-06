import 'package:flutter/material.dart';
import 'task.dart';

class TodoProvider extends ChangeNotifier {
  final List<Task> _taskList = [];

  List<Task> get taskList => _taskList;

  void addTask(String task) {
    _taskList.add(Task(title: task));
    notifyListeners();
  }

  void removeTask(int index) {
    _taskList.removeAt(index);
    notifyListeners();
  }

  void toggleDone(int index) {
    _taskList[index].isDone = !_taskList[index].isDone;
    notifyListeners();
  }
}