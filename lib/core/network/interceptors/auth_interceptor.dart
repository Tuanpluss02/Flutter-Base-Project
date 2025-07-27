import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

/// Interceptor that automatically adds authentication headers to requests
@injectable
class AuthInterceptor extends Interceptor {
  static const String _tokenKey = 'auth_token';
  static const String _refreshTokenKey = 'refresh_token';
  static final Logger _logger = Logger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      // Get stored auth token
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(_tokenKey);

      if (token != null && token.isNotEmpty) {
        // Add Bearer token to Authorization header
        options.headers['Authorization'] = 'Bearer $token';
      }

      // Add device/app specific headers
      options.headers['User-Agent'] = await _getUserAgent();
      options.headers['X-App-Version'] = await _getAppVersion();
      
    } catch (e) {
      // If there's an error getting the token, continue without it
      _logger.w('Error adding auth headers: $e');
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 Unauthorized - token might be expired
    if (err.response?.statusCode == 401) {
      try {
        // Attempt to refresh token
        final refreshed = await _refreshToken();
        if (refreshed) {
          // Retry the original request with new token
          final response = await _retryRequest(err.requestOptions);
          handler.resolve(response);
          return;
        }
      } catch (e) {
        // Refresh failed, clear tokens and let the error propagate
        await _clearTokens();
      }
    }

    handler.next(err);
  }

  /// Refresh the authentication token
  Future<bool> _refreshToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final refreshToken = prefs.getString(_refreshTokenKey);

      if (refreshToken == null || refreshToken.isEmpty) {
        return false;
      }

      // TODO: Implement actual refresh token logic here
      // This would typically make a request to your auth endpoint
      // For now, we'll return false to indicate refresh failed
      return false;
    } catch (e) {
      return false;
    }
  }

  /// Retry the original request with new token
  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    final dio = Dio();
    
    // Get the new token
    final prefs = await SharedPreferences.getInstance();
    final newToken = prefs.getString(_tokenKey);
    
    if (newToken != null) {
      requestOptions.headers['Authorization'] = 'Bearer $newToken';
    }

    return dio.fetch(requestOptions);
  }

  /// Clear stored authentication tokens
  Future<void> _clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_refreshTokenKey);
  }

  /// Get user agent string
  Future<String> _getUserAgent() async {
    // TODO: Implement proper user agent detection
    return 'BaseApp/1.0.0';
  }

  /// Get app version
  Future<String> _getAppVersion() async {
    // TODO: Implement proper app version detection
    return '1.0.0';
  }

  /// Store authentication token
  static Future<void> setAuthToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  /// Store refresh token
  static Future<void> setRefreshToken(String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_refreshTokenKey, refreshToken);
  }

  /// Get current auth token
  static Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  /// Clear all authentication data
  static Future<void> clearAuth() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_refreshTokenKey);
  }
}