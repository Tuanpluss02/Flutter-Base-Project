# **Flutter Clean Architecture Base Project Structure**

This is a suggested structure for a Flutter project based on **Clean Architecture**, using popular and modern libraries to make the project scalable and maintainable.

* **Architecture**: Clean Architecture  
* **Highlights**: Includes base classes for Failure and UseCase, and uses the dartz library for robust and consistent error handling.

### **1\. Technologies and Libraries**

| Function                   | Recommended Library                           | Reason                                                                                    |
| :------------------------- | :-------------------------------------------- | :---------------------------------------------------------------------------------------- |
| **State Management**       | bloc, flutter\_bloc                           | A powerful choice that fits well with Clean Architecture.                                 |
| **Dependency Injection**   | get\_it, injectable                           | Automates dependency registration, reducing boilerplate code.                             |
| **Networking**             | dio, pretty\_dio\_logger                      | A powerful HTTP client, easy to log and debug.                                            |
| **REST API Client**        | retrofit                                      | Creates a type-safe API client from an abstract class, perfect with dio.                  |
| **Model & Data Class**     | freezed, json\_serializable                   | Creates immutable data classes and auto-generates fromJson/toJson code.                   |
| **Functional Programming** | dartz                                         | Provides the Either type for explicit handling of errors and success results.             |
| **Assets Generation**      | flutter\_gen                                  | Provides type-safe access to assets, preventing typos in asset path strings.              |
| **Localization**           | easy\_localization                            | A popular and powerful solution for multi-language support.                               |
| **Routing/Navigation**     | go\_router                                    | The official library from the Flutter team, supporting deep-linking and stateful routing. |
| **Local Storage**          | shared\_preferences, flutter\_secure\_storage | For storing simple data and sensitive data.                                               |
| **Logging**                | logger                                        | Provides log levels and a much nicer format than the standard print().                    |
| **Environment**            | flutter\_dotenv or \--dart-define             | Manages environment variables (API keys, base URLs, etc.).                                |

### **2\. Directory Structure**

lib/  
├── app/  
│   ├── bloc/               \# BLoCs/Cubits for each screen  
│   ├── pages/              \# UI Screens  
│   └── widgets/            \# Reusable widgets within the app  
│  
├── configs/                \# Global configurations  
│   ├── l10n/               \# JSON files for easy\_localization  
│   ├── router/             \# Configuration for go\_router  
│   └── theme/              \# Theme configuration (colors, fonts, etc.)  
│  
├── core/                   \# Core, shared components  
│   ├── di/                 \# Dependency Injection setup (injectable)  
│   ├── error/              \# Error handling (Failure, Exception)  
│   ├── network/            \# Dio client setup  
│   └── usecase/            \# Base class for UseCase  
│  
├── data/                   \# Data Layer  
│   ├── datasources/  
│   │   ├── local/          \# Local data sources (SharedPreferences, Database)  
│   │   └── remote/         \# Remote data sources (API Service using Retrofit)  
│   ├── models/             \# Data Transfer Objects (DTOs) \- models with fromJson/toJson  
│   └── repositories/       \# Implementation of repositories from the Domain layer  
│  
├── domain/                 \# Domain Layer  
│   ├── entities/           \# Core business objects (using Freezed)  
│   ├── repositories/       \# Abstract classes (interfaces) for repositories  
│   └── usecases/           \# Business logic (use cases)  
│  
├── generated/              \# Auto-generated files (do not edit)  
│  
└── main.dart               \# Entry point of the application

### **3\. Base Classes**

#### **a. Failure Class (lib/core/error/failure.dart)**

This base class defines potential errors in the application.

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {  
  const Failure(\[List properties \= const \<dynamic\>\[\]\]);  
}

// General failures  
class ServerFailure extends Failure {  
  final String? message;  
  const ServerFailure({this.message});

  @override  
  List\<Object?\> get props \=\> \[message\];  
}

class CacheFailure extends Failure {  
  @override  
  List\<Object?\> get props \=\> \[\];  
}

