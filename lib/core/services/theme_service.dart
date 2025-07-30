import 'package:base/generated/translations/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class ThemeService {
  ThemeService(this._prefs);
  static const String _themeModeKey = 'selected_theme_mode';

  final SharedPreferences _prefs;

  ThemeMode _currentThemeMode = ThemeMode.system;

  /// Get current theme mode
  ThemeMode get currentThemeMode => _currentThemeMode;

  /// Get all supported theme modes
  List<ThemeMode> get supportedThemeModes => ThemeMode.values;

  /// Initialize theme settings
  Future<void> initialize() async {
    final savedThemeMode = _prefs.getString(_themeModeKey);
    if (savedThemeMode != null) {
      final themeMode = ThemeMode.values.firstWhere(
        (mode) => mode.name == savedThemeMode,
        orElse: () => ThemeMode.system,
      );
      await setThemeMode(themeMode);
    } else {
      // Set default theme mode
      await setThemeMode(ThemeMode.system);
    }
  }

  /// Change theme mode
  Future<void> setThemeMode(ThemeMode themeMode) async {
    _currentThemeMode = themeMode;
    await _prefs.setString(_themeModeKey, themeMode.name);
  }

  /// Get theme mode display name
  String getThemeModeDisplayName(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return tr.theme.light;
      case ThemeMode.dark:
        return tr.theme.dark;
      case ThemeMode.system:
        return tr.theme.system;
    }
  }

  /// Get current theme mode display name
  String get currentThemeModeDisplayName =>
      getThemeModeDisplayName(currentThemeMode);

  /// Check if current theme is dark
  bool get isDarkMode => _currentThemeMode == ThemeMode.dark;

  /// Check if current theme is light
  bool get isLightMode => _currentThemeMode == ThemeMode.light;

  /// Check if current theme follows system
  bool get isSystemMode => _currentThemeMode == ThemeMode.system;
}
