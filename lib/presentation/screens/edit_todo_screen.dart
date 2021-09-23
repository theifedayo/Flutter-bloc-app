import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/cubit/edit_todo_cubit.dart';
import 'package:flutter_bloc_app/data/models/todo.dart';
import 'package:toast/toast.dart';

class EditTodoScreen extends StatelessWidget {
  final Todo todo;
  final _controller = TextEditingController();
  EditTodoScreen({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _controller.text = todo.todoMessage;
    return BlocListener<EditTodoCubit, EditTodoState>(
      listener: (context, state) {
        if(state is TodoEdited){
          Navigator.pop(context);
        } else if (state is EditTodoError){
          Toast.show(
              state.error,
              context,
              duration: 3,
              backgroundColor: Colors.red,
              gravity: Toast.CENTER
          );
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("Edit Todo"),
            actions: [
              GestureDetector(
                onTap: () {
                  BlocProvider.of<EditTodoCubit>(context).deleteTodo(todo);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(Icons.delete),
                ),
              )
            ],
          ),
          body: Container(margin: EdgeInsets.all(20), child: _body(context))),
    );
  }

  Widget _body(context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(hintText: "Enter todo message"),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(onTap: () {
          BlocProvider.of<EditTodoCubit>(context).updateTodo(todo, _controller.text);
        }, child: _updateButton(context))
      ],
    );
  }

  Widget _updateButton(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(12)),
      child: Center(
          child: Text(
        "Update Tdo",
        style: TextStyle(color: Colors.white, fontSize: 18),
      )),
    );
  }
}
