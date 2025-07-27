import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:base/core/error/failure.dart';
import 'package:base/core/usecase/usecase.dart';
import 'package:base/domain/entities/user.dart';
import 'package:base/domain/repositories/user_repository.dart';

@injectable
class GetUsersUseCase extends UseCaseWithoutParams<List<User>> {
  final UserRepository _repository;

  GetUsersUseCase(this._repository);

  @override
  Future<Either<Failure, List<User>>> call() async {
    return await _repository.getUsers();
  }
}