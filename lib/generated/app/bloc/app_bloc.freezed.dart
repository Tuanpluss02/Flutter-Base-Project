// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../app/bloc/app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(AppLocale locale) changeLanguage,
    required TResult Function(ThemeMode themeMode) changeTheme,
    required TResult Function(ConnectivityStatus connectivityStatus)
    connectivityChanged,
    required TResult Function() checkConnectivity,
    required TResult Function(AppLifecycleState state) lifecycleChanged,
    required TResult Function() clearError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(AppLocale locale)? changeLanguage,
    TResult? Function(ThemeMode themeMode)? changeTheme,
    TResult? Function(ConnectivityStatus connectivityStatus)?
    connectivityChanged,
    TResult? Function()? checkConnectivity,
    TResult? Function(AppLifecycleState state)? lifecycleChanged,
    TResult? Function()? clearError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(AppLocale locale)? changeLanguage,
    TResult Function(ThemeMode themeMode)? changeTheme,
    TResult Function(ConnectivityStatus connectivityStatus)?
    connectivityChanged,
    TResult Function()? checkConnectivity,
    TResult Function(AppLifecycleState state)? lifecycleChanged,
    TResult Function()? clearError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitializeEvent value) initialize,
    required TResult Function(AppChangeLanguageEvent value) changeLanguage,
    required TResult Function(AppChangeThemeEvent value) changeTheme,
    required TResult Function(AppConnectivityChangedEvent value)
    connectivityChanged,
    required TResult Function(AppCheckConnectivityEvent value)
    checkConnectivity,
    required TResult Function(AppLifecycleChangedEvent value) lifecycleChanged,
    required TResult Function(AppClearErrorEvent value) clearError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppInitializeEvent value)? initialize,
    TResult? Function(AppChangeLanguageEvent value)? changeLanguage,
    TResult? Function(AppChangeThemeEvent value)? changeTheme,
    TResult? Function(AppConnectivityChangedEvent value)? connectivityChanged,
    TResult? Function(AppCheckConnectivityEvent value)? checkConnectivity,
    TResult? Function(AppLifecycleChangedEvent value)? lifecycleChanged,
    TResult? Function(AppClearErrorEvent value)? clearError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitializeEvent value)? initialize,
    TResult Function(AppChangeLanguageEvent value)? changeLanguage,
    TResult Function(AppChangeThemeEvent value)? changeTheme,
    TResult Function(AppConnectivityChangedEvent value)? connectivityChanged,
    TResult Function(AppCheckConnectivityEvent value)? checkConnectivity,
    TResult Function(AppLifecycleChangedEvent value)? lifecycleChanged,
    TResult Function(AppClearErrorEvent value)? clearError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AppInitializeEventImplCopyWith<$Res> {
  factory _$$AppInitializeEventImplCopyWith(
    _$AppInitializeEventImpl value,
    $Res Function(_$AppInitializeEventImpl) then,
  ) = __$$AppInitializeEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppInitializeEventImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppInitializeEventImpl>
    implements _$$AppInitializeEventImplCopyWith<$Res> {
  __$$AppInitializeEventImplCopyWithImpl(
    _$AppInitializeEventImpl _value,
    $Res Function(_$AppInitializeEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AppInitializeEventImpl implements AppInitializeEvent {
  const _$AppInitializeEventImpl();

  @override
  String toString() {
    return 'AppEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppInitializeEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(AppLocale locale) changeLanguage,
    required TResult Function(ThemeMode themeMode) changeTheme,
    required TResult Function(ConnectivityStatus connectivityStatus)
    connectivityChanged,
    required TResult Function() checkConnectivity,
    required TResult Function(AppLifecycleState state) lifecycleChanged,
    required TResult Function() clearError,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(AppLocale locale)? changeLanguage,
    TResult? Function(ThemeMode themeMode)? changeTheme,
    TResult? Function(ConnectivityStatus connectivityStatus)?
    connectivityChanged,
    TResult? Function()? checkConnectivity,
    TResult? Function(AppLifecycleState state)? lifecycleChanged,
    TResult? Function()? clearError,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(AppLocale locale)? changeLanguage,
    TResult Function(ThemeMode themeMode)? changeTheme,
    TResult Function(ConnectivityStatus connectivityStatus)?
    connectivityChanged,
    TResult Function()? checkConnectivity,
    TResult Function(AppLifecycleState state)? lifecycleChanged,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitializeEvent value) initialize,
    required TResult Function(AppChangeLanguageEvent value) changeLanguage,
    required TResult Function(AppChangeThemeEvent value) changeTheme,
    required TResult Function(AppConnectivityChangedEvent value)
    connectivityChanged,
    required TResult Function(AppCheckConnectivityEvent value)
    checkConnectivity,
    required TResult Function(AppLifecycleChangedEvent value) lifecycleChanged,
    required TResult Function(AppClearErrorEvent value) clearError,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppInitializeEvent value)? initialize,
    TResult? Function(AppChangeLanguageEvent value)? changeLanguage,
    TResult? Function(AppChangeThemeEvent value)? changeTheme,
    TResult? Function(AppConnectivityChangedEvent value)? connectivityChanged,
    TResult? Function(AppCheckConnectivityEvent value)? checkConnectivity,
    TResult? Function(AppLifecycleChangedEvent value)? lifecycleChanged,
    TResult? Function(AppClearErrorEvent value)? clearError,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitializeEvent value)? initialize,
    TResult Function(AppChangeLanguageEvent value)? changeLanguage,
    TResult Function(AppChangeThemeEvent value)? changeTheme,
    TResult Function(AppConnectivityChangedEvent value)? connectivityChanged,
    TResult Function(AppCheckConnectivityEvent value)? checkConnectivity,
    TResult Function(AppLifecycleChangedEvent value)? lifecycleChanged,
    TResult Function(AppClearErrorEvent value)? clearError,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class AppInitializeEvent implements AppEvent {
  const factory AppInitializeEvent() = _$AppInitializeEventImpl;
}

/// @nodoc
abstract class _$$AppChangeLanguageEventImplCopyWith<$Res> {
  factory _$$AppChangeLanguageEventImplCopyWith(
    _$AppChangeLanguageEventImpl value,
    $Res Function(_$AppChangeLanguageEventImpl) then,
  ) = __$$AppChangeLanguageEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppLocale locale});
}

/// @nodoc
class __$$AppChangeLanguageEventImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppChangeLanguageEventImpl>
    implements _$$AppChangeLanguageEventImplCopyWith<$Res> {
  __$$AppChangeLanguageEventImplCopyWithImpl(
    _$AppChangeLanguageEventImpl _value,
    $Res Function(_$AppChangeLanguageEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? locale = null}) {
    return _then(
      _$AppChangeLanguageEventImpl(
        null == locale
            ? _value.locale
            : locale // ignore: cast_nullable_to_non_nullable
                  as AppLocale,
      ),
    );
  }
}

/// @nodoc

class _$AppChangeLanguageEventImpl implements AppChangeLanguageEvent {
  const _$AppChangeLanguageEventImpl(this.locale);

  @override
  final AppLocale locale;

  @override
  String toString() {
    return 'AppEvent.changeLanguage(locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppChangeLanguageEventImpl &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppChangeLanguageEventImplCopyWith<_$AppChangeLanguageEventImpl>
  get copyWith =>
      __$$AppChangeLanguageEventImplCopyWithImpl<_$AppChangeLanguageEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(AppLocale locale) changeLanguage,
    required TResult Function(ThemeMode themeMode) changeTheme,
    required TResult Function(ConnectivityStatus connectivityStatus)
    connectivityChanged,
    required TResult Function() checkConnectivity,
    required TResult Function(AppLifecycleState state) lifecycleChanged,
    required TResult Function() clearError,
  }) {
    return changeLanguage(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(AppLocale locale)? changeLanguage,
    TResult? Function(ThemeMode themeMode)? changeTheme,
    TResult? Function(ConnectivityStatus connectivityStatus)?
    connectivityChanged,
    TResult? Function()? checkConnectivity,
    TResult? Function(AppLifecycleState state)? lifecycleChanged,
    TResult? Function()? clearError,
  }) {
    return changeLanguage?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(AppLocale locale)? changeLanguage,
    TResult Function(ThemeMode themeMode)? changeTheme,
    TResult Function(ConnectivityStatus connectivityStatus)?
    connectivityChanged,
    TResult Function()? checkConnectivity,
    TResult Function(AppLifecycleState state)? lifecycleChanged,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (changeLanguage != null) {
      return changeLanguage(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitializeEvent value) initialize,
    required TResult Function(AppChangeLanguageEvent value) changeLanguage,
    required TResult Function(AppChangeThemeEvent value) changeTheme,
    required TResult Function(AppConnectivityChangedEvent value)
    connectivityChanged,
    required TResult Function(AppCheckConnectivityEvent value)
    checkConnectivity,
    required TResult Function(AppLifecycleChangedEvent value) lifecycleChanged,
    required TResult Function(AppClearErrorEvent value) clearError,
  }) {
    return changeLanguage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppInitializeEvent value)? initialize,
    TResult? Function(AppChangeLanguageEvent value)? changeLanguage,
    TResult? Function(AppChangeThemeEvent value)? changeTheme,
    TResult? Function(AppConnectivityChangedEvent value)? connectivityChanged,
    TResult? Function(AppCheckConnectivityEvent value)? checkConnectivity,
    TResult? Function(AppLifecycleChangedEvent value)? lifecycleChanged,
    TResult? Function(AppClearErrorEvent value)? clearError,
  }) {
    return changeLanguage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitializeEvent value)? initialize,
    TResult Function(AppChangeLanguageEvent value)? changeLanguage,
    TResult Function(AppChangeThemeEvent value)? changeTheme,
    TResult Function(AppConnectivityChangedEvent value)? connectivityChanged,
    TResult Function(AppCheckConnectivityEvent value)? checkConnectivity,
    TResult Function(AppLifecycleChangedEvent value)? lifecycleChanged,
    TResult Function(AppClearErrorEvent value)? clearError,
    required TResult orElse(),
  }) {
    if (changeLanguage != null) {
      return changeLanguage(this);
    }
    return orElse();
  }
}

