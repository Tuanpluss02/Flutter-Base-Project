import 'package:base/core/error/failure.dart';
import 'package:base/domain/entities/user.dart';
import 'package:base/domain/usecases/get_users_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

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

// Cubit
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
