import 'package:dartz/dartz.dart';
import 'package:base/core/error/failure.dart';

// For use cases with parameters
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// For use cases without parameters
abstract class UseCaseWithoutParams<Type> {
  Future<Either<Failure, Type>> call();
}

// For synchronous use cases with parameters
abstract class SyncUseCase<Type, Params> {
  Either<Failure, Type> call(Params params);
}

// For synchronous use cases without parameters
abstract class SyncUseCaseWithoutParams<Type> {
  Either<Failure, Type> call();
}

// No params class for use cases that don't need parameters
class NoParams {
  const NoParams();
}
