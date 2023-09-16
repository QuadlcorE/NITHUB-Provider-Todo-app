import 'package:flutter/material.dart';
import 'package:todo/entities/todo_data.dart';

class TodosModel extends ChangeNotifier {
  final List<TodoData> _todoList = [];

  List<TodoData> get items => _todoList;

  void add(TodoData todo) {
    _todoList.add(todo);
    notifyListeners();
  }

  void strike(int index) {
    _todoList[index].strike();
    notifyListeners();
  }
}
