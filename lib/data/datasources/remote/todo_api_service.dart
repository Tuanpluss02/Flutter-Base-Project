import 'package:base/data/models/todo_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part '../../../generated/data/datasources/remote/todo_api_service.g.dart';

@RestApi()
@injectable
abstract class TodoApiService {
  @factoryMethod
  factory TodoApiService(Dio dio) = _TodoApiService;

  @GET('/todos')
  Future<List<TodoModel>> getTodos();

  @GET('/todos/{id}')
  Future<TodoModel> getTodoById(@Path('id') int id);

  @POST('/todos')
  Future<TodoModel> createTodo(@Body() TodoModel todo);

  @PUT('/todos/{id}')
  Future<TodoModel> updateTodo(@Path('id') int id, @Body() TodoModel todo);

  @DELETE('/todos/{id}')
  Future<void> deleteTodo(@Path('id') int id);
}
