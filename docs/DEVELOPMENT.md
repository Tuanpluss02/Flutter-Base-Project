# Development Guide

## Development Workflow

### 1. Setting Up Development Environment

#### Prerequisites
- Flutter SDK (managed via FVM)
- Dart SDK (included with Flutter)
- IDE (VS Code or Android Studio)
- Git

#### Initial Setup
```bash
# Clone the repository
git clone <repository-url>
cd base

# Install FVM if not already installed
dart pub global activate fvm

# Install Flutter version specified in .fvmrc
fvm install

# Get dependencies
fvm flutter pub get

# Generate code
fvm dart run build_runner build --delete-conflicting-outputs
```

### 2. Daily Development Workflow

#### Starting Development
```bash
# Pull latest changes
git pull origin main

# Update dependencies if needed
fvm flutter pub get

# Generate code if models/APIs changed
fvm dart run build_runner build --delete-conflicting-outputs

# Run the app
fvm flutter run --flavor develop
```

#### Code Generation Workflow
```bash
# Watch for changes and auto-generate
fvm dart run build_runner watch --delete-conflicting-outputs

# One-time generation
fvm dart run build_runner build --delete-conflicting-outputs

# Clean and regenerate
fvm dart run build_runner clean
fvm dart run build_runner build --delete-conflicting-outputs
```

### 3. Feature Development Process

#### Creating a New Feature

1. **Create Feature Structure**
```
lib/presentation/modules/feature_name/
├── cubit/
│   ├── feature_cubit.dart
│   └── feature_state.dart
└── feature_page.dart

lib/domain/usecases/
└── get_feature_usecase.dart

lib/data/
├── models/
│   └── feature_model.dart
├── datasources/
│   ├── local/
│   │   └── feature_local_data_source.dart
│   └── remote/
│       └── feature_api_service.dart
└── repositories/
    └── feature_repository_impl.dart
```

2. **Define Domain Layer**
```dart
// lib/domain/entities/feature_entity.dart
class FeatureEntity extends Equatable {
  const FeatureEntity({
    required this.id,
    required this.name,
  });
  
  final int id;
  final String name;
  
  @override
  List<Object> get props => [id, name];
  
  FeatureEntity copyWith({
    int? id,
    String? name,
  }) {
    return FeatureEntity(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}

// lib/domain/repositories/feature_repository.dart
abstract class FeatureRepository {
  Future<Either<Failure, List<FeatureEntity>>> getFeatures();
  Future<Either<Failure, FeatureEntity>> getFeatureById(int id);
}

// lib/domain/usecases/get_features_usecase.dart
@injectable
class GetFeaturesUseCase extends UseCaseWithoutParams<List<FeatureEntity>> {
  GetFeaturesUseCase(this._repository);
  
  final FeatureRepository _repository;
  
  @override
  Future<Either<Failure, List<FeatureEntity>>> call() async {
    return await _repository.getFeatures();
  }
}
```

3. **Implement Data Layer**
```dart
// lib/data/models/feature_model.dart
class FeatureModel {
  const FeatureModel({
    required this.id,
    required this.name,
  });
  
  factory FeatureModel.fromJson(Map<String, dynamic> json) {
    return FeatureModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
  
  factory FeatureModel.fromEntity(FeatureEntity entity) {
    return FeatureModel(
      id: entity.id,
      name: entity.name,
    );
  }
  
  final int id;
  final String name;
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
  
  FeatureEntity toEntity() {
    return FeatureEntity(
      id: id,
      name: name,
    );
  }
}
```