abstract class AppChangeLanguageEvent implements AppEvent {
  const factory AppChangeLanguageEvent(final AppLocale locale) =
      _$AppChangeLanguageEventImpl;

  AppLocale get locale;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppChangeLanguageEventImplCopyWith<_$AppChangeLanguageEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppChangeThemeEventImplCopyWith<$Res> {
  factory _$$AppChangeThemeEventImplCopyWith(
    _$AppChangeThemeEventImpl value,
    $Res Function(_$AppChangeThemeEventImpl) then,
  ) = __$$AppChangeThemeEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class __$$AppChangeThemeEventImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppChangeThemeEventImpl>
    implements _$$AppChangeThemeEventImplCopyWith<$Res> {
  __$$AppChangeThemeEventImplCopyWithImpl(
    _$AppChangeThemeEventImpl _value,
    $Res Function(_$AppChangeThemeEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? themeMode = null}) {
    return _then(
      _$AppChangeThemeEventImpl(
        null == themeMode
            ? _value.themeMode
            : themeMode // ignore: cast_nullable_to_non_nullable
                  as ThemeMode,
      ),
    );
  }
}

/// @nodoc

class _$AppChangeThemeEventImpl implements AppChangeThemeEvent {
  const _$AppChangeThemeEventImpl(this.themeMode);

  @override
  final ThemeMode themeMode;

  @override
  String toString() {
    return 'AppEvent.changeTheme(themeMode: $themeMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppChangeThemeEventImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppChangeThemeEventImplCopyWith<_$AppChangeThemeEventImpl> get copyWith =>
      __$$AppChangeThemeEventImplCopyWithImpl<_$AppChangeThemeEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(AppLocale locale) changeLanguage,
    required TResult Function(ThemeMode themeMode) changeTheme,
    required TResult Function(ConnectivityStatus connectivityStatus)
    connectivityChanged,
    required TResult Function() checkConnectivity,
    required TResult Function(AppLifecycleState state) lifecycleChanged,
    required TResult Function() clearError,
  }) {
    return changeTheme(themeMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(AppLocale locale)? changeLanguage,
    TResult? Function(ThemeMode themeMode)? changeTheme,
    TResult? Function(ConnectivityStatus connectivityStatus)?
    connectivityChanged,
    TResult? Function()? checkConnectivity,
    TResult? Function(AppLifecycleState state)? lifecycleChanged,
    TResult? Function()? clearError,
  }) {
    return changeTheme?.call(themeMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(AppLocale locale)? changeLanguage,
    TResult Function(ThemeMode themeMode)? changeTheme,
    TResult Function(ConnectivityStatus connectivityStatus)?
    connectivityChanged,
    TResult Function()? checkConnectivity,
    TResult Function(AppLifecycleState state)? lifecycleChanged,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (changeTheme != null) {
      return changeTheme(themeMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitializeEvent value) initialize,
    required TResult Function(AppChangeLanguageEvent value) changeLanguage,
    required TResult Function(AppChangeThemeEvent value) changeTheme,
    required TResult Function(AppConnectivityChangedEvent value)
    connectivityChanged,
    required TResult Function(AppCheckConnectivityEvent value)
    checkConnectivity,
    required TResult Function(AppLifecycleChangedEvent value) lifecycleChanged,
    required TResult Function(AppClearErrorEvent value) clearError,
  }) {
    return changeTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppInitializeEvent value)? initialize,
    TResult? Function(AppChangeLanguageEvent value)? changeLanguage,
    TResult? Function(AppChangeThemeEvent value)? changeTheme,
    TResult? Function(AppConnectivityChangedEvent value)? connectivityChanged,
    TResult? Function(AppCheckConnectivityEvent value)? checkConnectivity,
    TResult? Function(AppLifecycleChangedEvent value)? lifecycleChanged,
    TResult? Function(AppClearErrorEvent value)? clearError,
  }) {
    return changeTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitializeEvent value)? initialize,
    TResult Function(AppChangeLanguageEvent value)? changeLanguage,
    TResult Function(AppChangeThemeEvent value)? changeTheme,
    TResult Function(AppConnectivityChangedEvent value)? connectivityChanged,
    TResult Function(AppCheckConnectivityEvent value)? checkConnectivity,
    TResult Function(AppLifecycleChangedEvent value)? lifecycleChanged,
    TResult Function(AppClearErrorEvent value)? clearError,
    required TResult orElse(),
  }) {
    if (changeTheme != null) {
      return changeTheme(this);
    }
    return orElse();
  }
}

