import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:base/data/models/user_model.dart';

@injectable
class LocalDataSource {
  LocalDataSource(this._prefs);
  final SharedPreferences _prefs;

  static const String _usersKey = 'cached_users';

  Future<List<UserModel>> getCachedUsers() async {
    try {
      final String? usersJson = _prefs.getString(_usersKey);
      if (usersJson != null) {
        final List<dynamic> usersList = json.decode(usersJson);
        return usersList.map((json) => UserModel.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<void> cacheUsers(List<UserModel> users) async {
    try {
      final String usersJson = json.encode(
        users.map((user) => user.toJson()).toList(),
      );
      await _prefs.setString(_usersKey, usersJson);
    } catch (e) {
      // Handle error silently for cache operations
    }
  }

  Future<void> clearCache() async {
    try {
      await _prefs.remove(_usersKey);
    } catch (e) {
      // Handle error silently for cache operations
    }
  }
}
