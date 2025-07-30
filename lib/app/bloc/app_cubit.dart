import 'package:base/core/services/language_service.dart';
import 'package:base/core/services/theme_service.dart';
import 'package:base/generated/translations/translations.g.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'app_state.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  AppCubit(this._languageService, this._themeService) : super(const AppState());

  final LanguageService _languageService;
  final ThemeService _themeService;

  Future<void> initialize() async {
    emit(state.copyWith(isLoading: true));
    try {
      // Initialize both services
      await _languageService.initialize();
      await _themeService.initialize();

      emit(
        state.copyWith(
          isLoading: false,
          currentLocale: _languageService.currentLocale,
          supportedLocales: _languageService.supportedLocales,
          themeMode: _themeService.currentThemeMode,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> changeLanguage(AppLocale locale) async {
    emit(state.copyWith(isLoading: true));
    try {
      await _languageService.setLocale(locale);
      emit(
        state.copyWith(isLoading: false, currentLocale: locale, error: null),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> changeTheme(ThemeMode themeMode) async {
    emit(state.copyWith(isLoading: true));
    try {
      await _themeService.setThemeMode(themeMode);
      emit(state.copyWith(isLoading: false, themeMode: themeMode, error: null));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  String getLanguageDisplayName(AppLocale locale) {
    return _languageService.getLanguageDisplayName(locale);
  }

  String getThemeModeDisplayName(ThemeMode themeMode) {
    return _themeService.getThemeModeDisplayName(themeMode);
  }
}