abstract class AppChangeThemeEvent implements AppEvent {
  const factory AppChangeThemeEvent(final ThemeMode themeMode) =
      _$AppChangeThemeEventImpl;

  ThemeMode get themeMode;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppChangeThemeEventImplCopyWith<_$AppChangeThemeEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppConnectivityChangedEventImplCopyWith<$Res> {
  factory _$$AppConnectivityChangedEventImplCopyWith(
    _$AppConnectivityChangedEventImpl value,
    $Res Function(_$AppConnectivityChangedEventImpl) then,
  ) = __$$AppConnectivityChangedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ConnectivityStatus connectivityStatus});
}

/// @nodoc
class __$$AppConnectivityChangedEventImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppConnectivityChangedEventImpl>
    implements _$$AppConnectivityChangedEventImplCopyWith<$Res> {
  __$$AppConnectivityChangedEventImplCopyWithImpl(
    _$AppConnectivityChangedEventImpl _value,
    $Res Function(_$AppConnectivityChangedEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? connectivityStatus = null}) {
    return _then(
      _$AppConnectivityChangedEventImpl(
        null == connectivityStatus
            ? _value.connectivityStatus
            : connectivityStatus // ignore: cast_nullable_to_non_nullable
                  as ConnectivityStatus,
      ),
    );
  }
}

