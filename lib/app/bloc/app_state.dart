part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState({
    this.isLoading = false,
    this.currentLocale,
    this.supportedLocales = const [],
    this.themeMode = ThemeMode.system,
    this.connectivityStatus = ConnectivityStatus.disconnected,
    this.error,
  });

  final bool isLoading;
  final AppLocale? currentLocale;
  final List<AppLocale> supportedLocales;
  final ThemeMode themeMode;
  final ConnectivityStatus connectivityStatus;
  final String? error;

  AppState copyWith({
    bool? isLoading,
    AppLocale? currentLocale,
    List<AppLocale>? supportedLocales,
    ThemeMode? themeMode,
    ConnectivityStatus? connectivityStatus,
    String? error,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      currentLocale: currentLocale ?? this.currentLocale,
      supportedLocales: supportedLocales ?? this.supportedLocales,
      themeMode: themeMode ?? this.themeMode,
      connectivityStatus: connectivityStatus ?? this.connectivityStatus,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    currentLocale,
    supportedLocales,
    themeMode,
    connectivityStatus,
    error,
  ];
}
