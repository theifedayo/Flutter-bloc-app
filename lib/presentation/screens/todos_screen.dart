import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/constants/colors.dart';
import 'package:flutter_bloc_app/constants/strings.dart';
import 'package:flutter_bloc_app/cubit/todos_cubit.dart';

//Navigator.pushNamed(context, ADD_TODO_ROUTE),
class TodoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    BlocProvider.of<TodosCubit>(context).fetchTodos();
    
    return Scaffold(
      appBar: AppBar(
      title: Text("Todo screen"),
      actions: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, ADD_TODO_ROUTE),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.add),
          ),
        )
      ],
      backgroundColor: kaccentColor,
      toolbarHeight: 70,
      elevation: 0,
    ),

      body: Center(child: Text("Todo Screen"),)
    );
  }
}