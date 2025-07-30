import 'package:base/core/services/language_service.dart';
import 'package:base/generated/translations/translations.g.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'language_state.dart';

@injectable
class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit(this._languageService) : super(const LanguageState());
  final LanguageService _languageService;

  Future<void> initialize() async {
    emit(state.copyWith(isLoading: true));
    try {
      await _languageService.initialize();
      emit(
        state.copyWith(
          isLoading: false,
          currentLocale: _languageService.currentLocale,
          supportedLocales: _languageService.supportedLocales,
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

  String getLanguageDisplayName(AppLocale locale) {
    return _languageService.getLanguageDisplayName(locale);
  }
}