/// @nodoc

class _$AppConnectivityChangedEventImpl implements AppConnectivityChangedEvent {
  const _$AppConnectivityChangedEventImpl(this.connectivityStatus);

  @override
  final ConnectivityStatus connectivityStatus;

  @override
  String toString() {
    return 'AppEvent.connectivityChanged(connectivityStatus: $connectivityStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConnectivityChangedEventImpl &&
            (identical(other.connectivityStatus, connectivityStatus) ||
                other.connectivityStatus == connectivityStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, connectivityStatus);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConnectivityChangedEventImplCopyWith<_$AppConnectivityChangedEventImpl>
  get copyWith =>
      __$$AppConnectivityChangedEventImplCopyWithImpl<
        _$AppConnectivityChangedEventImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(AppLocale locale) changeLanguage,
    required TResult Function(ThemeMode themeMode) changeTheme,
    required TResult Function(ConnectivityStatus connectivityStatus)
    connectivityChanged,
    required TResult Function() checkConnectivity,
    required TResult Function(AppLifecycleState state) lifecycleChanged,
    required TResult Function() clearError,
  }) {
    return connectivityChanged(connectivityStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(AppLocale locale)? changeLanguage,
    TResult? Function(ThemeMode themeMode)? changeTheme,
    TResult? Function(ConnectivityStatus connectivityStatus)?
    connectivityChanged,
    TResult? Function()? checkConnectivity,
    TResult? Function(AppLifecycleState state)? lifecycleChanged,
    TResult? Function()? clearError,
  }) {
    return connectivityChanged?.call(connectivityStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(AppLocale locale)? changeLanguage,
    TResult Function(ThemeMode themeMode)? changeTheme,
    TResult Function(ConnectivityStatus connectivityStatus)?
    connectivityChanged,
    TResult Function()? checkConnectivity,
    TResult Function(AppLifecycleState state)? lifecycleChanged,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (connectivityChanged != null) {
      return connectivityChanged(connectivityStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitializeEvent value) initialize,
    required TResult Function(AppChangeLanguageEvent value) changeLanguage,
    required TResult Function(AppChangeThemeEvent value) changeTheme,
    required TResult Function(AppConnectivityChangedEvent value)
    connectivityChanged,
    required TResult Function(AppCheckConnectivityEvent value)
    checkConnectivity,
    required TResult Function(AppLifecycleChangedEvent value) lifecycleChanged,
    required TResult Function(AppClearErrorEvent value) clearError,
  }) {
    return connectivityChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppInitializeEvent value)? initialize,
    TResult? Function(AppChangeLanguageEvent value)? changeLanguage,
    TResult? Function(AppChangeThemeEvent value)? changeTheme,
    TResult? Function(AppConnectivityChangedEvent value)? connectivityChanged,
    TResult? Function(AppCheckConnectivityEvent value)? checkConnectivity,
    TResult? Function(AppLifecycleChangedEvent value)? lifecycleChanged,
    TResult? Function(AppClearErrorEvent value)? clearError,
  }) {
    return connectivityChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitializeEvent value)? initialize,
    TResult Function(AppChangeLanguageEvent value)? changeLanguage,
    TResult Function(AppChangeThemeEvent value)? changeTheme,
    TResult Function(AppConnectivityChangedEvent value)? connectivityChanged,
    TResult Function(AppCheckConnectivityEvent value)? checkConnectivity,
    TResult Function(AppLifecycleChangedEvent value)? lifecycleChanged,
    TResult Function(AppClearErrorEvent value)? clearError,
    required TResult orElse(),
  }) {
    if (connectivityChanged != null) {
      return connectivityChanged(this);
    }
    return orElse();
  }
}

