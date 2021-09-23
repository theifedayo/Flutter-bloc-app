import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_app/cubit/todos_cubit.dart';
import 'package:flutter_bloc_app/data/repository.dart';
import 'package:meta/meta.dart';

part 'add_todo_state.dart';

class AddTodoCubit extends Cubit<AddTodoState> {
  final Repository repository;
  final TodosCubit todosCubit;

  AddTodoCubit({this.repository, this.todosCubit}) : super(AddTodoInitial());

  void addTodo(String message) {
    if(message.isEmpty){
      emit(AddTodoError(error: "Todo cannot be empty"));
      return;
    }
    emit(AddingTodo());
    repository.addTodo(message).then((todo){
      if(todo != null){
        todosCubit.addTodo(todo);
        emit(TodoAdded());
      }
    });
  }
}
