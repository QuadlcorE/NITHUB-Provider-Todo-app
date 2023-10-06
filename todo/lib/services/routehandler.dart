import 'package:flutter/material.dart';
import 'package:todo/screens/home/home_page.dart';
import 'package:todo/screens/home/add_todo_page.dart';
import 'package:todo/screens/authenticate/sign_in.dart';
import 'package:todo/screens/authenticate/register.dart';

class RouteHandler {
  static Route<dynamic> pageRouting(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const HomePage());
      case '/addTodoPage':
        return MaterialPageRoute(builder: (context) => const AddTodoPage());
      case '/signin':
        return MaterialPageRoute(builder: (context) => const SignIn());
      case '/register':
        return MaterialPageRoute(builder: (context) => Register());
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
