import 'package:bloc/bloc.dart';
import 'package:model/models/todo.dart';

class TodoBloc extends Cubit<List<Todo>> {
  TodoBloc() : super([]);

  addTodo(String todo) {
    if (todo.isNotEmpty) emit([...state, Todo(todo: todo)]);
  }

  deleteTodo(Todo todo) {
    emit(state.where((_todo) => _todo != todo).toList());
  }

  toggleStatus(Todo todo) {
    todo.status = !todo.status;
    emit([...state]);
  }

  clearCompleted() {
    emit(state.where((_todo) => !_todo.status).toList());
  }
}
