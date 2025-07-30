part of 'app_bloc.dart';

/// App state using Freezed
@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    @Default(false) bool isLoading,
    AppLocale? currentLocale,
    @Default([]) List<AppLocale> supportedLocales,
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default(ConnectivityStatus.disconnected)
    ConnectivityStatus connectivityStatus,
    String? error,
  }) = _AppState;
}
