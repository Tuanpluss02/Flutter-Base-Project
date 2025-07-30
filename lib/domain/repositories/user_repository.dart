import 'package:base/core/result/result.dart';
import 'package:base/domain/entities/user.dart';

abstract class UserRepository {
  Future<Result<List<User>>> getUsers();
  Future<Result<User>> getUserById(int id);
  Future<Result<User>> createUser(User user);
  Future<Result<User>> updateUser(User user);
  Future<Result<void>> deleteUser(int id);
}
