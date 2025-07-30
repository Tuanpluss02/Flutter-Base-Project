# Setup Guide

This guide provides detailed instructions for setting up the Flutter Base Project.

## Prerequisites

### Required Software
- **Flutter SDK 3.32.4**
- **Dart SDK ^3.8.1**
- **FVM (Flutter Version Management)**
- **Git**

### Platform-specific Requirements

#### Android Development
- Android Studio or VS Code with Flutter extension
- Android SDK (API level 21 or higher)
- Java Development Kit (JDK) 8 or higher

#### iOS Development (macOS only)
- Xcode 12.0 or higher
- iOS Simulator or physical iOS device
- CocoaPods

#### Web Development
- Chrome browser for debugging

#### Desktop Development
- Platform-specific build tools (Visual Studio for Windows, Xcode for macOS, etc.)

## Installation Steps

### 1. Install FVM

```bash
# Install FVM globally
dart pub global activate fvm

# Verify installation
fvm --version
```

### 2. Clone and Setup Project

```bash
# Clone the repository
git clone <repository-url>
cd base

# Install and use Flutter version
fvm install 3.32.4
fvm use 3.32.4

# Verify Flutter installation
fvm flutter --version
```

### 3. Install Dependencies

```bash
# Install Flutter dependencies
fvm flutter pub get

# For iOS (macOS only)
cd ios && pod install && cd ..

# For macOS (macOS only)
cd macos && pod install && cd ..
```

### 4. Generate Code

```bash
# Generate all code (models, assets, translations, etc.)
fvm flutter packages pub run build_runner build --delete-conflicting-outputs
```

### 5. Setup Development Environment

The project includes a comprehensive development environment setup script that manages git hooks and development tools.

#### Install Git Hooks (Default)
```bash
# Install pre-commit hooks and setup development tools
./scripts/setup_dev.sh

# Alternative commands (same result)
./scripts/setup_dev.sh install
./scripts/setup_dev.sh add
```

#### Git Hook Management Commands
```bash
# Check current git hooks status
./scripts/setup_dev.sh status

# Remove git hooks
./scripts/setup_dev.sh remove
./scripts/setup_dev.sh uninstall

# Show help and available commands
./scripts/setup_dev.sh help
```

#### What Gets Configured
- ✅ Pre-commit hook that auto-formats code before each commit
- ✅ Static analysis checks before commits
- ✅ Automatic code fixing with `dart fix --apply`
- ✅ Integration with CI/CD workflows for auto-formatting

#### Git Hook Features
The pre-commit hook automatically:
1. Detects staged Dart files
2. Applies `dart fix --apply` to fix common issues
3. Formats code with `dart format`
4. Re-stages formatted files
5. Runs `flutter analyze` with fatal warnings
6. Prevents commit if analysis fails

## Environment Configuration

### Environment Files
Create and configure environment files in `assets/env/`:

#### Development Environment (`assets/env/.env.dev`)
```env
BASE_URL=https://dev-api.example.com
API_TIMEOUT=30000
DEBUG_MODE=true
APP_NAME=Base Dev
LOG_LEVEL=debug
```

#### Production Environment (`assets/env/.env.production`)
```env
BASE_URL=https://api.example.com
API_TIMEOUT=15000
DEBUG_MODE=false
APP_NAME=Base
LOG_LEVEL=info
```

## Running the Application

### Development Flavor
```bash
# Debug mode
fvm flutter run --flavor develop --target lib/main_develop.dart

# Release mode
fvm flutter run --flavor develop --target lib/main_develop.dart --release

# Specific device
fvm flutter run --flavor develop --target lib/main_develop.dart -d <device-id>
```

### Production Flavor
```bash
# Debug mode
fvm flutter run --flavor production --target lib/main_production.dart

# Release mode
fvm flutter run --flavor production --target lib/main_production.dart --release
```

### Platform-specific Commands

#### Web
```bash
fvm flutter run --flavor develop --target lib/main_develop.dart -d chrome
```

#### Desktop
```bash
# macOS
fvm flutter run --flavor develop --target lib/main_develop.dart -d macos

# Windows
fvm flutter run --flavor develop --target lib/main_develop.dart -d windows

# Linux
fvm flutter run --flavor develop --target lib/main_develop.dart -d linux
```

## Building for Release

### Android
```bash
# APK
fvm flutter build apk --flavor production --target lib/main_production.dart

# App Bundle (recommended for Play Store)
fvm flutter build appbundle --flavor production --target lib/main_production.dart
```

### iOS
```bash
# iOS App
fvm flutter build ios --flavor production --target lib/main_production.dart

# Archive for App Store
fvm flutter build ipa --flavor production --target lib/main_production.dart
```

### Web
```bash
fvm flutter build web --target lib/main_production.dart
```

### Desktop
```bash
# macOS
fvm flutter build macos --target lib/main_production.dart

# Windows
fvm flutter build windows --target lib/main_production.dart

# Linux
fvm flutter build linux --target lib/main_production.dart
```

## IDE Configuration

### VS Code
Recommended extensions:
- Flutter
- Dart
- Bracket Pair Colorizer
- GitLens
- Error Lens

### Android Studio
- Flutter plugin
- Dart plugin

## Troubleshooting

### Common Issues

#### FVM not found
```bash
# Add to your shell profile (.bashrc, .zshrc, etc.)
export PATH="$PATH":"$HOME/.pub-cache/bin"
```

#### Flutter version mismatch
```bash
# Ensure you're using FVM
fvm flutter --version

# If not, use FVM commands
fvm use 3.32.4
```

#### Git hooks setup issues
```bash
# Check git hooks status
./scripts/setup_dev.sh status

# Remove and reinstall git hooks
./scripts/setup_dev.sh remove
./scripts/setup_dev.sh install

# Verify git hooks are working
git add .
git commit -m "test commit" --dry-run
```

#### Build failures
```bash
# Clean and rebuild
fvm flutter clean
fvm flutter pub get
fvm flutter packages pub run build_runner build --delete-conflicting-outputs
```

#### iOS build issues
```bash
# Clean iOS build
cd ios
rm -rf Pods Podfile.lock
pod install
cd ..
```

### Getting Help

1. Check the [Development Guide](DEVELOPMENT.md) for common workflows
2. Review the [Architecture Guide](ARCHITECTURE.md) for project structure
3. Check existing issues in the repository
4. Create a new issue with detailed error information