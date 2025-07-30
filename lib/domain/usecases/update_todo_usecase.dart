import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:base/core/error/failure.dart';
import 'package:base/core/usecase/usecase.dart';
import 'package:base/domain/entities/todo.dart';
import 'package:base/domain/repositories/todo_repository.dart';

@injectable
class UpdateTodoUseCase extends UseCase<Todo, Todo> {

  UpdateTodoUseCase(this._repository);
  final TodoRepository _repository;

  @override
  Future<Either<Failure, Todo>> call(Todo todo) async {
    return await _repository.updateTodo(todo);
  }
}