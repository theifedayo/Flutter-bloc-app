import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/constants/strings.dart';
import 'package:flutter_bloc_app/cubit/todos_cubit.dart';
import 'package:flutter_bloc_app/presentation/screens/add_todo_screen.dart';
import 'package:flutter_bloc_app/presentation/screens/edit_todo_screen.dart';
import 'package:flutter_bloc_app/presentation/screens/todos_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppRouter {

  Route generateRoute(RouteSettings settings){

    switch(settings.name){
      case "/":
        return MaterialPageRoute(builder: (_) => BlocProvider(
            create: (BuildContext context) => TodosCubit(),
            child: TodoScreen()
        ));
      case EDIT_TODO_ROUTE:
        return MaterialPageRoute(builder: (_) => EditTodoScreen());
      case ADD_TODO_ROUTE:
        return MaterialPageRoute(builder: (_) => AddTodoScreen());
      default:
        return null;
    }
  }
}