abstract class AppConnectivityChangedEvent implements AppEvent {
  const factory AppConnectivityChangedEvent(
    final ConnectivityStatus connectivityStatus,
  ) = _$AppConnectivityChangedEventImpl;

  ConnectivityStatus get connectivityStatus;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppConnectivityChangedEventImplCopyWith<_$AppConnectivityChangedEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppCheckConnectivityEventImplCopyWith<$Res> {
  factory _$$AppCheckConnectivityEventImplCopyWith(
    _$AppCheckConnectivityEventImpl value,
    $Res Function(_$AppCheckConnectivityEventImpl) then,
  ) = __$$AppCheckConnectivityEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppCheckConnectivityEventImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppCheckConnectivityEventImpl>
    implements _$$AppCheckConnectivityEventImplCopyWith<$Res> {
  __$$AppCheckConnectivityEventImplCopyWithImpl(
    _$AppCheckConnectivityEventImpl _value,
    $Res Function(_$AppCheckConnectivityEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AppCheckConnectivityEventImpl implements AppCheckConnectivityEvent {
  const _$AppCheckConnectivityEventImpl();

  @override
  String toString() {
    return 'AppEvent.checkConnectivity()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppCheckConnectivityEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(AppLocale locale) changeLanguage,
    required TResult Function(ThemeMode themeMode) changeTheme,
    required TResult Function(ConnectivityStatus connectivityStatus)
    connectivityChanged,
    required TResult Function() checkConnectivity,
    required TResult Function(AppLifecycleState state) lifecycleChanged,
    required TResult Function() clearError,
  }) {
    return checkConnectivity();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(AppLocale locale)? changeLanguage,
    TResult? Function(ThemeMode themeMode)? changeTheme,
    TResult? Function(ConnectivityStatus connectivityStatus)?
    connectivityChanged,
    TResult? Function()? checkConnectivity,
    TResult? Function(AppLifecycleState state)? lifecycleChanged,
    TResult? Function()? clearError,
  }) {
    return checkConnectivity?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(AppLocale locale)? changeLanguage,
    TResult Function(ThemeMode themeMode)? changeTheme,
    TResult Function(ConnectivityStatus connectivityStatus)?
    connectivityChanged,
    TResult Function()? checkConnectivity,
    TResult Function(AppLifecycleState state)? lifecycleChanged,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (checkConnectivity != null) {
      return checkConnectivity();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitializeEvent value) initialize,
    required TResult Function(AppChangeLanguageEvent value) changeLanguage,
    required TResult Function(AppChangeThemeEvent value) changeTheme,
    required TResult Function(AppConnectivityChangedEvent value)
    connectivityChanged,
    required TResult Function(AppCheckConnectivityEvent value)
    checkConnectivity,
    required TResult Function(AppLifecycleChangedEvent value) lifecycleChanged,
    required TResult Function(AppClearErrorEvent value) clearError,
  }) {
    return checkConnectivity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppInitializeEvent value)? initialize,
    TResult? Function(AppChangeLanguageEvent value)? changeLanguage,
    TResult? Function(AppChangeThemeEvent value)? changeTheme,
    TResult? Function(AppConnectivityChangedEvent value)? connectivityChanged,
    TResult? Function(AppCheckConnectivityEvent value)? checkConnectivity,
    TResult? Function(AppLifecycleChangedEvent value)? lifecycleChanged,
    TResult? Function(AppClearErrorEvent value)? clearError,
  }) {
    return checkConnectivity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitializeEvent value)? initialize,
    TResult Function(AppChangeLanguageEvent value)? changeLanguage,
    TResult Function(AppChangeThemeEvent value)? changeTheme,
    TResult Function(AppConnectivityChangedEvent value)? connectivityChanged,
    TResult Function(AppCheckConnectivityEvent value)? checkConnectivity,
    TResult Function(AppLifecycleChangedEvent value)? lifecycleChanged,
    TResult Function(AppClearErrorEvent value)? clearError,
    required TResult orElse(),
  }) {
    if (checkConnectivity != null) {
      return checkConnectivity(this);
    }
    return orElse();
  }
}

