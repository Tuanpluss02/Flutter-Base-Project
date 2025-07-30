import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/domain/entities/todo.freezed.dart';
part '../../generated/domain/entities/todo.g.dart';

@freezed
abstract class Todo with _$Todo {
  const factory Todo({
    required int userId,
    required int id,
    required String title,
    required bool completed,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
