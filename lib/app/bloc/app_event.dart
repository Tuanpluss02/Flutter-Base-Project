part of 'app_bloc.dart';

/// Base class for all app events
abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

/// Event to initialize the app
class AppInitializeEvent extends AppEvent {
  const AppInitializeEvent();
}

/// Event to change language
class AppChangeLanguageEvent extends AppEvent {
  const AppChangeLanguageEvent(this.locale);

  final AppLocale locale;

  @override
  List<Object?> get props => [locale];
}

/// Event to change theme
class AppChangeThemeEvent extends AppEvent {
  const AppChangeThemeEvent(this.themeMode);

  final ThemeMode themeMode;

  @override
  List<Object?> get props => [themeMode];
}

/// Event when connectivity status changes
class AppConnectivityChangedEvent extends AppEvent {
  const AppConnectivityChangedEvent(this.connectivityStatus);

  final ConnectivityStatus connectivityStatus;

  @override
  List<Object?> get props => [connectivityStatus];
}

/// Event to manually check connectivity
class AppCheckConnectivityEvent extends AppEvent {
  const AppCheckConnectivityEvent();
}

/// Event to handle app lifecycle changes
class AppLifecycleChangedEvent extends AppEvent {
  const AppLifecycleChangedEvent(this.state);

  final AppLifecycleState state;

  @override
  List<Object?> get props => [state];
}

/// Event to clear error state
class AppClearErrorEvent extends AppEvent {
  const AppClearErrorEvent();
}
