import 'package:base/configs/flavor/flavor_config.dart';
import 'package:base/core/network/interceptors/auth_interceptor.dart';
import 'package:base/core/network/interceptors/error_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class NetworkModule {
  static final Logger _logger = Logger();

  @lazySingleton
  Dio get dio {
    final dio = Dio();

    // Base options with flavor-based configuration
    final timeoutMs = FlavorConfig.apiTimeout;
    dio.options = BaseOptions(
      baseUrl: FlavorConfig.apiBaseUrl,
      connectTimeout: Duration(milliseconds: timeoutMs),
      receiveTimeout: Duration(milliseconds: timeoutMs),
      sendTimeout: Duration(milliseconds: timeoutMs),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Language': 'en-US,en;q=0.9',
      },
      validateStatus: (status) {
        // Accept status codes from 200 to 299 and 304 (not modified)
        return (status != null && status >= 200 && status < 300) ||
            status == 304;
      },
    );

    // Add interceptors in order of execution
    dio.interceptors.addAll([
      // Authentication interceptor (adds auth headers)
      AuthInterceptor(),

      // Error handling interceptor
      ErrorInterceptor(),

      // Logging interceptor (should be last for complete request/response logging)
      if (FlavorConfig.debugMode)
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
          logPrint: (object) {
            // Custom log print for better formatting
            _logger.d('🌐 API: $object');
          },
        ),
    ]);

    return dio;
  }

  @preResolve
  @singleton
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
