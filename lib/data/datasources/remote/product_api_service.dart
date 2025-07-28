import 'package:base/data/models/todo_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part '../../../generated/data/datasources/remote/product_api_service.g.dart';

@RestApi()
@injectable
abstract class ProductApiService {
  @factoryMethod
  factory ProductApiService(Dio dio) = _ProductApiService;

  @GET('/todos/1')
  Future<TodoModel> getTodo();
}
