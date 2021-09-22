import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_app/data/repository.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc_app/data/models/todo.dart';
import 'dart:async';

part 'todos_cubit_state.dart';

class TodosCubit extends Cubit<TodosCubitState> {
  final Repository repository;

  TodosCubit({this.repository}) : super(TodosCubitInitial());

  void fetchTodos(){
    Timer(Duration(seconds: 3), (){
      repository.fetchTodos().then((todos){
        emit(TodosLoaded(todos: todos));
      });
    });
  }

  void changeCompletion(Todo todo){
    repository.changeCompletion(!todo.isCompleted, todo.id).then((isChanged){
      if(isChanged){
        todo.isCompleted = !todo.isCompleted;
        updateTodoList();
      }
    });
  }

  void updateTodoList() {
    final currentState = state;
    if(currentState is TodosLoaded)
    emit(TodosLoaded(todos: currentState.todos));
  }

  addTodo(Todo todo) {
    final currentState = state;
    if(currentState is TodosLoaded){
      var todoList = currentState.todos;
      todoList.add(todo);
      emit(TodosLoaded(todos: todoList));
    }
  }
}
