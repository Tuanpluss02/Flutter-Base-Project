part of 'language_cubit.dart';

class LanguageState extends Equatable {
  final bool isLoading;
  final AppLocale? currentLocale;
  final List<AppLocale> supportedLocales;
  final String? error;

  const LanguageState({
    this.isLoading = false,
    this.currentLocale,
    this.supportedLocales = const [],
    this.error,
  });

  LanguageState copyWith({
    bool? isLoading,
    AppLocale? currentLocale,
    List<AppLocale>? supportedLocales,
    String? error,
  }) {
    return LanguageState(
      isLoading: isLoading ?? this.isLoading,
      currentLocale: currentLocale ?? this.currentLocale,
      supportedLocales: supportedLocales ?? this.supportedLocales,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoading, currentLocale, supportedLocales, error];
}