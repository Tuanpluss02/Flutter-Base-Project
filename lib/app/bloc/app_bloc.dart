import 'dart:async';
import 'dart:developer';

import 'package:base/core/services/connectivity_service.dart';
import 'package:base/core/services/language_service.dart';
import 'package:base/core/services/theme_service.dart';
import 'package:base/generated/translations/translations.g.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part '../../generated/app/bloc/app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

@singleton
class AppBloc extends Bloc<AppEvent, AppState> with WidgetsBindingObserver {
  AppBloc(this._languageService, this._themeService, this._connectivityService)
    : super(const AppState()) {
    // Register event handlers
    on<AppInitializeEvent>(_onInitialize);
    on<AppChangeLanguageEvent>(_onChangeLanguage);
    on<AppChangeThemeEvent>(_onChangeTheme);
    on<AppConnectivityChangedEvent>(_onConnectivityChanged);
    on<AppCheckConnectivityEvent>(_onCheckConnectivity);
    on<AppLifecycleChangedEvent>(_onLifecycleChanged);
    on<AppClearErrorEvent>(_onClearError);

    // Initialize connectivity monitoring
    _initializeConnectivityMonitoring();

    // Register as lifecycle observer
    WidgetsBinding.instance.addObserver(this);
  }

  final LanguageService _languageService;
  final ThemeService _themeService;
  final ConnectivityService _connectivityService;

  StreamSubscription<ConnectivityStatus>? _connectivitySubscription;

  /// Initialize connectivity monitoring
  void _initializeConnectivityMonitoring() {
    _connectivitySubscription = _connectivityService.connectivityStream.listen(
      (status) {
        add(AppConnectivityChangedEvent(status));
      },
      onError: (error) {
        log('AppBloc: Connectivity stream error: $error');
      },
    );
  }

  /// Handle app initialization
  Future<void> _onInitialize(
    AppInitializeEvent event,
    Emitter<AppState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      // Initialize all services
      await Future.wait([
        _languageService.initialize(),
        _themeService.initialize(),
      ]);

      // Get initial connectivity status
      final connectivityStatus =
          await _connectivityService.currentConnectivityStatus;

      emit(
        state.copyWith(
          isLoading: false,
          currentLocale: _languageService.currentLocale,
          supportedLocales: _languageService.supportedLocales,
          themeMode: _themeService.currentThemeMode,
          connectivityStatus: connectivityStatus,
          error: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  /// Handle language change
  Future<void> _onChangeLanguage(
    AppChangeLanguageEvent event,
    Emitter<AppState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      await _languageService.setLocale(event.locale);
      emit(
        state.copyWith(
          isLoading: false,
          currentLocale: event.locale,
          error: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  /// Handle theme change
  Future<void> _onChangeTheme(
    AppChangeThemeEvent event,
    Emitter<AppState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      await _themeService.setThemeMode(event.themeMode);
      emit(
        state.copyWith(
          isLoading: false,
          themeMode: event.themeMode,
          error: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  /// Handle connectivity status change
  void _onConnectivityChanged(
    AppConnectivityChangedEvent event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(connectivityStatus: event.connectivityStatus));

    // Log connectivity changes in debug mode
    if (event.connectivityStatus.isConnected) {
      log('AppBloc: Connected via ${event.connectivityStatus.displayName}');
    } else {
      log('AppBloc: Disconnected from internet');
    }
  }

  /// Handle manual connectivity check
  Future<void> _onCheckConnectivity(
    AppCheckConnectivityEvent event,
    Emitter<AppState> emit,
  ) async {
    try {
      final connectivityStatus =
          await _connectivityService.currentConnectivityStatus;
      emit(state.copyWith(connectivityStatus: connectivityStatus));
    } catch (e) {
      log('AppBloc: Error checking connectivity: $e');
    }
  }

  /// Handle app lifecycle changes
  void _onLifecycleChanged(
    AppLifecycleChangedEvent event,
    Emitter<AppState> emit,
  ) {
    switch (event.state) {
      case AppLifecycleState.resumed:
        // Check connectivity when app resumes
        add(const AppCheckConnectivityEvent());
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        // Handle other lifecycle states if needed
        break;
    }
  }

  /// Handle clear error
  void _onClearError(AppClearErrorEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(error: null));
  }

  /// Lifecycle observer method
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    add(AppLifecycleChangedEvent(state));
  }

  /// Get language display name
  String getLanguageDisplayName(AppLocale locale) {
    return _languageService.getLanguageDisplayName(locale);
  }

  /// Get theme mode display name
  String getThemeModeDisplayName(ThemeMode themeMode) {
    return _themeService.getThemeModeDisplayName(themeMode);
  }

  /// Check if device has internet connection
  bool get hasInternetConnection => state.connectivityStatus.isConnected;

  /// Get connectivity status display name
  String get connectivityDisplayName => state.connectivityStatus.displayName;

  @override
  Future<void> close() {
    // Cancel connectivity subscription
    _connectivitySubscription?.cancel();

    // Remove lifecycle observer
    WidgetsBinding.instance.removeObserver(this);

    // Dispose connectivity service
    _connectivityService.dispose();

    return super.close();
  }
}
