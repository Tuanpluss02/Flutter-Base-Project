import 'package:base/core/result/result.dart';
import 'package:base/core/usecase/usecase.dart';
import 'package:base/domain/entities/todo.dart';
import 'package:base/domain/repositories/todo_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateTodoUseCase extends UseCase<Todo, Todo> {
  UpdateTodoUseCase(this._repository);
  final TodoRepository _repository;

  @override
  Future<Result<Todo>> call(Todo todo) async {
    return await _repository.updateTodo(todo);
  }
}