4. **Create Cubit**
```dart
// lib/presentation/modules/feature/cubit/feature_cubit.dart
@injectable
class FeatureCubit extends Cubit<FeatureState> {
  FeatureCubit(this._getFeaturesUseCase) : super(FeatureInitial());
  
  final GetFeaturesUseCase _getFeaturesUseCase;
  
  Future<void> fetchFeatures() async {
    emit(FeatureLoading());
    final result = await _getFeaturesUseCase();
    
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
        emit(FeatureError(errorMessage));
      },
      (features) {
        emit(FeatureLoaded(features));
      },
    );
  }
  
  void resetState() {
    emit(FeatureInitial());
  }
}

// lib/presentation/modules/feature/cubit/feature_state.dart
part of 'feature_cubit.dart';

abstract class FeatureState {}

class FeatureInitial extends FeatureState {}

class FeatureLoading extends FeatureState {}

class FeatureLoaded extends FeatureState {
  FeatureLoaded(this.features);
  final List<FeatureEntity> features;
}

class FeatureError extends FeatureState {
  FeatureError(this.message);
  final String message;
}
```

5. **Register Dependencies**
```dart
// lib/core/di/injection.dart
@module
abstract class FeatureModule {
  @Injectable(as: FeatureRepository)
  FeatureRepositoryImpl featureRepository(
    FeatureApiService apiService,
    FeatureLocalDataSource localDataSource,
  ) => FeatureRepositoryImpl(apiService, localDataSource);
}
```

## Coding Standards

### 1. Dart/Flutter Conventions

#### File Naming
- Use `snake_case` for file names
- Use descriptive names that reflect the file's purpose
- Add appropriate suffixes (`_bloc.dart`, `_model.dart`, `_page.dart`)

#### Class Naming
```dart
// Good
class UserRepository {}
class LoginBloc {}
class UserModel {}

// Bad
class userRepository {}
class loginbloc {}
class user_model {}
```

#### Variable Naming
```dart
// Good
final String userName = 'John';
const int maxRetryCount = 3;
final List<User> activeUsers = [];

// Bad
final String user_name = 'John';
const int MAX_RETRY_COUNT = 3;
final List<User> active_users = [];
```

### 2. Code Organization

#### Import Organization
```dart
// Dart imports
import 'dart:async';
import 'dart:convert';

// Flutter imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

// Project imports
import 'package:base/core/error/failures.dart';
import 'package:base/domain/entities/user.dart';
```

#### Class Structure
```dart
class ExampleClass {
  // Static constants
  static const String defaultValue = 'default';
  
  // Instance variables
  final String _privateField;
  String publicField;
  
  // Constructor
  ExampleClass({
    required String privateField,
    this.publicField = '',
  }) : _privateField = privateField;
  
  // Named constructors
  ExampleClass.empty() : this(privateField: '');
  
  // Getters
  String get privateField => _privateField;
  
  // Public methods
  void publicMethod() {}
  
  // Private methods
  void _privateMethod() {}
  
  // Overrides
  @override
  String toString() => 'ExampleClass($_privateField)';
}
```

### 3. Widget Best Practices

#### Widget Structure
```dart
class CustomWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  
  const CustomWidget({
    super.key,
    required this.title,
    this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Text(title),
      ),
    );
  }
}
```

#### Use const Constructors
```dart
// Good
const Text('Hello World')
const SizedBox(height: 16)
const EdgeInsets.all(8)

// Bad
Text('Hello World')
SizedBox(height: 16)
EdgeInsets.all(8)
```

#### Extract Widgets
```dart
// Good - Extract complex widgets
class UserCard extends StatelessWidget {
  final User user;
  
  const UserCard({super.key, required this.user});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.name),
        subtitle: Text(user.email),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.avatar),
        ),
      ),
    );
  }
}

// Usage
ListView.builder(
  itemBuilder: (context, index) => UserCard(user: users[index]),
)
```

### 4. State Management Best Practices

#### Cubit States
```dart
// Good - Clear state hierarchy
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
```

#### Cubit Implementation
```dart
// Good - Proper error handling
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
  
  void resetState() {
    emit(UserInitial());
  }
}
```

## Testing Guidelines

### 1. Unit Testing

#### Test Structure
```dart
void main() {
  group('GetUserUseCase', () {
    late GetUserUseCase useCase;
    late MockUserRepository mockRepository;
    
    setUp(() {
      mockRepository = MockUserRepository();
      useCase = GetUserUseCase(mockRepository);
    });
    
    test('should return user when repository call is successful', () async {
      // Arrange
      const userId = '123';
      const user = User(id: userId, name: 'John', email: 'john@example.com');
      when(() => mockRepository.getUser(userId))
          .thenAnswer((_) async => const Right(user));
      
      // Act
      final result = await useCase(userId);
      
      // Assert
      expect(result, const Right(user));
      verify(() => mockRepository.getUser(userId)).called(1);
    });
  });
}
```

