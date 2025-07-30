import 'package:base/core/result/result.dart';
import 'package:base/core/usecase/usecase.dart';
import 'package:base/domain/entities/todo.dart';
import 'package:base/domain/repositories/todo_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTodosUseCase extends UseCaseWithoutParams<List<Todo>> {
  GetTodosUseCase(this._repository);
  final TodoRepository _repository;

  @override
  Future<Result<List<Todo>>> call() async {
    return await _repository.getTodos();
  }
}
