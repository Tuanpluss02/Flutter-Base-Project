import 'package:dartz/dartz.dart';
import 'package:base/core/error/failure.dart';
import 'package:base/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<Todo>>> getTodos();
  Future<Either<Failure, Todo>> getTodoById(int id);
  Future<Either<Failure, Todo>> createTodo(Todo todo);
  Future<Either<Failure, Todo>> updateTodo(Todo todo);
  Future<Either<Failure, void>> deleteTodo(int id);
}
