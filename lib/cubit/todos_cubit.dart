import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_app/data/repository.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc_app/data/models/todo.dart';

part 'todos_cubit_state.dart';

class TodosCubit extends Cubit<TodosCubitState> {
  final Repository repository;

  TodosCubit({this.repository}) : super(TodosCubitInitial());

  void fetchTodos(){
    repository.fetchTodos().then((todos){
      emit(TodosLoaded(todos: todos));
    });
  }
}
