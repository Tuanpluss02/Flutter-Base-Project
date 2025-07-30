import 'dart:io';

import 'package:base/configs/flavor/flavor_config.dart';
import 'package:base/core/services/alice_service.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
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
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'User-Agent': 'Flutter App/${FlavorConfig.name}',
        },
      ),
    );
    // Configure HTTP client adapter for better SSL handling
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final HttpClient client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );

    if (FlavorConfig.debugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
        ),
      );
    }

    // Add Alice interceptor for development flavor
    if (FlavorConfig.isDevelopment && aliceService.isEnabled) {
      try {
        dio.interceptors.add(aliceService.aliceDioAdapter);
      } catch (e) {
        // If Alice is not properly initialized, continue without it
        // This prevents the app from crashing if Alice setup fails
        if (FlavorConfig.debugMode) {
          debugPrint('Warning: Alice interceptor could not be added: $e');
        }
      }
    }

    return dio;
  }

  @preResolve
  @singleton
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
