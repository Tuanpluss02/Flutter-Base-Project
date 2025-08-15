import 'package:base/core/result/result.dart';
import 'package:base/domain/entities/todo.dart';
import 'package:base/domain/usecases/get_todos_usecase.dart';
import 'package:base/domain/usecases/update_todo_usecase.dart';
import 'package:base/presentation/modules/todo/cubit/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class TodoCubit extends Cubit<TodoState> {
  TodoCubit(this._getTodosUseCase, this._updateTodoUseCase)
    : super(const TodoState.initial());
  final GetTodosUseCase _getTodosUseCase;
  final UpdateTodoUseCase _updateTodoUseCase;

  Future<void> fetchTodos() async {
    emit(const TodoState.loading());
    final result = await _getTodosUseCase();

    result.fold(
      (failure) {
        emit(TodoState.error(message: failure.userMessage));
      },
      (todos) {
        emit(TodoState.loaded(todos: todos));
      },
    );
  }

  Future<void> toggleTodoCompletion(Todo todo) async {
    state.maybeWhen(
      loaded: (todos) async {
        // Emit updating state
        emit(TodoState.updating(todos: todos, updatingTodoId: todo.id));

        final updatedTodo = todo.copyWith(completed: !todo.completed);
        final result = await _updateTodoUseCase(updatedTodo);

        result.fold(
          (failure) {
            emit(TodoState.error(message: failure.userMessage));
          },
          (updatedTodo) {
            // Update the todo in the list
            final updatedTodos = todos.map((t) {
              return t.id == updatedTodo.id ? updatedTodo : t;
            }).toList();
            emit(TodoState.loaded(todos: updatedTodos));
          },
        );
      },
      orElse: () {},
    );
  }

  void resetState() {
    emit(const TodoState.initial());
  }
}