abstract class AppCheckConnectivityEvent implements AppEvent {
  const factory AppCheckConnectivityEvent() = _$AppCheckConnectivityEventImpl;
}

/// @nodoc
abstract class _$$AppLifecycleChangedEventImplCopyWith<$Res> {
  factory _$$AppLifecycleChangedEventImplCopyWith(
    _$AppLifecycleChangedEventImpl value,
    $Res Function(_$AppLifecycleChangedEventImpl) then,
  ) = __$$AppLifecycleChangedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppLifecycleState state});
}

/// @nodoc
class __$$AppLifecycleChangedEventImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppLifecycleChangedEventImpl>
    implements _$$AppLifecycleChangedEventImplCopyWith<$Res> {
  __$$AppLifecycleChangedEventImplCopyWithImpl(
    _$AppLifecycleChangedEventImpl _value,
    $Res Function(_$AppLifecycleChangedEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? state = null}) {
    return _then(
      _$AppLifecycleChangedEventImpl(
        null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as AppLifecycleState,
      ),
    );
  }
}

/// @nodoc

class _$AppLifecycleChangedEventImpl implements AppLifecycleChangedEvent {
  const _$AppLifecycleChangedEventImpl(this.state);

  @override
  final AppLifecycleState state;

  @override
  String toString() {
    return 'AppEvent.lifecycleChanged(state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppLifecycleChangedEventImpl &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppLifecycleChangedEventImplCopyWith<_$AppLifecycleChangedEventImpl>
  get copyWith =>
      __$$AppLifecycleChangedEventImplCopyWithImpl<
        _$AppLifecycleChangedEventImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(AppLocale locale) changeLanguage,
    required TResult Function(ThemeMode themeMode) changeTheme,
    required TResult Function(ConnectivityStatus connectivityStatus)
    connectivityChanged,
    required TResult Function() checkConnectivity,
    required TResult Function(AppLifecycleState state) lifecycleChanged,
    required TResult Function() clearError,
  }) {
    return lifecycleChanged(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(AppLocale locale)? changeLanguage,
    TResult? Function(ThemeMode themeMode)? changeTheme,
    TResult? Function(ConnectivityStatus connectivityStatus)?
    connectivityChanged,
    TResult? Function()? checkConnectivity,
    TResult? Function(AppLifecycleState state)? lifecycleChanged,
    TResult? Function()? clearError,
  }) {
    return lifecycleChanged?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(AppLocale locale)? changeLanguage,
    TResult Function(ThemeMode themeMode)? changeTheme,
    TResult Function(ConnectivityStatus connectivityStatus)?
    connectivityChanged,
    TResult Function()? checkConnectivity,
    TResult Function(AppLifecycleState state)? lifecycleChanged,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (lifecycleChanged != null) {
      return lifecycleChanged(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitializeEvent value) initialize,
    required TResult Function(AppChangeLanguageEvent value) changeLanguage,
    required TResult Function(AppChangeThemeEvent value) changeTheme,
    required TResult Function(AppConnectivityChangedEvent value)
    connectivityChanged,
    required TResult Function(AppCheckConnectivityEvent value)
    checkConnectivity,
    required TResult Function(AppLifecycleChangedEvent value) lifecycleChanged,
    required TResult Function(AppClearErrorEvent value) clearError,
  }) {
    return lifecycleChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppInitializeEvent value)? initialize,
    TResult? Function(AppChangeLanguageEvent value)? changeLanguage,
    TResult? Function(AppChangeThemeEvent value)? changeTheme,
    TResult? Function(AppConnectivityChangedEvent value)? connectivityChanged,
    TResult? Function(AppCheckConnectivityEvent value)? checkConnectivity,
    TResult? Function(AppLifecycleChangedEvent value)? lifecycleChanged,
    TResult? Function(AppClearErrorEvent value)? clearError,
  }) {
    return lifecycleChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitializeEvent value)? initialize,
    TResult Function(AppChangeLanguageEvent value)? changeLanguage,
    TResult Function(AppChangeThemeEvent value)? changeTheme,
    TResult Function(AppConnectivityChangedEvent value)? connectivityChanged,
    TResult Function(AppCheckConnectivityEvent value)? checkConnectivity,
    TResult Function(AppLifecycleChangedEvent value)? lifecycleChanged,
    TResult Function(AppClearErrorEvent value)? clearError,
    required TResult orElse(),
  }) {
    if (lifecycleChanged != null) {
      return lifecycleChanged(this);
    }
    return orElse();
  }
}

