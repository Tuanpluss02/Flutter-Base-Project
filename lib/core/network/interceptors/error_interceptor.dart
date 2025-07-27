import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:base/core/error/exception.dart';
import 'package:logger/logger.dart';

/// Interceptor that handles common HTTP errors and provides better error messages
@injectable
class ErrorInterceptor extends Interceptor {
  static final Logger _logger = Logger();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Log the error for debugging
    _logError(err);

    // Transform DioException to custom exceptions with better messages
    final customException = _transformError(err);
    
    // Create a new DioException with custom message
    final transformedError = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: customException,
      message: _getErrorMessage(err),
    );

    handler.next(transformedError);
  }

  /// Transform DioException to custom exception types
  Exception _transformError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkException(
          message: 'Connection timeout. Please check your internet connection and try again.',
        );

      case DioExceptionType.badResponse:
        return _handleBadResponse(error);

      case DioExceptionType.cancel:
        return const NetworkException(message: 'Request was cancelled');

      case DioExceptionType.connectionError:
        return const NetworkException(
          message: 'No internet connection. Please check your network settings.',
        );

      case DioExceptionType.badCertificate:
        return const NetworkException(
          message: 'Security certificate error. Please try again later.',
        );

      case DioExceptionType.unknown:
        return NetworkException(
          message: error.message ?? 'An unexpected error occurred',
        );
    }
  }

  /// Handle bad response errors (4xx, 5xx status codes)
  Exception _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    final responseData = error.response?.data;

    switch (statusCode) {
      case 400:
        return ServerException(
          message: _extractErrorMessage(responseData) ?? 'Bad request. Please check your input.',
        );

      case 401:
        return const ServerException(
          message: 'Authentication failed. Please log in again.',
        );

      case 403:
        return const ServerException(
          message: 'Access denied. You don\'t have permission to perform this action.',
        );

      case 404:
        return const ServerException(
          message: 'The requested resource was not found.',
        );

      case 409:
        return ServerException(
          message: _extractErrorMessage(responseData) ?? 'Conflict. The resource already exists.',
        );

      case 422:
        return ServerException(
          message: _extractErrorMessage(responseData) ?? 'Validation failed. Please check your input.',
        );

      case 429:
        return const ServerException(
          message: 'Too many requests. Please wait a moment and try again.',
        );

      case 500:
        return const ServerException(
          message: 'Internal server error. Please try again later.',
        );

      case 502:
        return const ServerException(
          message: 'Bad gateway. The server is temporarily unavailable.',
        );

      case 503:
        return const ServerException(
          message: 'Service unavailable. Please try again later.',
        );

      case 504:
        return const ServerException(
          message: 'Gateway timeout. The server took too long to respond.',
        );

      default:
        if (statusCode != null && statusCode >= 500) {
          return const ServerException(
            message: 'Server error. Please try again later.',
          );
        } else if (statusCode != null && statusCode >= 400) {
          return ServerException(
            message: _extractErrorMessage(responseData) ?? 'Client error. Please check your request.',
          );
        } else {
          return ServerException(
            message: _extractErrorMessage(responseData) ?? 'An unexpected error occurred.',
          );
        }
    }
  }

  /// Extract error message from response data
  String? _extractErrorMessage(dynamic responseData) {
    if (responseData == null) return null;

    try {
      if (responseData is Map<String, dynamic>) {
        // Try common error message fields
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

  /// Get user-friendly error message
  String _getErrorMessage(DioException error) {
    final customException = _transformError(error);
    
    if (customException is ServerException) {
      return customException.message ?? 'Server error occurred';
    } else if (customException is NetworkException) {
      return customException.message ?? 'Network error occurred';
    }
    
    return 'An unexpected error occurred';
  }

  /// Log error for debugging purposes
  void _logError(DioException error) {
    _logger.e('🚨 API Error: ${error.type}');
    _logger.e('📍 URL: ${error.requestOptions.uri}');
    _logger.e('📊 Status Code: ${error.response?.statusCode}');
    _logger.e('📝 Message: ${error.message}');
    
    if (error.response?.data != null) {
      _logger.e('📄 Response Data: ${error.response?.data}');
    }
  }
}