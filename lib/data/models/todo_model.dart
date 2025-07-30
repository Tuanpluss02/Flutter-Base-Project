import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:base/domain/entities/todo.dart';

part '../../generated/data/models/todo_model.g.dart';

@JsonSerializable()
class TodoModel {
  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  factory TodoModel.fromEntity(Todo todo) {
    return TodoModel(
      userId: todo.userId,
      id: todo.id,
      title: todo.title,
      completed: todo.completed,
    );
  }
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);

  Todo toEntity() {
    return Todo(userId: userId, id: id, title: title, completed: completed);
  }
}
