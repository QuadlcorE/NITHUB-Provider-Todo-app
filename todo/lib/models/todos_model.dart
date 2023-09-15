import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:todo/entities/todo_data.dart';

class TodosModel extends ChangeNotifier {
  // Private state of the list of todo's.
  final List<TodoData> _todoList = [];

  // An unmodifiable view of items in the todolist.
  UnmodifiableListView<TodoData> get TodoData =>
      UnmodifiableListView(_todoList);
}
