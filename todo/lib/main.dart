import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo/services/routehandler.dart';

import 'package:todo/models/todos_model.dart';
import 'package:todo/screens/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodosModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteHandler.pageRouting,
    );
  }
}