abstract class AppLifecycleChangedEvent implements AppEvent {
  const factory AppLifecycleChangedEvent(final AppLifecycleState state) =
      _$AppLifecycleChangedEventImpl;

  AppLifecycleState get state;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppLifecycleChangedEventImplCopyWith<_$AppLifecycleChangedEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppClearErrorEventImplCopyWith<$Res> {
  factory _$$AppClearErrorEventImplCopyWith(
    _$AppClearErrorEventImpl value,
    $Res Function(_$AppClearErrorEventImpl) then,
  ) = __$$AppClearErrorEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppClearErrorEventImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppClearErrorEventImpl>
    implements _$$AppClearErrorEventImplCopyWith<$Res> {
  __$$AppClearErrorEventImplCopyWithImpl(
    _$AppClearErrorEventImpl _value,
    $Res Function(_$AppClearErrorEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AppClearErrorEventImpl implements AppClearErrorEvent {
  const _$AppClearErrorEventImpl();

  @override
  String toString() {
    return 'AppEvent.clearError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppClearErrorEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(AppLocale locale) changeLanguage,
    required TResult Function(ThemeMode themeMode) changeTheme,
    required TResult Function(ConnectivityStatus connectivityStatus)
    connectivityChanged,
    required TResult Function() checkConnectivity,
    required TResult Function(AppLifecycleState state) lifecycleChanged,
    required TResult Function() clearError,
  }) {
    return clearError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(AppLocale locale)? changeLanguage,
    TResult? Function(ThemeMode themeMode)? changeTheme,
    TResult? Function(ConnectivityStatus connectivityStatus)?
    connectivityChanged,
    TResult? Function()? checkConnectivity,
    TResult? Function(AppLifecycleState state)? lifecycleChanged,
    TResult? Function()? clearError,
  }) {
    return clearError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(AppLocale locale)? changeLanguage,
    TResult Function(ThemeMode themeMode)? changeTheme,
    TResult Function(ConnectivityStatus connectivityStatus)?
    connectivityChanged,
    TResult Function()? checkConnectivity,
    TResult Function(AppLifecycleState state)? lifecycleChanged,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitializeEvent value) initialize,
    required TResult Function(AppChangeLanguageEvent value) changeLanguage,
    required TResult Function(AppChangeThemeEvent value) changeTheme,
    required TResult Function(AppConnectivityChangedEvent value)
    connectivityChanged,
    required TResult Function(AppCheckConnectivityEvent value)
    checkConnectivity,
    required TResult Function(AppLifecycleChangedEvent value) lifecycleChanged,
    required TResult Function(AppClearErrorEvent value) clearError,
  }) {
    return clearError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppInitializeEvent value)? initialize,
    TResult? Function(AppChangeLanguageEvent value)? changeLanguage,
    TResult? Function(AppChangeThemeEvent value)? changeTheme,
    TResult? Function(AppConnectivityChangedEvent value)? connectivityChanged,
    TResult? Function(AppCheckConnectivityEvent value)? checkConnectivity,
    TResult? Function(AppLifecycleChangedEvent value)? lifecycleChanged,
    TResult? Function(AppClearErrorEvent value)? clearError,
  }) {
    return clearError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitializeEvent value)? initialize,
    TResult Function(AppChangeLanguageEvent value)? changeLanguage,
    TResult Function(AppChangeThemeEvent value)? changeTheme,
    TResult Function(AppConnectivityChangedEvent value)? connectivityChanged,
    TResult Function(AppCheckConnectivityEvent value)? checkConnectivity,
    TResult Function(AppLifecycleChangedEvent value)? lifecycleChanged,
    TResult Function(AppClearErrorEvent value)? clearError,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError(this);
    }
    return orElse();
  }
}

abstract class AppClearErrorEvent implements AppEvent {
  const factory AppClearErrorEvent() = _$AppClearErrorEventImpl;
}

