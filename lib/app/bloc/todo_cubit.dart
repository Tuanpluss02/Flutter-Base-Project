import 'package:base/core/error/failure.dart';
import 'package:base/domain/entities/todo.dart';
import 'package:base/domain/usecases/get_todos_usecase.dart';
import 'package:base/domain/usecases/update_todo_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

// States
abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  TodoLoaded(this.todos);
  final List<Todo> todos;
}

class TodoError extends TodoState {
  TodoError(this.message);
  final String message;
}

class TodoUpdating extends TodoState {
  TodoUpdating(this.todos, this.updatingTodoId);
  final List<Todo> todos;
  final int updatingTodoId;
}

// Cubit
@injectable
class TodoCubit extends Cubit<TodoState> {
  TodoCubit(this._getTodosUseCase, this._updateTodoUseCase)
    : super(TodoInitial());
  final GetTodosUseCase _getTodosUseCase;
  final UpdateTodoUseCase _updateTodoUseCase;

  Future<void> fetchTodos() async {
    emit(TodoLoading());
    final result = await _getTodosUseCase();

    result.fold(
      (failure) {
        String errorMessage = 'An unexpected error occurred';
        if (failure is ServerFailure) {
          errorMessage = failure.message ?? 'Server Error';
        } else if (failure is NetworkFailure) {
          errorMessage = failure.message ?? 'Network Error';
        } else if (failure is CacheFailure) {
          errorMessage = 'Cache Error';
        }
        emit(TodoError(errorMessage));
      },
      (todos) {
        emit(TodoLoaded(todos));
      },
    );
  }

  Future<void> toggleTodoCompletion(Todo todo) async {
    final currentState = state;
    if (currentState is TodoLoaded) {
      // Emit updating state
      emit(TodoUpdating(currentState.todos, todo.id));

      final updatedTodo = todo.copyWith(completed: !todo.completed);
      final result = await _updateTodoUseCase(updatedTodo);

      result.fold(
        (failure) {
          String errorMessage = 'Failed to update todo';
          if (failure is ServerFailure) {
            errorMessage = failure.message ?? 'Server Error';
          } else if (failure is NetworkFailure) {
            errorMessage = failure.message ?? 'Network Error';
          }
          emit(TodoError(errorMessage));
        },
        (updatedTodo) {
          // Update the todo in the list
          final updatedTodos = currentState.todos.map((t) {
            return t.id == updatedTodo.id ? updatedTodo : t;
          }).toList();
          emit(TodoLoaded(updatedTodos));
        },
      );
    }
  }

  void resetState() {
    emit(TodoInitial());
  }
}
