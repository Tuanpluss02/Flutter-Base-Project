import 'package:base/core/result/result.dart';
import 'package:base/data/datasources/remote/todo_api_service.dart';
import 'package:base/data/models/todo_model.dart';
import 'package:base/domain/entities/todo.dart';
import 'package:base/domain/repositories/todo_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl(this._todoApiService);
  final TodoApiService _todoApiService;

  @override
  Future<Result<List<Todo>>> getTodos() async {
    try {
      final todoModels = await _todoApiService.getTodos();
      final todos = todoModels.map((model) => model.toEntity()).toList();
      return Result.success(todos);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return const Result.failure(
          Failure.network(message: 'Connection timeout'),
        );
      } else if (e.type == DioExceptionType.connectionError) {
        return const Result.failure(
          Failure.network(message: 'No internet connection'),
        );
      } else if (e.response != null) {
        return Result.failure(
          Failure.server(message: 'Server error: ${e.response?.statusCode}'),
        );
      } else {
        return const Result.failure(
          Failure.server(message: 'Unknown server error'),
        );
      }
    } catch (e) {
      return Result.failure(
        Failure.server(message: 'Unexpected error: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<Todo>> getTodoById(int id) async {
    try {
      final todoModel = await _todoApiService.getTodoById(id);
      return Result.success(todoModel.toEntity());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return const Result.failure(
          Failure.network(message: 'Connection timeout'),
        );
      } else if (e.type == DioExceptionType.connectionError) {
        return const Result.failure(
          Failure.network(message: 'No internet connection'),
        );
      } else if (e.response?.statusCode == 404) {
        return const Result.failure(
          Failure.notFound(message: 'Todo not found'),
        );
      } else if (e.response != null) {
        return Result.failure(
          Failure.server(message: 'Server error: ${e.response?.statusCode}'),
        );
      } else {
        return const Result.failure(
          Failure.server(message: 'Unknown server error'),
        );
      }
    } catch (e) {
      return Result.failure(
        Failure.server(message: 'Unexpected error: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<Todo>> createTodo(Todo todo) async {
    try {
      final todoModel = TodoModel.fromEntity(todo);
      final createdTodoModel = await _todoApiService.createTodo(todoModel);
      return Result.success(createdTodoModel.toEntity());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return const Result.failure(
          Failure.network(message: 'Connection timeout'),
        );
      } else if (e.type == DioExceptionType.connectionError) {
        return const Result.failure(
          Failure.network(message: 'No internet connection'),
        );
      } else if (e.response?.statusCode != null) {
        return Result.failure(
          Failure.server(message: 'Server error: ${e.response?.statusCode}'),
        );
      } else {
        return const Result.failure(
          Failure.server(message: 'Unknown server error'),
        );
      }
    } catch (e) {
      return Result.failure(
        Failure.server(message: 'Unexpected error: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<Todo>> updateTodo(Todo todo) async {
    try {
      final todoModel = TodoModel.fromEntity(todo);
      final updatedTodoModel = await _todoApiService.updateTodo(
        todo.id,
        todoModel,
      );
      return Result.success(updatedTodoModel.toEntity());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return const Result.failure(
          Failure.network(message: 'Connection timeout'),
        );
      } else if (e.type == DioExceptionType.connectionError) {
        return const Result.failure(
          Failure.network(message: 'No internet connection'),
        );
      } else if (e.response?.statusCode == 404) {
        return const Result.failure(
          Failure.notFound(message: 'Todo not found'),
        );
      } else if (e.response?.statusCode != null) {
        return Result.failure(
          Failure.server(message: 'Server error: ${e.response?.statusCode}'),
        );
      } else {
        return const Result.failure(
          Failure.server(message: 'Unknown server error'),
        );
      }
    } catch (e) {
      return Result.failure(
        Failure.server(message: 'Unexpected error: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<void>> deleteTodo(int id) async {
    try {
      await _todoApiService.deleteTodo(id);
      return const Result.success(null);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return const Result.failure(
          Failure.network(message: 'Connection timeout'),
        );
      } else if (e.type == DioExceptionType.connectionError) {
        return const Result.failure(
          Failure.network(message: 'No internet connection'),
        );
      } else if (e.response?.statusCode == 404) {
        return const Result.failure(
          Failure.notFound(message: 'Todo not found'),
        );
      } else if (e.response?.statusCode != null) {
        return Result.failure(
          Failure.server(message: 'Server error: ${e.response?.statusCode}'),
        );
      } else {
        return const Result.failure(
          Failure.server(message: 'Unknown server error'),
        );
      }
    } catch (e) {
      return Result.failure(
        Failure.server(message: 'Unexpected error: ${e.toString()}'),
      );
    }
  }
}
