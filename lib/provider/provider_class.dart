
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tudocheck/model.dart';

class TodoProvider with ChangeNotifier {
//you can put one or two dummy task
  List<TodoModel> _tasks = [];

//to get all the tasks
  UnmodifiableListView<TodoModel> get allTasks => UnmodifiableListView(_tasks);

//all new added task must be uncompleted
  void addTask(String task) {
    _tasks.add(TodoModel(todoTitle: task, completed: false));
    notifyListeners();
  }

//we are not working with task id that why we are working with every tasks index number to modify
  void toggleTask(TodoModel task) {
    final taskIndex = _tasks.indexOf(task);
    _tasks[taskIndex].toggleCompleted();
    notifyListeners();
  }

  void deleteTask(TodoModel task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
  /*UnmodifiableListView is there for safety. It's immutable, so consumers of the Cartclass cannot change the
  items in the class via the Cart.items getter.
  They have to go through Cart.add() and Cart.remove() (which make sure to do the right thing).*/