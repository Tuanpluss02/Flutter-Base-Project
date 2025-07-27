import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:base/configs/flavor/flavor_config.dart';

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
      },
    );

    // Add interceptors conditionally based on debug mode
    if (FlavorConfig.debugMode) {
      dio.interceptors.addAll([
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      ]);
    }

    return dio;
  }

  @preResolve
  @singleton
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();
}