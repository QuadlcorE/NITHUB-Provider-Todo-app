import 'package:flutter/material.dart';
import 'package:todo/screens/home_page.dart';
import 'package:todo/screens/add_todo_page.dart';

class RouteHandler {
  static Route<dynamic> pageRouting(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const HomePage());
      case '/addTodoPage':
        return MaterialPageRoute(builder: (context) => const AddTodoPage());
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
