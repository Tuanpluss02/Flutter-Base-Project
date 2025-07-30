part of 'app_bloc.dart';

/// App events using Freezed union types
@freezed
class AppEvent with _$AppEvent {
  /// Event to initialize the app
  const factory AppEvent.initialize() = AppInitializeEvent;

  /// Event to change language
  const factory AppEvent.changeLanguage(AppLocale locale) =
      AppChangeLanguageEvent;

  /// Event to change theme
  const factory AppEvent.changeTheme(ThemeMode themeMode) = AppChangeThemeEvent;

  /// Event when connectivity status changes
  const factory AppEvent.connectivityChanged(
    ConnectivityStatus connectivityStatus,
  ) = AppConnectivityChangedEvent;

  /// Event to manually check connectivity
  const factory AppEvent.checkConnectivity() = AppCheckConnectivityEvent;

  /// Event to handle app lifecycle changes
  const factory AppEvent.lifecycleChanged(AppLifecycleState state) =
      AppLifecycleChangedEvent;

  /// Event to clear error state
  const factory AppEvent.clearError() = AppClearErrorEvent;
}
