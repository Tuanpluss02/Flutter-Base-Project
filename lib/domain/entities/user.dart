import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? website;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.website,
  });

  @override
  List<Object?> get props => [id, name, email, phone, website];

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? website,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      website: website ?? this.website,
    );
  }
}