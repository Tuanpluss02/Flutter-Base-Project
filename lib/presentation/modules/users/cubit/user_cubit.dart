import 'package:base/core/result/result.dart';
import 'package:base/domain/entities/user.dart';
import 'package:base/domain/usecases/get_users_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'user_state.dart';

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
        emit(UserError(failure.userMessage));
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