/// @nodoc
mixin _$AppState {
  bool get isLoading => throw _privateConstructorUsedError;
  AppLocale? get currentLocale => throw _privateConstructorUsedError;
  List<AppLocale> get supportedLocales => throw _privateConstructorUsedError;
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  ConnectivityStatus get connectivityStatus =>
      throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call({
    bool isLoading,
    AppLocale? currentLocale,
    List<AppLocale> supportedLocales,
    ThemeMode themeMode,
    ConnectivityStatus connectivityStatus,
    String? error,
  });
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? currentLocale = freezed,
    Object? supportedLocales = null,
    Object? themeMode = null,
    Object? connectivityStatus = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            currentLocale: freezed == currentLocale
                ? _value.currentLocale
                : currentLocale // ignore: cast_nullable_to_non_nullable
                      as AppLocale?,
            supportedLocales: null == supportedLocales
                ? _value.supportedLocales
                : supportedLocales // ignore: cast_nullable_to_non_nullable
                      as List<AppLocale>,
            themeMode: null == themeMode
                ? _value.themeMode
                : themeMode // ignore: cast_nullable_to_non_nullable
                      as ThemeMode,
            connectivityStatus: null == connectivityStatus
                ? _value.connectivityStatus
                : connectivityStatus // ignore: cast_nullable_to_non_nullable
                      as ConnectivityStatus,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
    _$AppStateImpl value,
    $Res Function(_$AppStateImpl) then,
  ) = __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    AppLocale? currentLocale,
    List<AppLocale> supportedLocales,
    ThemeMode themeMode,
    ConnectivityStatus connectivityStatus,
    String? error,
  });
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
    _$AppStateImpl _value,
    $Res Function(_$AppStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? currentLocale = freezed,
    Object? supportedLocales = null,
    Object? themeMode = null,
    Object? connectivityStatus = null,
    Object? error = freezed,
  }) {
    return _then(
      _$AppStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        currentLocale: freezed == currentLocale
            ? _value.currentLocale
            : currentLocale // ignore: cast_nullable_to_non_nullable
                  as AppLocale?,
        supportedLocales: null == supportedLocales
            ? _value._supportedLocales
            : supportedLocales // ignore: cast_nullable_to_non_nullable
                  as List<AppLocale>,
        themeMode: null == themeMode
            ? _value.themeMode
            : themeMode // ignore: cast_nullable_to_non_nullable
                  as ThemeMode,
        connectivityStatus: null == connectivityStatus
            ? _value.connectivityStatus
            : connectivityStatus // ignore: cast_nullable_to_non_nullable
                  as ConnectivityStatus,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$AppStateImpl implements _AppState {
  const _$AppStateImpl({
    this.isLoading = false,
    this.currentLocale,
    final List<AppLocale> supportedLocales = const [],
    this.themeMode = ThemeMode.system,
    this.connectivityStatus = ConnectivityStatus.disconnected,
    this.error,
  }) : _supportedLocales = supportedLocales;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final AppLocale? currentLocale;
  final List<AppLocale> _supportedLocales;
  @override
  @JsonKey()
  List<AppLocale> get supportedLocales {
    if (_supportedLocales is EqualUnmodifiableListView)
      return _supportedLocales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supportedLocales);
  }

  @override
  @JsonKey()
  final ThemeMode themeMode;
  @override
  @JsonKey()
  final ConnectivityStatus connectivityStatus;
  @override
  final String? error;

  @override
  String toString() {
    return 'AppState(isLoading: $isLoading, currentLocale: $currentLocale, supportedLocales: $supportedLocales, themeMode: $themeMode, connectivityStatus: $connectivityStatus, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.currentLocale, currentLocale) ||
                other.currentLocale == currentLocale) &&
            const DeepCollectionEquality().equals(
              other._supportedLocales,
              _supportedLocales,
            ) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.connectivityStatus, connectivityStatus) ||
                other.connectivityStatus == connectivityStatus) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    currentLocale,
    const DeepCollectionEquality().hash(_supportedLocales),
    themeMode,
    connectivityStatus,
    error,
  );

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState({
    final bool isLoading,
    final AppLocale? currentLocale,
    final List<AppLocale> supportedLocales,
    final ThemeMode themeMode,
    final ConnectivityStatus connectivityStatus,
    final String? error,
  }) = _$AppStateImpl;

  @override
  bool get isLoading;
  @override
  AppLocale? get currentLocale;
  @override
  List<AppLocale> get supportedLocales;
  @override
  ThemeMode get themeMode;
  @override
  ConnectivityStatus get connectivityStatus;
  @override
  String? get error;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
