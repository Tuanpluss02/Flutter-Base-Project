import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part '../../../generated/data/datasources/remote/product_api_service.g.dart';

@RestApi()
@injectable
abstract class ProductApiService {
  @factoryMethod
  factory ProductApiService(Dio dio) = _ProductApiService;

  // Example product endpoints - uncomment when you have ProductModel
  /*
  @GET('/products')
  Future<List<ProductModel>> getProducts();

  @GET('/products/{id}')
  Future<ProductModel> getProductById(@Path('id') int id);

  @POST('/products')
  Future<ProductModel> createProduct(@Body() ProductModel product);

  @PUT('/products/{id}')
  Future<ProductModel> updateProduct(
    @Path('id') int id,
    @Body() ProductModel product,
  );

  @DELETE('/products/{id}')
  Future<void> deleteProduct(@Path('id') int id);

  @GET('/products/category/{category}')
  Future<List<ProductModel>> getProductsByCategory(@Path('category') String category);
  */
}
