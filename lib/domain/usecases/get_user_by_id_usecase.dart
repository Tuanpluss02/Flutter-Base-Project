import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:base/core/error/failure.dart';
import 'package:base/core/usecase/usecase.dart';
import 'package:base/domain/entities/user.dart';
import 'package:base/domain/repositories/user_repository.dart';

@injectable
class GetUserByIdUseCase extends UseCase<User, int> {

  GetUserByIdUseCase(this._repository);
  final UserRepository _repository;

  @override
  Future<Either<Failure, User>> call(int params) async {
    return await _repository.getUserById(params);
  }
}