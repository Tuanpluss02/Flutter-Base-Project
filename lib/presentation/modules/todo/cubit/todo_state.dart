import 'package:base/domain/entities/todo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/presentation/modules/todo/cubit/todo_state.freezed.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState.initial() = TodoInitial;

  const factory TodoState.loading() = TodoLoading;

  const factory TodoState.loaded({required List<Todo> todos}) = TodoLoaded;

  const factory TodoState.error({required String message}) = TodoError;

  const factory TodoState.updating({
    required List<Todo> todos,
    required int updatingTodoId,
  }) = TodoUpdating;
}
