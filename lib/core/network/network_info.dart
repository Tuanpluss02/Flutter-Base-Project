import 'package:dio/dio.dart';
import 'package:base/core/error/exception.dart';

class NetworkInfo {
  static Future<bool> get isConnected async {
    // In a real app, you would use connectivity_plus package
    // For now, we'll assume connection is available
    return true;
  }
}

class DioErrorHandler {
  static Exception handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkException(message: 'Connection timeout');
      case DioExceptionType.badResponse:
        return ServerException(
          message: error.response?.data?['message'] ?? 'Server error',
        );
      case DioExceptionType.cancel:
        return const NetworkException(message: 'Request cancelled');
      case DioExceptionType.connectionError:
        return const NetworkException(message: 'No internet connection');
      case DioExceptionType.badCertificate:
        return const NetworkException(message: 'Bad certificate');
      case DioExceptionType.unknown:
        return NetworkException(
          message: error.message ?? 'Unknown network error',
        );
    }
  }
}