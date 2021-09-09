import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/presentation/screens/add_todo_screen.dart';
import 'package:flutter_bloc_app/presentation/screens/edit_todo_screen.dart';
import 'package:flutter_bloc_app/presentation/screens/todos_screen.dart';


class AppRouter {

  Route generateRoute(RouteSettings settings){

    switch(settings.name){
      case "/":
        return MaterialPageRoute(builder: (_) => TodoScreen());
      case "/edit_todo":
        return MaterialPageRoute(builder: (_) => EditTodoScreen());
      case "/add_todo":
        return MaterialPageRoute(builder: (_) => AddTodoScreen());
      default:
        return null;
    }
  }
}