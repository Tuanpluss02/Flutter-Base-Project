import 'package:base/core/error/failure.dart';
import 'package:base/data/datasources/remote/todo_api_service.dart';
import 'package:base/data/models/todo_model.dart';
import 'package:base/domain/entities/todo.dart';
import 'package:base/domain/repositories/todo_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {

  TodoRepositoryImpl(this._todoApiService);
  final TodoApiService _todoApiService;

  @override
  Future<Either<Failure, List<Todo>>> getTodos() async {
    try {
      final todoModels = await _todoApiService.getTodos();
      final todos = todoModels.map((model) => model.toEntity()).toList();
      return Right(todos);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return const Left(NetworkFailure(message: 'Connection timeout'));
      } else if (e.type == DioExceptionType.connectionError) {
        return const Left(NetworkFailure(message: 'No internet connection'));
      } else if (e.response?.statusCode != null) {
        return Left(
          ServerFailure(message: 'Server error: ${e.response?.statusCode}'),
        );
      } else {
        return const Left(ServerFailure(message: 'Unknown server error'));
      }
    } catch (e) {
      return Left(ServerFailure(message: 'Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Todo>> getTodoById(int id) async {
    try {
      final todoModel = await _todoApiService.getTodoById(id);
      return Right(todoModel.toEntity());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return const Left(NetworkFailure(message: 'Connection timeout'));
      } else if (e.type == DioExceptionType.connectionError) {
        return const Left(NetworkFailure(message: 'No internet connection'));
      } else if (e.response?.statusCode == 404) {
        return const Left(ServerFailure(message: 'Todo not found'));
      } else if (e.response?.statusCode != null) {
        return Left(
          ServerFailure(message: 'Server error: ${e.response?.statusCode}'),
        );
      } else {
        return const Left(ServerFailure(message: 'Unknown server error'));
      }
    } catch (e) {
      return Left(ServerFailure(message: 'Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Todo>> createTodo(Todo todo) async {
    try {
      final todoModel = TodoModel.fromEntity(todo);
      final createdTodoModel = await _todoApiService.createTodo(todoModel);
      return Right(createdTodoModel.toEntity());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return const Left(NetworkFailure(message: 'Connection timeout'));
      } else if (e.type == DioExceptionType.connectionError) {
        return const Left(NetworkFailure(message: 'No internet connection'));
      } else if (e.response?.statusCode != null) {
        return Left(
          ServerFailure(message: 'Server error: ${e.response?.statusCode}'),
        );
      } else {
        return const Left(ServerFailure(message: 'Unknown server error'));
      }
    } catch (e) {
      return Left(ServerFailure(message: 'Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Todo>> updateTodo(Todo todo) async {
    try {
      final todoModel = TodoModel.fromEntity(todo);
      final updatedTodoModel = await _todoApiService.updateTodo(
        todo.id,
        todoModel,
      );
      return Right(updatedTodoModel.toEntity());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return const Left(NetworkFailure(message: 'Connection timeout'));
      } else if (e.type == DioExceptionType.connectionError) {
        return const Left(NetworkFailure(message: 'No internet connection'));
      } else if (e.response?.statusCode == 404) {
        return const Left(ServerFailure(message: 'Todo not found'));
      } else if (e.response?.statusCode != null) {
        return Left(
          ServerFailure(message: 'Server error: ${e.response?.statusCode}'),
        );
      } else {
        return const Left(ServerFailure(message: 'Unknown server error'));
      }
    } catch (e) {
      return Left(ServerFailure(message: 'Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTodo(int id) async {
    try {
      await _todoApiService.deleteTodo(id);
      return const Right(null);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return const Left(NetworkFailure(message: 'Connection timeout'));
      } else if (e.type == DioExceptionType.connectionError) {
        return const Left(NetworkFailure(message: 'No internet connection'));
      } else if (e.response?.statusCode == 404) {
        return const Left(ServerFailure(message: 'Todo not found'));
      } else if (e.response?.statusCode != null) {
        return Left(
          ServerFailure(message: 'Server error: ${e.response?.statusCode}'),
        );
      } else {
        return const Left(ServerFailure(message: 'Unknown server error'));
      }
    } catch (e) {
      return Left(ServerFailure(message: 'Unexpected error: ${e.toString()}'));
    }
  }
}
