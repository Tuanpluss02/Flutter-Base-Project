import 'package:base/configs/flavor/flavor_config.dart';
import 'package:base/core/network/alice_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(AliceService aliceService) {
    final dio = Dio(
      BaseOptions(
        baseUrl: FlavorConfig.apiBaseUrl,
        connectTimeout: Duration(milliseconds: FlavorConfig.apiTimeout),
        receiveTimeout: Duration(milliseconds: FlavorConfig.apiTimeout),
        sendTimeout: Duration(milliseconds: FlavorConfig.apiTimeout),
      ),
    );

    if (FlavorConfig.debugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          maxWidth: 120,
        ),
      );
    }

    // Add Alice interceptor for development flavor
    if (FlavorConfig.isDevelopment && aliceService.isEnabled) {
      dio.interceptors.add(aliceService.aliceDioAdapter);
    }

    return dio;
  }

  @preResolve
  @singleton
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
