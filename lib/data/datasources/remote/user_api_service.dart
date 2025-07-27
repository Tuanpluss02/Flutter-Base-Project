import 'package:base/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part '../../../generated/data/datasources/remote/user_api_service.g.dart';

@RestApi()
@injectable
abstract class UserApiService {
  @factoryMethod
  factory UserApiService(Dio dio) = _UserApiService;

  @GET('/users')
  Future<List<UserModel>> getUsers();

  @GET('/users/{id}')
  Future<UserModel> getUserById(@Path('id') int id);

  @POST('/users')
  Future<UserModel> createUser(@Body() UserModel user);

  @PUT('/users/{id}')
  Future<UserModel> updateUser(@Path('id') int id, @Body() UserModel user);

  @DELETE('/users/{id}')
  Future<void> deleteUser(@Path('id') int id);
}