### 2. Widget Testing

```dart
void main() {
  group('UserCard', () {
    testWidgets('should display user information', (tester) async {
      // Arrange
      const user = User(
        id: '1',
        name: 'John Doe',
        email: 'john@example.com',
      );
      
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserCard(user: user),
          ),
        ),
      );
      
      // Assert
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('john@example.com'), findsOneWidget);
    });
  });
}
```

### 3. BLoC Testing

```dart
void main() {
  group('UserBloc', () {
    late UserBloc bloc;
    late MockGetUserUseCase mockGetUserUseCase;
    
    setUp(() {
      mockGetUserUseCase = MockGetUserUseCase();
      bloc = UserBloc(mockGetUserUseCase);
    });
    
    blocTest<UserBloc, UserState>(
      'emits [UserLoading, UserLoaded] when GetUserEvent is successful',
      build: () {
        when(() => mockGetUserUseCase('123'))
            .thenAnswer((_) async => const Right(user));
        return bloc;
      },
      act: (bloc) => bloc.add(GetUserEvent('123')),
      expect: () => [
        UserLoading(),
        UserLoaded(user),
      ],
    );
  });
}
```

## Performance Optimization

### 1. Widget Performance

#### Use const Constructors
```dart
// Good
const Text('Static text')
const Icon(Icons.home)

// Bad
Text('Static text')
Icon(Icons.home)
```

#### Avoid Rebuilds
```dart
// Good - Use BlocBuilder with buildWhen
BlocBuilder<CounterBloc, CounterState>(
  buildWhen: (previous, current) => previous.count != current.count,
  builder: (context, state) => Text('${state.count}'),
)

// Good - Extract static widgets
class StaticWidget extends StatelessWidget {
  const StaticWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Text('This never changes');
  }
}
```

### 2. Memory Management

#### Dispose Resources
```dart
class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late StreamSubscription _subscription;
  late TextEditingController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _subscription = someStream.listen((data) {
      // Handle data
    });
  }
  
  @override
  void dispose() {
    _controller.dispose();
    _subscription.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return TextField(controller: _controller);
  }
}
```

## Debugging and Troubleshooting

### 1. Common Issues

#### Code Generation Issues
```bash
# Clean and regenerate
fvm dart run build_runner clean
fvm dart run build_runner build --delete-conflicting-outputs

# Check for conflicts
fvm dart run build_runner build
```

#### Dependency Issues
```bash
# Clean dependencies
fvm flutter clean
fvm flutter pub get

# Reset pub cache
fvm flutter pub cache repair
```

### 2. Debugging Tools

#### Flutter Inspector
- Use Flutter Inspector in IDE
- Analyze widget tree
- Check performance metrics

#### Logging
```dart
// Use logger package
final logger = Logger();

logger.d('Debug message');
logger.i('Info message');
logger.w('Warning message');
logger.e('Error message');
```

#### Alice for Network Debugging
```dart
// Alice is already configured in the project
// Check network calls in Alice overlay
```

## Git Workflow

### 1. Branch Naming
```bash
# Feature branches
feature/user-authentication
feature/payment-integration

# Bug fixes
bugfix/login-validation
bugfix/memory-leak

# Hotfixes
hotfix/critical-security-patch
```

### 2. Commit Messages
```bash
# Good commit messages
git commit -m "feat: add user authentication"
git commit -m "fix: resolve memory leak in image loading"
git commit -m "docs: update API documentation"
git commit -m "refactor: improve error handling"

# Conventional commits format
type(scope): description

# Types: feat, fix, docs, style, refactor, test, chore
```

### 3. Pull Request Process
1. Create feature branch from `develop`
2. Implement feature with tests
3. Run linting and tests
4. Create pull request
5. Code review
6. Merge to `develop`

