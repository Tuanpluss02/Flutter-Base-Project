import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Base API service configuration that can be shared across all API services
@injectable
class BaseApiService {
  final Dio _dio;

  BaseApiService(this._dio);

  Dio get dio => _dio;

  // Common configuration methods can be added here
  void configureHeaders(Map<String, String> headers) {
    _dio.options.headers.addAll(headers);
  }

  void setBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  void setTimeout(Duration timeout) {
    _dio.options.connectTimeout = timeout;
    _dio.options.receiveTimeout = timeout;
  }
}