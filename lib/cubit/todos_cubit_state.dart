part of 'todos_cubit.dart';


@immutable
abstract class TodosCubitState {}

class TodosCubitInitial extends TodosCubitState {}
class TodosLoaded extends TodosCubitState {
  final List<Todo> todos;
  TodosLoaded({ this.todos });
}
