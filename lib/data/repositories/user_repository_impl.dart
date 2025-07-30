import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:base/core/error/failure.dart';
import 'package:base/core/error/exception.dart';
import 'package:base/core/network/network_info.dart';
import 'package:base/data/datasources/remote/user_api_service.dart';
import 'package:base/data/datasources/local/user_local_data_source.dart';
import 'package:base/data/models/user_model.dart';
import 'package:base/domain/entities/user.dart';
import 'package:base/domain/repositories/user_repository.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {

  UserRepositoryImpl(this._userApiService, this._userLocalDataSource);
  final UserApiService _userApiService;
  final UserLocalDataSource _userLocalDataSource;

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    try {
      if (await NetworkInfo.isConnected) {
        final userModels = await _userApiService.getUsers();
        final users = userModels.map((model) => model.toEntity()).toList();
        
        // Cache the users
        await _userLocalDataSource.cacheUsers(userModels);
        
        return Right(users);
      } else {
        // Try to get cached data
        final cachedUserModels = await _userLocalDataSource.getCachedUsers();
        final users = cachedUserModels.map((model) => model.toEntity()).toList();
        
        if (users.isNotEmpty) {
          return Right(users);
        } else {
          return const Left(NetworkFailure(message: 'No internet connection and no cached data'));
        }
      }
    } on DioException catch (e) {
      return Left(ServerFailure(message: DioErrorHandler.handleDioError(e).toString()));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException {
      return Left(CacheFailure());
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getUserById(int id) async {
    try {
      if (await NetworkInfo.isConnected) {
        final userModel = await _userApiService.getUserById(id);
        return Right(userModel.toEntity());
      } else {
        return const Left(NetworkFailure(message: 'No internet connection'));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(message: DioErrorHandler.handleDioError(e).toString()));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> createUser(User user) async {
    try {
      if (await NetworkInfo.isConnected) {
        final userModel = UserModel.fromEntity(user);
        final createdUserModel = await _userApiService.createUser(userModel);
        return Right(createdUserModel.toEntity());
      } else {
        return const Left(NetworkFailure(message: 'No internet connection'));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(message: DioErrorHandler.handleDioError(e).toString()));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> updateUser(User user) async {
    try {
      if (await NetworkInfo.isConnected) {
        final userModel = UserModel.fromEntity(user);
        final updatedUserModel = await _userApiService.updateUser(userModel.id, userModel);
        return Right(updatedUserModel.toEntity());
      } else {
        return const Left(NetworkFailure(message: 'No internet connection'));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(message: DioErrorHandler.handleDioError(e).toString()));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser(int id) async {
    try {
      if (await NetworkInfo.isConnected) {
        await _userApiService.deleteUser(id);
        return const Right(null);
      } else {
        return const Left(NetworkFailure(message: 'No internet connection'));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(message: DioErrorHandler.handleDioError(e).toString()));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}