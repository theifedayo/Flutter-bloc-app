import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/constants/strings.dart';

//Navigator.pushNamed(context, ADD_TODO_ROUTE),
class TodoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leadingWidth: 0,
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
          ]
      ),
      backgroundColor: Colors.white,
      toolbarHeight: 70,
      elevation: 0,
    ),

      body: Center(child: Text("Todo Screen"),)
    );
  }
}