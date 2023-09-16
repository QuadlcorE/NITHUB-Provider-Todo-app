import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/entities/todo_data.dart';
import 'package:todo/models/todos_model.dart';

class TodoEntry extends StatefulWidget {
  const TodoEntry({super.key});

  @override
  State<TodoEntry> createState() => _TodoEntryState();
}

class _TodoEntryState extends State<TodoEntry> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: textController,
          decoration: const InputDecoration(labelText: 'Task e.g Wash plates'),
        ),
        ElevatedButton(
          onPressed: () {
            context
                .read<TodosModel>()
                .add(TodoData(textController.text.toString()));
            Navigator.pop(context);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
