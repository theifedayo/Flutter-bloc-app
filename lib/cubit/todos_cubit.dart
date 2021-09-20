import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todos_cubit_state.dart';

class TodosCubit extends Cubit<TodosCubitState> {
  TodosCubit() : super(TodosCubitInitial());
}
