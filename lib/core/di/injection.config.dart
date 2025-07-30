// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:base/app/bloc/app_bloc.dart' as _i818;
import 'package:base/core/network/network_module.dart' as _i899;
import 'package:base/core/services/alice_service.dart' as _i1028;
import 'package:base/core/services/connectivity_service.dart' as _i104;
import 'package:base/core/services/language_service.dart' as _i242;
import 'package:base/core/services/theme_service.dart' as _i610;
import 'package:base/data/datasources/local/local_data_source.dart' as _i907;
import 'package:base/data/datasources/local/user_local_data_source.dart'
    as _i1028;
import 'package:base/data/datasources/remote/todo_api_service.dart' as _i10;
import 'package:base/data/datasources/remote/user_api_service.dart' as _i8;
import 'package:base/data/repositories/todo_repository_impl.dart' as _i425;
import 'package:base/data/repositories/user_repository_impl.dart' as _i904;
import 'package:base/domain/repositories/todo_repository.dart' as _i1004;
import 'package:base/domain/repositories/user_repository.dart' as _i1012;
import 'package:base/domain/usecases/get_todo_by_id_usecase.dart' as _i927;
import 'package:base/domain/usecases/get_todos_usecase.dart' as _i712;
import 'package:base/domain/usecases/get_user_by_id_usecase.dart' as _i970;
import 'package:base/domain/usecases/get_users_usecase.dart' as _i832;
import 'package:base/domain/usecases/update_todo_usecase.dart' as _i573;
import 'package:base/presentation/modules/todo/cubit/todo_cubit.dart' as _i256;
import 'package:base/presentation/modules/users/cubit/user_cubit.dart' as _i578;
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
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.factory<_i104.ConnectivityService>(() => _i104.ConnectivityService());
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => networkModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i1028.AliceService>(() => _i1028.AliceService());
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.dio(gh<_i1028.AliceService>()),
    );
    gh.singleton<_i610.ThemeService>(
      () => _i610.ThemeService(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i242.LanguageService>(
      () => _i242.LanguageService(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i1028.UserLocalDataSource>(
      () => _i1028.UserLocalDataSource(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i907.LocalDataSource>(
      () => _i907.LocalDataSource(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i8.UserApiService>(() => _i8.UserApiService(gh<_i361.Dio>()));
    gh.factory<_i10.TodoApiService>(() => _i10.TodoApiService(gh<_i361.Dio>()));
    gh.singleton<_i818.AppBloc>(
      () => _i818.AppBloc(
        gh<_i242.LanguageService>(),
        gh<_i610.ThemeService>(),
        gh<_i104.ConnectivityService>(),
      ),
    );
    gh.factory<_i1004.TodoRepository>(
      () => _i425.TodoRepositoryImpl(gh<_i10.TodoApiService>()),
    );
    gh.factory<_i1012.UserRepository>(
      () => _i904.UserRepositoryImpl(
        gh<_i8.UserApiService>(),
        gh<_i1028.UserLocalDataSource>(),
      ),
    );
    gh.factory<_i712.GetTodosUseCase>(
      () => _i712.GetTodosUseCase(gh<_i1004.TodoRepository>()),
    );
    gh.factory<_i573.UpdateTodoUseCase>(
      () => _i573.UpdateTodoUseCase(gh<_i1004.TodoRepository>()),
    );
    gh.factory<_i927.GetTodoByIdUseCase>(
      () => _i927.GetTodoByIdUseCase(gh<_i1004.TodoRepository>()),
    );
    gh.factory<_i832.GetUsersUseCase>(
      () => _i832.GetUsersUseCase(gh<_i1012.UserRepository>()),
    );
    gh.factory<_i970.GetUserByIdUseCase>(
      () => _i970.GetUserByIdUseCase(gh<_i1012.UserRepository>()),
    );
    gh.factory<_i578.UserCubit>(
      () => _i578.UserCubit(gh<_i832.GetUsersUseCase>()),
    );
    gh.factory<_i256.TodoCubit>(
      () => _i256.TodoCubit(
        gh<_i712.GetTodosUseCase>(),
        gh<_i573.UpdateTodoUseCase>(),
      ),
    );
    return this;
  }
}

class _$NetworkModule extends _i899.NetworkModule {}
