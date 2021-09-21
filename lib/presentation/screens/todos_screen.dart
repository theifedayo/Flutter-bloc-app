import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/todo.dart';
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

      body: BlocBuilder<TodosCubit, TodosCubitState>(
        builder: (context, state){
          if(!(state is TodosLoaded))
            return Center(child: CircularProgressIndicator());
          final todos = (state as TodosLoaded).todos;
        return SingleChildScrollView(
          child: Column(
            children: todos.map((e) => _todo(e, context)).toList(),
          ),
         );
        },
      )
    );
  }

  Widget _todo(Todo todo, context){
    return Dismissible(
        key: Key("${todo.id}"),
        confirmDismiss: (_) async {
          BlocProvider.of<TodosCubit>(context).changeCompletion(todo);
          return false;
        },
        background: Container(color: Colors.indigo,),
        child: todoTile(todo, context));
  }

  Widget todoTile(Todo todo, context){
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(color: Colors.grey[200])
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(todo.todoMessage),
          _completionIndicator(todo)
        ],
      ),
    );
  }

  Widget _completionIndicator(Todo todo){
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(
          width: 4.0,
          color: todo.isCompleted ? Colors.green : Colors.red
        )
      ),
    );
  }
}