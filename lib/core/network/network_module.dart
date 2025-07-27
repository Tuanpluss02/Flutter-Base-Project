import 'package:base/configs/flavor/flavor_config.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

@module
abstract class NetworkModule {
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
      // Logging interceptor (should be last for complete request/response logging)
      if (FlavorConfig.debugMode)
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            // All http responses enabled for console logging
            printResponseData: true,
            // All http requests disabled for console logging
            printRequestData: false,
            // Reposnse logs including http - headers
            printResponseHeaders: true,
            // Request logs without http - headers
            printRequestHeaders: false,
          ),
        ),
    ]);

    return dio;
  }

  @preResolve
  @singleton
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
