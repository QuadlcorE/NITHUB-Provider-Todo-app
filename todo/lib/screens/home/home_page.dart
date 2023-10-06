import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todos_model.dart';
import 'package:todo/services/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Todo"),
        leading: IconButton(
          icon: Icon(Icons.person_3_rounded), // Replace with your custom icon.
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              "Settings",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Sign Out'),
            onTap: () async {
              await _auth.signOut();
            },
          )
        ],
      )),
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
