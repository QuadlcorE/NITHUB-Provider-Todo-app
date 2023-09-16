import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todos_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView.builder(
            itemCount: context.watch<TodosModel>().items.length,
            itemBuilder: (BuildContext context, int index) {
              return Consumer<TodosModel>(builder: (context, value, child) {
                return CheckboxListTile(
                  title: Text(value.items[index].text.toString()),
                  value: value.items[index].completed,
                  onChanged: (bool? value) {
                    context.read<TodosModel>().strike(index);
                  },
                );
              });
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addTodoPage');
        },
        child: const Icon(
          Icons.plus_one,
        ),
      ),
    );
  }
}
