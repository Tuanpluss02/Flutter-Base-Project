// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:base/app/bloc/user_cubit.dart' as _i529;
import 'package:base/core/network/interceptors/auth_interceptor.dart' as _i1051;
import 'package:base/core/network/interceptors/error_interceptor.dart' as _i158;
import 'package:base/core/network/network_module.dart' as _i899;
import 'package:base/data/datasources/local/local_data_source.dart' as _i907;
import 'package:base/data/datasources/local/user_local_data_source.dart'
    as _i1028;
import 'package:base/data/datasources/remote/base_api_service.dart' as _i41;
import 'package:base/data/datasources/remote/product_api_service.dart' as _i328;
import 'package:base/data/datasources/remote/user_api_service.dart' as _i8;
import 'package:base/data/repositories/user_repository_impl.dart' as _i904;
import 'package:base/domain/repositories/user_repository.dart' as _i1012;
import 'package:base/domain/usecases/get_user_by_id_usecase.dart' as _i970;
import 'package:base/domain/usecases/get_users_usecase.dart' as _i832;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.factory<_i1051.AuthInterceptor>(() => _i1051.AuthInterceptor());
    gh.factory<_i158.ErrorInterceptor>(() => _i158.ErrorInterceptor());
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => networkModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.factory<_i1028.UserLocalDataSource>(
        () => _i1028.UserLocalDataSource(gh<_i460.SharedPreferences>()));
    gh.factory<_i907.LocalDataSource>(
        () => _i907.LocalDataSource(gh<_i460.SharedPreferences>()));
    gh.factory<_i8.UserApiService>(() => _i8.UserApiService(gh<_i361.Dio>()));
    gh.factory<_i328.ProductApiService>(
        () => _i328.ProductApiService(gh<_i361.Dio>()));
    gh.factory<_i41.BaseApiService>(() => _i41.BaseApiService(gh<_i361.Dio>()));
    gh.factory<_i1012.UserRepository>(() => _i904.UserRepositoryImpl(
          gh<_i8.UserApiService>(),
          gh<_i1028.UserLocalDataSource>(),
        ));
    gh.factory<_i832.GetUsersUseCase>(
        () => _i832.GetUsersUseCase(gh<_i1012.UserRepository>()));
    gh.factory<_i970.GetUserByIdUseCase>(
        () => _i970.GetUserByIdUseCase(gh<_i1012.UserRepository>()));
    gh.factory<_i529.UserCubit>(
        () => _i529.UserCubit(gh<_i832.GetUsersUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i899.NetworkModule {}
