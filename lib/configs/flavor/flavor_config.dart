import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Flavor { develop, production }

class FlavorConfig {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    return appName;
  }

  /// Load environment variables based on the current flavor
  static Future<void> loadEnv() async {
    String envFile;
    switch (appFlavor) {
      case Flavor.develop:
        envFile = 'assets/env/.env.dev';
        break;
      case Flavor.production:
        envFile = 'assets/env/.env.production';
        break;
      default:
        envFile = 'assets/env/.env';
    }
    await dotenv.load(fileName: envFile);
  }

  static String get apiBaseUrl {
    return dotenv.env['BASE_URL'] ?? _getDefaultApiBaseUrl();
  }

  static String _getDefaultApiBaseUrl() {
    switch (appFlavor) {
      case Flavor.develop:
        return 'https://api-dev.example.com';
      case Flavor.production:
        return 'https://api.example.com';
      default:
        return 'https://api.example.com';
    }
  }

  static int get apiTimeout {
    final timeoutStr = dotenv.env['API_TIMEOUT'];
    return timeoutStr != null ? int.tryParse(timeoutStr) ?? 30000 : 30000;
  }

  static bool get debugMode {
    final debugStr = dotenv.env['DEBUG_MODE'];
    return debugStr?.toLowerCase() == 'true';
  }

  static String get logLevel {
    return dotenv.env['LOG_LEVEL'] ?? 'info';
  }

  static bool get isDevelopment => appFlavor == Flavor.develop;
  static bool get isProduction => appFlavor == Flavor.production;

  static String get bundleId {
    return dotenv.env['BUNDLE_ID'] ?? _getDefaultBundleId();
  }

  static String _getDefaultBundleId() {
    switch (appFlavor) {
      case Flavor.develop:
        return 'com.stormx.base.dev';
      case Flavor.production:
        return 'com.stormx.base';
      default:
        return 'com.stormx.base';
    }
  }

  static String get appName {
    return dotenv.env['APP_NAME'] ?? _getDefaultAppName();
  }

  static String _getDefaultAppName() {
    switch (appFlavor) {
      case Flavor.develop:
        return 'Base Dev';
      case Flavor.production:
        return 'Base';
      default:
        return 'Base';
    }
  }
}
