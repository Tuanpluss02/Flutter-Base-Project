import 'package:base/generated/translations/translations.g.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class LanguageService {
  LanguageService(this._prefs);
  static const String _languageKey = 'selected_language';

  final SharedPreferences _prefs;

  /// Get current locale
  AppLocale get currentLocale => LocaleSettings.currentLocale;

  /// Get all supported locales
  List<AppLocale> get supportedLocales => AppLocale.values;

  /// Initialize language settings
  Future<void> initialize() async {
    final savedLanguage = _prefs.getString(_languageKey);
    if (savedLanguage != null) {
      final locale = AppLocale.values.firstWhere(
        (locale) => locale.languageCode == savedLanguage,
        orElse: () => AppLocale.en,
      );
      await setLocale(locale);
    } else {
      // Set default locale
      await setLocale(AppLocale.en);
    }
  }

  /// Change language
  Future<void> setLocale(AppLocale locale) async {
    LocaleSettings.setLocale(locale);
    await _prefs.setString(_languageKey, locale.languageCode);
  }

  /// Get language display name
  String getLanguageDisplayName(AppLocale locale) {
    switch (locale) {
      case AppLocale.en:
        return tr.language.english;
      case AppLocale.vi:
        return tr.language.vietnamese;
    }
  }

  /// Get current language display name
  String get currentLanguageDisplayName =>
      getLanguageDisplayName(currentLocale);
}
