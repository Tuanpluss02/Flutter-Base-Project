import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/core/result/result.freezed.dart';

/// A Result type that represents either a success or failure state
@freezed
abstract class Result<T> with _$Result<T> {
  /// Success state containing the value
  const factory Result.success(T value) = Success<T>;

  /// Failure state containing the error
  const factory Result.failure(Failure failure) = _Failure<T>;
}

/// Extension methods for Result to provide functional programming utilities
extension ResultExtensions<T> on Result<T> {
  /// Returns true if this is a success result
  bool get isSuccess => when(success: (_) => true, failure: (_) => false);

  /// Returns true if this is a failure result
  bool get isFailure => !isSuccess;

  /// Maps the success value to a new type
  Result<R> map<R>(R Function(T value) mapper) {
    return when(
      success: (value) => Result.success(mapper(value)),
      failure: (failure) => Result.failure(failure),
    );
  }

  /// Flat maps the success value to a new Result
  Result<R> flatMap<R>(Result<R> Function(T value) mapper) {
    return when(
      success: (value) => mapper(value),
      failure: (failure) => Result.failure(failure),
    );
  }

  /// Folds the result into a single value
  R fold<R>(
    R Function(Failure failure) onFailure,
    R Function(T value) onSuccess,
  ) {
    return when(success: onSuccess, failure: onFailure);
  }

  /// Gets the success value or throws an exception
  T get value => when(
    success: (value) => value,
    failure: (failure) =>
        throw Exception('Tried to get value from failure: $failure'),
  );

  /// Gets the success value or returns the default value
  T getOrElse(T defaultValue) =>
      when(success: (value) => value, failure: (_) => defaultValue);

  /// Gets the success value or returns the result of the function
  T getOrElseGet(T Function() defaultValueProvider) =>
      when(success: (value) => value, failure: (_) => defaultValueProvider());

  /// Gets the failure or null if success
  Failure? get failureOrNull =>
      when(success: (_) => null, failure: (failure) => failure);

  /// Gets the success value or null if failure
  T? get valueOrNull => when(success: (value) => value, failure: (_) => null);
}

/// Failure types using Freezed union types
@freezed
abstract class Failure with _$Failure {
  const factory Failure.server({String? message}) = ServerFailure;
  const factory Failure.network({String? message}) = NetworkFailure;
  const factory Failure.cache({String? message}) = CacheFailure;
  const factory Failure.validation({required String message}) =
      ValidationFailure;
  const factory Failure.unknown({String? message}) = UnknownFailure;
  const factory Failure.notFound({String? message}) = NotFoundFailure;
  const factory Failure.unauthorized({String? message}) = UnauthorizedFailure;
  const factory Failure.forbidden({String? message}) = ForbiddenFailure;
}

/// Extension for Failure to get user-friendly messages
extension FailureExtensions on Failure {
  String get userMessage => when(
    server: (message) => message ?? 'Server error occurred',
    network: (message) => message ?? 'Network connection failed',
    cache: (message) => message ?? 'Cache error occurred',
    validation: (message) => message,
    unknown: (message) => message ?? 'An unexpected error occurred',
    notFound: (message) => message ?? 'Resource not found',
    unauthorized: (message) => message ?? 'Unauthorized access',
    forbidden: (message) => message ?? 'Access forbidden',
  );
}
