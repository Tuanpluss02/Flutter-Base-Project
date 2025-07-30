import 'package:dio/dio.dart';
import 'package:base/core/error/exception.dart';

class NetworkInfo {
  static Future<bool> get isConnected async {
    try {
      // Simple connectivity check using Dio
      final dio = Dio();
      dio.options.connectTimeout = const Duration(seconds: 5);
      dio.options.receiveTimeout = const Duration(seconds: 5);

      // Try to reach a reliable endpoint
      final response = await dio.get('https://www.google.com');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Check connectivity to a specific host
  static Future<bool> isHostReachable(String host) async {
    try {
      final dio = Dio();
      dio.options.connectTimeout = const Duration(seconds: 5);
      dio.options.receiveTimeout = const Duration(seconds: 5);

      final response = await dio.get(host);
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}

class DioErrorHandler {
  static Exception handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkException(
          message: 'Connection timeout. Please check your internet connection.',
        );

      case DioExceptionType.badResponse:
        return _handleBadResponse(error);

      case DioExceptionType.cancel:
        return const NetworkException(message: 'Request was cancelled');

      case DioExceptionType.connectionError:
        return const NetworkException(
          message:
              'No internet connection. Please check your network settings.',
        );

      case DioExceptionType.badCertificate:
        return const NetworkException(
          message: 'Security certificate error. Please try again later.',
        );

      case DioExceptionType.unknown:
        return NetworkException(
          message: error.message ?? 'An unexpected network error occurred',
        );
    }
  }

  static Exception _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    final responseData = error.response?.data;

    switch (statusCode) {
      case 400:
        return ServerException(
          message: _extractErrorMessage(responseData) ?? 'Bad request',
        );
      case 401:
        return const ServerException(message: 'Unauthorized access');
      case 403:
        return const ServerException(message: 'Access forbidden');
      case 404:
        return const ServerException(message: 'Resource not found');
      case 409:
        return ServerException(
          message: _extractErrorMessage(responseData) ?? 'Conflict occurred',
        );
      case 422:
        return ServerException(
          message: _extractErrorMessage(responseData) ?? 'Validation failed',
        );
      case 429:
        return const ServerException(message: 'Too many requests');
      case 500:
        return const ServerException(message: 'Internal server error');
      case 502:
        return const ServerException(message: 'Bad gateway');
      case 503:
        return const ServerException(message: 'Service unavailable');
      case 504:
        return const ServerException(message: 'Gateway timeout');
      default:
        if (statusCode != null && statusCode >= 500) {
          return const ServerException(message: 'Server error');
        } else if (statusCode != null && statusCode >= 400) {
          return ServerException(
            message: _extractErrorMessage(responseData) ?? 'Client error',
          );
        } else {
          return const ServerException(message: 'Unknown server error');
        }
    }
  }

  static String? _extractErrorMessage(dynamic responseData) {
    if (responseData == null) return null;

    try {
      if (responseData is Map<String, dynamic>) {
        return responseData['message'] ??
            responseData['error'] ??
            responseData['detail'] ??
            responseData['error_description'];
      } else if (responseData is String) {
        return responseData;
      }
    } catch (e) {
      // If parsing fails, return null
    }

    return null;
  }
}
