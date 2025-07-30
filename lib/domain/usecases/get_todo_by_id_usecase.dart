import 'package:base/core/result/result.dart';
import 'package:base/core/usecase/usecase.dart';
import 'package:base/domain/entities/todo.dart';
import 'package:base/domain/repositories/todo_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTodoByIdUseCase extends UseCase<Todo, int> {
  GetTodoByIdUseCase(this._repository);
  final TodoRepository _repository;

  @override
  Future<Result<Todo>> call(int id) async {
    return await _repository.getTodoById(id);
  }
}
