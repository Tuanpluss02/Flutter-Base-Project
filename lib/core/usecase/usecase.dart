import 'package:base/core/result/result.dart';

// For use cases with parameters
abstract class UseCase<Type, Params> {
  Future<Result<Type>> call(Params params);
}

// For use cases without parameters
abstract class UseCaseWithoutParams<Type> {
  Future<Result<Type>> call();
}

// For synchronous use cases with parameters
abstract class SyncUseCase<Type, Params> {
  Result<Type> call(Params params);
}

// For synchronous use cases without parameters
abstract class SyncUseCaseWithoutParams<Type> {
  Result<Type> call();
}

// No params class for use cases that don't need parameters
class NoParams {
  const NoParams();
}
