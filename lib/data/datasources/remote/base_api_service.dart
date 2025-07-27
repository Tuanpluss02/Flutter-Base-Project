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
    _dio.options.sendTimeout = timeout;
  }

  /// Add a custom header for a single request
  void addHeader(String key, String value) {
    _dio.options.headers[key] = value;
  }

  /// Remove a header
  void removeHeader(String key) {
    _dio.options.headers.remove(key);
  }

  /// Set authorization header
  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  /// Clear authorization header
  void clearAuthToken() {
    _dio.options.headers.remove('Authorization');
  }

  /// Set content type
  void setContentType(String contentType) {
    _dio.options.headers['Content-Type'] = contentType;
  }

  /// Enable/disable following redirects
  void setFollowRedirects(bool follow) {
    _dio.options.followRedirects = follow;
  }

  /// Set maximum number of redirects
  void setMaxRedirects(int maxRedirects) {
    _dio.options.maxRedirects = maxRedirects;
  }

  /// Add query parameters to all requests
  void addGlobalQueryParameters(Map<String, dynamic> params) {
    _dio.options.queryParameters.addAll(params);
  }

  /// Clear all global query parameters
  void clearGlobalQueryParameters() {
    _dio.options.queryParameters.clear();
  }

  /// Get current configuration as a map
  Map<String, dynamic> getConfiguration() {
    return {
      'baseUrl': _dio.options.baseUrl,
      'connectTimeout': _dio.options.connectTimeout?.inMilliseconds,
      'receiveTimeout': _dio.options.receiveTimeout?.inMilliseconds,
      'sendTimeout': _dio.options.sendTimeout?.inMilliseconds,
      'headers': Map<String, dynamic>.from(_dio.options.headers),
      'queryParameters': Map<String, dynamic>.from(_dio.options.queryParameters),
      'followRedirects': _dio.options.followRedirects,
      'maxRedirects': _dio.options.maxRedirects,
    };
  }

  /// Reset configuration to defaults
  void resetConfiguration() {
    _dio.options = BaseOptions();
  }
}