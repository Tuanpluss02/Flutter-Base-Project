import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/domain/entities/user.freezed.dart';
part '../../generated/domain/entities/user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String email,
    String? phone,
    String? website,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