#### **b. UseCase Class (lib/core/usecase/usecase.dart)**

This class standardizes use cases, using the Either type from dartz to return either a Failure or a successful Type.

import 'package:dartz/dartz.dart';  
import 'package:your\_project/core/error/failure.dart';

// For use cases with parameters  
abstract class UseCase\<Type, Params\> {  
  Future\<Either\<Failure, Type\>\> call(Params params);  
}

// For use cases without parameters  
abstract class UseCaseWithoutParams\<Type\> {  
  Future\<Either\<Failure, Type\>\> call();  
}

### **5\. Simple Feature Example (Fetching User List)**

#### **a. Domain Layer**

* **Repository Interface** (lib/domain/repositories/user\_repository.dart):  
  import 'package:dartz/dartz.dart';  
  import 'package:your\_project/core/error/failure.dart';  
  import 'package:your\_project/domain/entities/user.dart';

  abstract class UserRepository {  
    Future\<Either\<Failure, List\<User\>\>\> getUsers();  
  }

* **UseCase** (lib/domain/usecases/get\_users\_usecase.dart):  
  import 'package:dartz/dartz.dart';  
  import 'package:your\_project/core/error/failure.dart';  
  import 'package:your\_project/core/usecase/usecase.dart';  
  import 'package:your\_project/domain/entities/user.dart';  
  import 'package:your\_project/domain/repositories/user\_repository.dart';

  class GetUsersUseCase extends UseCaseWithoutParams\<List\<User\>\> {  
    final UserRepository \_repository;  
    GetUsersUseCase(this.\_repository);

    @override  
    Future\<Either\<Failure, List\<User\>\>\> call() async {  
      return await \_repository.getUsers();  
    }  
  }

#### **b. Data Layer**

* **Repository Implementation** (lib/data/repositories/user\_repository\_impl.dart):  
  import 'package:dio/dio.dart';  
  import 'package:dartz/dartz.dart';  
  import 'package:your\_project/core/error/failure.dart';  
  import 'package:your\_project/data/datasources/remote/api\_service.dart';  
  import 'package:your\_project/domain/entities/user.dart';  
  import 'package:your\_project/domain/repositories/user\_repository.dart';

  class UserRepositoryImpl implements UserRepository {  
    final ApiService \_apiService;  
    UserRepositoryImpl(this.\_apiService);

    @override  
    Future\<Either\<Failure, List\<User\>\>\> getUsers() async {  
      try {  
        final userModels \= await \_apiService.getUsers();  
        return Right(userModels);   
      } on DioException catch (e) {  
        return Left(ServerFailure(message: e.message));  
      }  
    }  
  }

#### **c. Presentation Layer**

* **UserCubit** (lib/app/bloc/user\_cubit.dart):  
  import 'package:flutter\_bloc/flutter\_bloc.dart';  
  import 'package:your\_project/domain/entities/user.dart';  
  import 'package:your\_project/domain/usecases/get\_users\_usecase.dart';

  // Define states  
  abstract class UserState {}  
  class UserInitial extends UserState {}  
  class UserLoading extends UserState {}  
  class UserLoaded extends UserState {  
    final List\<User\> users;  
    UserLoaded(this.users);  
  }  
  class UserError extends UserState {  
    final String message;  
    UserError(this.message);  
  }

  class UserCubit extends Cubit\<UserState\> {  
    final GetUsersUseCase \_getUsersUseCase;

    UserCubit(this.\_getUsersUseCase) : super(UserInitial());

    Future\<void\> fetchUsers() async {  
      emit(UserLoading());  
      final result \= await \_getUsersUseCase();

      result.fold(  
        (failure) {  
          if (failure is ServerFailure) {  
            emit(UserError(failure.message ?? 'Server Error'));  
          } else {  
            emit(UserError('An unexpected error occurred'));  
          }  
        },  
        (users) {  
          emit(UserLoaded(users));  
        },  
      );  
    }  
  }
