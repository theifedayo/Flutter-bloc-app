import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/presentation/screens/todos_screen.dart';

void main(){
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    );
  }
}