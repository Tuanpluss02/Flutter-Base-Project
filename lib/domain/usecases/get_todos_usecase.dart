import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:base/core/error/failure.dart';
import 'package:base/core/usecase/usecase.dart';
import 'package:base/domain/entities/todo.dart';
import 'package:base/domain/repositories/todo_repository.dart';

@injectable
class GetTodosUseCase extends UseCaseWithoutParams<List<Todo>> {
  final TodoRepository _repository;

  GetTodosUseCase(this._repository);

  @override
  Future<Either<Failure, List<Todo>>> call() async {
    return await _repository.getTodos();
  }
}