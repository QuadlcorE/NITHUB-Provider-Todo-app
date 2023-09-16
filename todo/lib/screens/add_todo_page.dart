import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/entities/todo_data.dart';
import 'package:todo/models/todos_model.dart';
import 'package:todo/services/todo_form.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Todo"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: TodoEntry(),
      ),
    );
  }
}
