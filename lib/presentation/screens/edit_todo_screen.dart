import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/data/models/todo.dart';


class EditTodoScreen extends StatelessWidget {

  final Todo todo;
  final _controller = TextEditingController();
  EditTodoScreen({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _controller.text = todo.todoMessage;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Todo"),
        actions: [
          GestureDetector(
            onTap: (){

            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.delete),
            ),
          )
        ],
      ),
      body: Container(
          margin: EdgeInsets.all(20),
          child: _body(context)
      )
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
        GestureDetector(
            onTap: () {
            },
            child: _updateButton(context))
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
        child:  Text(
              "Update Tdo",
              style: TextStyle(color: Colors.white, fontSize: 18),
            )
        ),
    );
  }
}