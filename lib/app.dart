import 'package:flutter/material.dart';
import 'package:get_todos/todos.views.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

      title: 'Newtworking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      
      home: const TodosView(),
    );
  }
}