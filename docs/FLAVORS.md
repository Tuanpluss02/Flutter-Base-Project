# Flutter Flavors Setup

This project is configured with Flutter flavors for different environments: **develop** and **production**.

## Environment Files

The project uses environment-specific configuration files:

- `assets/env/.env.dev` - Development environment configuration
- `assets/env/.env.production` - Production environment configuration
- `assets/env/.env` - Default fallback configuration

### Environment Variables

Each environment file contains the following variables:

```env
BASE_URL=https://api.example.com
API_TIMEOUT=30000
DEBUG_MODE=true
APP_NAME=Base
LOG_LEVEL=debug
```

## Running the App

### Development Flavor
```bash
# Debug mode
fvm flutter run --flavor develop --target lib/main_develop.dart

# Release mode
fvm flutter run --flavor develop --target lib/main_develop.dart --release
```

### Production Flavor
```bash
# Debug mode
fvm flutter run --flavor production --target lib/main_production.dart

# Release mode
fvm flutter run --flavor production --target lib/main_production.dart --release
```

## Building the App

### Android
```bash
# Development
fvm flutter build apk --flavor develop --target lib/main_develop.dart

# Production
fvm flutter build apk --flavor production --target lib/main_production.dart
```

### iOS
```bash
# Development
fvm flutter build ios --flavor develop --target lib/main_develop.dart

# Production
fvm flutter build ios --flavor production --target lib/main_production.dart
```

## Flavor Configuration

The `FlavorConfig` class provides access to environment-specific values:

```dart
import 'package:base/configs/flavor/flavor_config.dart';

// Get current flavor name
String flavorName = FlavorConfig.name;

// Get API base URL from environment
String apiUrl = FlavorConfig.apiBaseUrl;

// Get API timeout from environment
int timeout = FlavorConfig.apiTimeout;

// Check if debug mode is enabled
bool isDebug = FlavorConfig.debugMode;

// Get app name from environment
String appName = FlavorConfig.appName;
```

## App Identifiers

### Android
- **Development**: `com.stormx.base.dev`
- **Production**: `com.stormx.base`

### iOS
- **Development**: `com.stormx.base.dev`
- **Production**: `com.stormx.base`


## Adding New Environment Variables

1. Add the variable to the appropriate `.env` files
2. Add a getter method in `FlavorConfig` class to access the variable
3. Use `dotenv.env['VARIABLE_NAME']` to read the value

Example:
```dart
static String get newVariable {
  return dotenv.env['NEW_VARIABLE'] ?? 'default_value';
}
```