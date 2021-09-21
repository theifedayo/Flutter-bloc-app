import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/cubit/add_todo_cubit.dart';



class AddTodoScreen extends StatelessWidget {

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: _body(context),
      )
    );
  }

  Widget _body(context){
    return Column(
      children: [
        TextField(
          autofocus: true,
          controller: _controller,
          decoration: InputDecoration(hintText: "Enter todo message"),
        ),
        SizedBox(height: 10,),
        GestureDetector(
          onTap: (){
            final message = _controller.text;
            BlocProvider.of<AddTodoCubit>(context).addTodo(message);
          },
            child: _addButton(context)
        )
      ],
    );
  }

  Widget _addButton(context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Center(
        child: Text("Add Tdo", style: TextStyle(
          color: Colors.white,
          fontSize: 18
        ),),
      ),
    );
  }
}