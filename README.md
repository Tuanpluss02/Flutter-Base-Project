# Flutter Base Project

A comprehensive Flutter base project template with modern architecture, best practices, and essential features pre-configured. This template provides a solid foundation for building scalable Flutter applications with clean architecture principles.

## 🚀 Key Features

- **Clean Architecture** with BLoC state management
- **Dependency Injection** with GetIt & Injectable
- **Type-safe Networking** with Retrofit & Dio
- **Localization** with Slang (EN/VI support)
- **Environment Flavors** (develop/production)
- **Code Generation** (Freezed, JSON, Assets)
- **Comprehensive Linting** & CI/CD workflows
- **Multi-platform Support** (iOS, Android, Web, Desktop)

## 🛠️ Prerequisites

- Flutter SDK 3.32.4 (managed via FVM)
- Dart SDK ^3.8.1
- FVM (Flutter Version Management)

## 🚀 Quick Start

```bash
# 1. Install FVM and Flutter version
dart pub global activate fvm
fvm install 3.32.4
fvm use 3.32.4

# 2. Install dependencies
fvm flutter pub get

# 3. Generate code
fvm flutter packages pub run build_runner build --delete-conflicting-outputs

# 4. Run the app
fvm flutter run --flavor develop -t lib/main_develop.dart
```

## 📁 Project Structure

```
lib/
├── app/                    # Application-level configuration
├── configs/                # App configuration (theme, router, flavors)
├── core/                   # Core functionality (DI, network, services)
├── data/                   # Data layer (models, repositories, datasources)
├── domain/                 # Domain layer (entities, repositories, usecases)
├── generated/              # Generated code (assets, translations, data)
└── presentation/           # UI layer (modules, shared components)
```

## 📦 Key Dependencies

### Production
- `flutter_bloc` - State management
- `get_it` & `injectable` - Dependency injection
- `dio` & `retrofit` - Networking
- `go_router` - Navigation
- `slang` - Localization
- `freezed` - Immutable data classes

### Development
- `build_runner` - Code generation
- `flutter_lints` - Linting rules
- `json_serializable` - JSON serialization

## 📚 Documentation

Detailed documentation is available in the `docs/` folder:

- **[Setup Guide](docs/SETUP.md)** - Detailed setup and installation
- **[Architecture Guide](docs/ARCHITECTURE.md)** - Project architecture and patterns
- **[Flavors Guide](docs/FLAVORS.md)** - Environment configuration
- **[Development Guide](docs/DEVELOPMENT.md)** - Development workflows
- **[Auto-Format Guide](docs/AUTO_FORMAT_GUIDE.md)** - Code formatting setup
- **[Lint Guide](docs/LINT_GUIDE.md)** - Linting configuration

## 🧪 Testing & Quality

```bash
# Run tests
fvm flutter test

# Analyze code
fvm flutter analyze

# Format code
dart format .
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and linting
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

---

**Happy Coding! 🎉**

This base project provides everything you need to start building amazing Flutter applications with best practices and modern architecture patterns.
