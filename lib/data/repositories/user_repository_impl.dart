import 'package:base/core/error/exception.dart';
import 'package:base/core/network/network_info.dart';
import 'package:base/core/result/result.dart';
import 'package:base/data/datasources/local/user_local_data_source.dart';
import 'package:base/data/datasources/remote/user_api_service.dart';
import 'package:base/data/models/user_model.dart';
import 'package:base/domain/entities/user.dart';
import 'package:base/domain/repositories/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._userApiService, this._userLocalDataSource);
  final UserApiService _userApiService;
  final UserLocalDataSource _userLocalDataSource;

  @override
  Future<Result<List<User>>> getUsers() async {
    try {
      if (await NetworkInfo.isConnected) {
        final userModels = await _userApiService.getUsers();
        final users = userModels.map((model) => model.toEntity()).toList();

        // Cache the users
        await _userLocalDataSource.cacheUsers(userModels);

        return Result.success(users);
      } else {
        // Try to get cached data
        final cachedUserModels = await _userLocalDataSource.getCachedUsers();
        final users = cachedUserModels
            .map((model) => model.toEntity())
            .toList();

        if (users.isNotEmpty) {
          return Result.success(users);
        } else {
          return const Result.failure(
            Failure.network(
              message: 'No internet connection and no cached data',
            ),
          );
        }
      }
    } on DioException catch (e) {
      return Result.failure(
        Failure.server(message: DioErrorHandler.handleDioError(e).toString()),
      );
    } on ServerException catch (e) {
      return Result.failure(Failure.server(message: e.message));
    } on CacheException {
      return const Result.failure(Failure.cache());
    } catch (e) {
      return Result.failure(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Result<User>> getUserById(int id) async {
    try {
      if (await NetworkInfo.isConnected) {
        final userModel = await _userApiService.getUserById(id);
        return Result.success(userModel.toEntity());
      } else {
        return const Result.failure(
          Failure.network(message: 'No internet connection'),
        );
      }
    } on DioException catch (e) {
      return Result.failure(
        Failure.server(message: DioErrorHandler.handleDioError(e).toString()),
      );
    } on ServerException catch (e) {
      return Result.failure(Failure.server(message: e.message));
    } catch (e) {
      return Result.failure(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Result<User>> createUser(User user) async {
    try {
      if (await NetworkInfo.isConnected) {
        final userModel = UserModel.fromEntity(user);
        final createdUserModel = await _userApiService.createUser(userModel);
        return Result.success(createdUserModel.toEntity());
      } else {
        return const Result.failure(
          Failure.network(message: 'No internet connection'),
        );
      }
    } on DioException catch (e) {
      return Result.failure(
        Failure.server(message: DioErrorHandler.handleDioError(e).toString()),
      );
    } on ServerException catch (e) {
      return Result.failure(Failure.server(message: e.message));
    } catch (e) {
      return Result.failure(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Result<User>> updateUser(User user) async {
    try {
      if (await NetworkInfo.isConnected) {
        final userModel = UserModel.fromEntity(user);
        final updatedUserModel = await _userApiService.updateUser(
          userModel.id,
          userModel,
        );
        return Result.success(updatedUserModel.toEntity());
      } else {
        return const Result.failure(
          Failure.network(message: 'No internet connection'),
        );
      }
    } on DioException catch (e) {
      return Result.failure(
        Failure.server(message: DioErrorHandler.handleDioError(e).toString()),
      );
    } on ServerException catch (e) {
      return Result.failure(Failure.server(message: e.message));
    } catch (e) {
      return Result.failure(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteUser(int id) async {
    try {
      if (await NetworkInfo.isConnected) {
        await _userApiService.deleteUser(id);
        return const Result.success(null);
      } else {
        return const Result.failure(
          Failure.network(message: 'No internet connection'),
        );
      }
    } on DioException catch (e) {
      return Result.failure(
        Failure.server(message: DioErrorHandler.handleDioError(e).toString()),
      );
    } on ServerException catch (e) {
      return Result.failure(Failure.server(message: e.message));
    } catch (e) {
      return Result.failure(Failure.unknown(message: e.toString()));
    }
  }
}
