# Architecture Guide

This guide explains the architecture patterns, design principles, and project structure used in the Flutter Base Project.

## Architecture Overview

The project follows **Clean Architecture** principles with clear separation of concerns across different layers:

```
┌─────────────────────────────────────────────────────────────┐
│                    Presentation Layer                       │
│  ┌─────────────────┐  ┌─────────────────┐  ┌──────────────┐ │
│  │     Widgets     │  │      BLoCs      │  │    Pages     │ │
│  └─────────────────┘  └─────────────────┘  └──────────────┘ │
└─────────────────────────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────┐
│                     Domain Layer                            │
│  ┌─────────────────┐  ┌─────────────────┐  ┌──────────────┐ │
│  │    Entities     │  │   Use Cases     │  │ Repositories │ │
│  │                 │  │                 │  │ (Interfaces) │ │
│  └─────────────────┘  └─────────────────┘  └──────────────┘ │
└─────────────────────────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────┐
│                      Data Layer                             │
│  ┌─────────────────┐  ┌─────────────────┐  ┌──────────────┐ │
│  │     Models      │  │  Repositories   │  │ Data Sources │ │
│  │                 │  │(Implementations)│  │              │ │
│  └─────────────────┘  └─────────────────┘  └──────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

## Layer Responsibilities

### 1. Presentation Layer (`lib/presentation/`)

**Responsibility**: UI components, user interactions, and state management.

#### Components:
- **Pages**: Full-screen UI components
- **Widgets**: Reusable UI components
- **BLoCs**: Business Logic Components for state management

#### Key Patterns:
- **BLoC Pattern**: Separates business logic from UI
- **Widget Composition**: Building complex UIs from simple widgets
- **Responsive Design**: Adapting to different screen sizes

```dart
// Example BLoC
class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUseCase _getUserUseCase;
  
  UserBloc(this._getUserUseCase) : super(UserInitial()) {
    on<GetUserEvent>(_onGetUser);
  }
  
  Future<void> _onGetUser(GetUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    final result = await _getUserUseCase(event.userId);
    result.fold(
      (failure) => emit(UserError(failure.message)),
      (user) => emit(UserLoaded(user)),
    );
  }
}
```

### 2. Domain Layer (`lib/domain/`)

**Responsibility**: Business logic, entities, and use cases.

#### Components:
- **Entities**: Core business objects
- **Use Cases**: Application-specific business rules
- **Repository Interfaces**: Contracts for data access

#### Key Patterns:
- **Single Responsibility**: Each use case has one responsibility
- **Dependency Inversion**: Depends on abstractions, not implementations
- **Functional Programming**: Using Either for error handling

```dart
// Example Use Case
class GetUserUseCase {
  final UserRepository _repository;
  
  GetUserUseCase(this._repository);
  
  Future<Either<Failure, User>> call(String userId) async {
    return await _repository.getUser(userId);
  }
}

// Example Entity
class User extends Equatable {
  final String id;
  final String name;
  final String email;
  
  const User({
    required this.id,
    required this.name,
    required this.email,
  });
  
  @override
  List<Object> get props => [id, name, email];
}
```

### 3. Data Layer (`lib/data/`)

**Responsibility**: Data access, external APIs, and local storage.

#### Components:
- **Models**: Data transfer objects with JSON serialization
- **Repository Implementations**: Concrete implementations of domain repositories
- **Data Sources**: Remote (API) and local (database, cache) data sources

#### Key Patterns:
- **Repository Pattern**: Abstracts data sources
- **Data Mapping**: Converting between models and entities
- **Error Handling**: Converting exceptions to domain failures

```dart
// Example Repository Implementation
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteDataSource;
  final UserLocalDataSource _localDataSource;
  
  UserRepositoryImpl(this._remoteDataSource, this._localDataSource);
  
  @override
  Future<Either<Failure, User>> getUser(String userId) async {
    try {
      final userModel = await _remoteDataSource.getUser(userId);
      await _localDataSource.cacheUser(userModel);
      return Right(userModel.toEntity());
    } catch (e) {
      try {
        final cachedUser = await _localDataSource.getCachedUser(userId);
        return Right(cachedUser.toEntity());
      } catch (e) {
        return Left(ServerFailure('Failed to get user'));
      }
    }
  }
}
```

## Core Components

### 1. Dependency Injection (`lib/core/di/`)

Uses **GetIt** and **Injectable** for dependency management:

```dart
@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio => Dio();
  
  @lazySingleton
  ApiService apiService(Dio dio) => ApiService(dio);
}

@injectable
class UserRepository {
  final ApiService _apiService;
  UserRepository(this._apiService);
}
```

### 2. State Management

**Cubit Pattern** with the following structure:

```dart
// States
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  UserLoaded(this.users);
  final List<User> users;
}

class UserError extends UserState {
  UserError(this.message);
  final String message;
}

// Example Cubit implementation
@injectable
class UserCubit extends Cubit<UserState> {
  UserCubit(this._getUsersUseCase) : super(UserInitial());
  
  final GetUsersUseCase _getUsersUseCase;
  
  Future<void> fetchUsers() async {
    emit(UserLoading());
    final result = await _getUsersUseCase();
    
    result.fold(
      (failure) {
        String errorMessage = 'An unexpected error occurred';
        if (failure is ServerFailure) {
          errorMessage = failure.message ?? 'Server Error';
        } else if (failure is NetworkFailure) {
          errorMessage = failure.message ?? 'Network Error';
        } else if (failure is CacheFailure) {
          errorMessage = 'Cache Error';
        }
        emit(UserError(errorMessage));
      },
      (users) {
        emit(UserLoaded(users));
      },
    );
  }
}
```

### 3. Error Handling

Centralized error handling using **Either** from Dartz:

```dart
abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);
  
  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}
```

### 4. Code Generation

The project uses several code generation tools:

#### Injectable for Dependency Injection
```dart
@injectable
class UserService {
  final ApiClient _apiClient;
  UserService(this._apiClient);
}
```

#### JSON Annotation for Serialization
```dart
class UserModel {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? website;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.website,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      website: json['website'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'website': website,
    };
  }
}
```

## Design Patterns

### 1. Repository Pattern
Abstracts data sources and provides a clean API for the domain layer.

### 2. Use Case Pattern
Encapsulates business logic in single-responsibility classes.

### 3. Cubit Pattern
Separates business logic from UI components using simplified state management.

### 4. Factory Pattern
Used for creating instances with dependency injection.

### 5. Observer Pattern
Implemented through Cubit streams for reactive programming.

## File Organization

```
lib/
├── app/
│   └── bloc/                 # App-level state management (theme, locale, etc.)
├── configs/
│   ├── flavor/              # Environment configuration
│   ├── router/              # Navigation setup
│   └── theme/               # App theming
├── core/
│   ├── di/                  # Dependency injection setup
│   ├── error/               # Error handling
│   ├── network/             # Network configuration
│   ├── services/            # Core services
│   └── usecase/             # Base use case classes
├── data/
│   ├── datasources/
│   │   ├── local/           # Local data sources
│   │   └── remote/          # Remote data sources
│   ├── models/              # Data models
│   └── repositories/        # Repository implementations
├── domain/
│   ├── entities/            # Business entities
│   ├── repositories/        # Repository interfaces
│   └── usecases/            # Business use cases
├── generated/               # Generated code
└── presentation/
    ├── modules/
    │   └── feature_name/
    │       ├── cubit/       # Feature-specific Cubits
    │       ├── pages/       # Feature pages
    │       └── widgets/     # Feature widgets
    └── shared/
        ├── widgets/         # Shared widgets
        └── utils/           # UI utilities
```