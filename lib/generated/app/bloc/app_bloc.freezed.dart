// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../app/bloc/app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppEvent()';
}


}

/// @nodoc
class $AppEventCopyWith<$Res>  {
$AppEventCopyWith(AppEvent _, $Res Function(AppEvent) __);
}


/// Adds pattern-matching-related methods to [AppEvent].
extension AppEventPatterns on AppEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AppInitializeEvent value)?  initialize,TResult Function( AppChangeLanguageEvent value)?  changeLanguage,TResult Function( AppChangeThemeEvent value)?  changeTheme,TResult Function( AppConnectivityChangedEvent value)?  connectivityChanged,TResult Function( AppCheckConnectivityEvent value)?  checkConnectivity,TResult Function( AppLifecycleChangedEvent value)?  lifecycleChanged,TResult Function( AppClearErrorEvent value)?  clearError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AppInitializeEvent() when initialize != null:
return initialize(_that);case AppChangeLanguageEvent() when changeLanguage != null:
return changeLanguage(_that);case AppChangeThemeEvent() when changeTheme != null:
return changeTheme(_that);case AppConnectivityChangedEvent() when connectivityChanged != null:
return connectivityChanged(_that);case AppCheckConnectivityEvent() when checkConnectivity != null:
return checkConnectivity(_that);case AppLifecycleChangedEvent() when lifecycleChanged != null:
return lifecycleChanged(_that);case AppClearErrorEvent() when clearError != null:
return clearError(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AppInitializeEvent value)  initialize,required TResult Function( AppChangeLanguageEvent value)  changeLanguage,required TResult Function( AppChangeThemeEvent value)  changeTheme,required TResult Function( AppConnectivityChangedEvent value)  connectivityChanged,required TResult Function( AppCheckConnectivityEvent value)  checkConnectivity,required TResult Function( AppLifecycleChangedEvent value)  lifecycleChanged,required TResult Function( AppClearErrorEvent value)  clearError,}){
final _that = this;
switch (_that) {
case AppInitializeEvent():
return initialize(_that);case AppChangeLanguageEvent():
return changeLanguage(_that);case AppChangeThemeEvent():
return changeTheme(_that);case AppConnectivityChangedEvent():
return connectivityChanged(_that);case AppCheckConnectivityEvent():
return checkConnectivity(_that);case AppLifecycleChangedEvent():
return lifecycleChanged(_that);case AppClearErrorEvent():
return clearError(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AppInitializeEvent value)?  initialize,TResult? Function( AppChangeLanguageEvent value)?  changeLanguage,TResult? Function( AppChangeThemeEvent value)?  changeTheme,TResult? Function( AppConnectivityChangedEvent value)?  connectivityChanged,TResult? Function( AppCheckConnectivityEvent value)?  checkConnectivity,TResult? Function( AppLifecycleChangedEvent value)?  lifecycleChanged,TResult? Function( AppClearErrorEvent value)?  clearError,}){
final _that = this;
switch (_that) {
case AppInitializeEvent() when initialize != null:
return initialize(_that);case AppChangeLanguageEvent() when changeLanguage != null:
return changeLanguage(_that);case AppChangeThemeEvent() when changeTheme != null:
return changeTheme(_that);case AppConnectivityChangedEvent() when connectivityChanged != null:
return connectivityChanged(_that);case AppCheckConnectivityEvent() when checkConnectivity != null:
return checkConnectivity(_that);case AppLifecycleChangedEvent() when lifecycleChanged != null:
return lifecycleChanged(_that);case AppClearErrorEvent() when clearError != null:
return clearError(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initialize,TResult Function( AppLocale locale)?  changeLanguage,TResult Function( ThemeMode themeMode)?  changeTheme,TResult Function( ConnectivityStatus connectivityStatus)?  connectivityChanged,TResult Function()?  checkConnectivity,TResult Function( AppLifecycleState state)?  lifecycleChanged,TResult Function()?  clearError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AppInitializeEvent() when initialize != null:
return initialize();case AppChangeLanguageEvent() when changeLanguage != null:
return changeLanguage(_that.locale);case AppChangeThemeEvent() when changeTheme != null:
return changeTheme(_that.themeMode);case AppConnectivityChangedEvent() when connectivityChanged != null:
return connectivityChanged(_that.connectivityStatus);case AppCheckConnectivityEvent() when checkConnectivity != null:
return checkConnectivity();case AppLifecycleChangedEvent() when lifecycleChanged != null:
return lifecycleChanged(_that.state);case AppClearErrorEvent() when clearError != null:
return clearError();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initialize,required TResult Function( AppLocale locale)  changeLanguage,required TResult Function( ThemeMode themeMode)  changeTheme,required TResult Function( ConnectivityStatus connectivityStatus)  connectivityChanged,required TResult Function()  checkConnectivity,required TResult Function( AppLifecycleState state)  lifecycleChanged,required TResult Function()  clearError,}) {final _that = this;
switch (_that) {
case AppInitializeEvent():
return initialize();case AppChangeLanguageEvent():
return changeLanguage(_that.locale);case AppChangeThemeEvent():
return changeTheme(_that.themeMode);case AppConnectivityChangedEvent():
return connectivityChanged(_that.connectivityStatus);case AppCheckConnectivityEvent():
return checkConnectivity();case AppLifecycleChangedEvent():
return lifecycleChanged(_that.state);case AppClearErrorEvent():
return clearError();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initialize,TResult? Function( AppLocale locale)?  changeLanguage,TResult? Function( ThemeMode themeMode)?  changeTheme,TResult? Function( ConnectivityStatus connectivityStatus)?  connectivityChanged,TResult? Function()?  checkConnectivity,TResult? Function( AppLifecycleState state)?  lifecycleChanged,TResult? Function()?  clearError,}) {final _that = this;
switch (_that) {
case AppInitializeEvent() when initialize != null:
return initialize();case AppChangeLanguageEvent() when changeLanguage != null:
return changeLanguage(_that.locale);case AppChangeThemeEvent() when changeTheme != null:
return changeTheme(_that.themeMode);case AppConnectivityChangedEvent() when connectivityChanged != null:
return connectivityChanged(_that.connectivityStatus);case AppCheckConnectivityEvent() when checkConnectivity != null:
return checkConnectivity();case AppLifecycleChangedEvent() when lifecycleChanged != null:
return lifecycleChanged(_that.state);case AppClearErrorEvent() when clearError != null:
return clearError();case _:
  return null;

}
}

}

/// @nodoc


class AppInitializeEvent implements AppEvent {
  const AppInitializeEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppInitializeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppEvent.initialize()';
}


}




/// @nodoc


class AppChangeLanguageEvent implements AppEvent {
  const AppChangeLanguageEvent(this.locale);
  

 final  AppLocale locale;

/// Create a copy of AppEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppChangeLanguageEventCopyWith<AppChangeLanguageEvent> get copyWith => _$AppChangeLanguageEventCopyWithImpl<AppChangeLanguageEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppChangeLanguageEvent&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,locale);

@override
String toString() {
  return 'AppEvent.changeLanguage(locale: $locale)';
}


}

/// @nodoc
abstract mixin class $AppChangeLanguageEventCopyWith<$Res> implements $AppEventCopyWith<$Res> {
  factory $AppChangeLanguageEventCopyWith(AppChangeLanguageEvent value, $Res Function(AppChangeLanguageEvent) _then) = _$AppChangeLanguageEventCopyWithImpl;
@useResult
$Res call({
 AppLocale locale
});




}
/// @nodoc
class _$AppChangeLanguageEventCopyWithImpl<$Res>
    implements $AppChangeLanguageEventCopyWith<$Res> {
  _$AppChangeLanguageEventCopyWithImpl(this._self, this._then);

  final AppChangeLanguageEvent _self;
  final $Res Function(AppChangeLanguageEvent) _then;

/// Create a copy of AppEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? locale = null,}) {
  return _then(AppChangeLanguageEvent(
null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as AppLocale,
  ));
}


}

/// @nodoc


class AppChangeThemeEvent implements AppEvent {
  const AppChangeThemeEvent(this.themeMode);
  

 final  ThemeMode themeMode;

/// Create a copy of AppEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppChangeThemeEventCopyWith<AppChangeThemeEvent> get copyWith => _$AppChangeThemeEventCopyWithImpl<AppChangeThemeEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppChangeThemeEvent&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode);

@override
String toString() {
  return 'AppEvent.changeTheme(themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class $AppChangeThemeEventCopyWith<$Res> implements $AppEventCopyWith<$Res> {
  factory $AppChangeThemeEventCopyWith(AppChangeThemeEvent value, $Res Function(AppChangeThemeEvent) _then) = _$AppChangeThemeEventCopyWithImpl;
@useResult
$Res call({
 ThemeMode themeMode
});




}
/// @nodoc
class _$AppChangeThemeEventCopyWithImpl<$Res>
    implements $AppChangeThemeEventCopyWith<$Res> {
  _$AppChangeThemeEventCopyWithImpl(this._self, this._then);

  final AppChangeThemeEvent _self;
  final $Res Function(AppChangeThemeEvent) _then;

/// Create a copy of AppEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? themeMode = null,}) {
  return _then(AppChangeThemeEvent(
null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}


}

/// @nodoc


class AppConnectivityChangedEvent implements AppEvent {
  const AppConnectivityChangedEvent(this.connectivityStatus);
  

 final  ConnectivityStatus connectivityStatus;

/// Create a copy of AppEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppConnectivityChangedEventCopyWith<AppConnectivityChangedEvent> get copyWith => _$AppConnectivityChangedEventCopyWithImpl<AppConnectivityChangedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConnectivityChangedEvent&&(identical(other.connectivityStatus, connectivityStatus) || other.connectivityStatus == connectivityStatus));
}


@override
int get hashCode => Object.hash(runtimeType,connectivityStatus);

@override
String toString() {
  return 'AppEvent.connectivityChanged(connectivityStatus: $connectivityStatus)';
}


}

/// @nodoc
abstract mixin class $AppConnectivityChangedEventCopyWith<$Res> implements $AppEventCopyWith<$Res> {
  factory $AppConnectivityChangedEventCopyWith(AppConnectivityChangedEvent value, $Res Function(AppConnectivityChangedEvent) _then) = _$AppConnectivityChangedEventCopyWithImpl;
@useResult
$Res call({
 ConnectivityStatus connectivityStatus
});




}
/// @nodoc
class _$AppConnectivityChangedEventCopyWithImpl<$Res>
    implements $AppConnectivityChangedEventCopyWith<$Res> {
  _$AppConnectivityChangedEventCopyWithImpl(this._self, this._then);

  final AppConnectivityChangedEvent _self;
  final $Res Function(AppConnectivityChangedEvent) _then;

/// Create a copy of AppEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? connectivityStatus = null,}) {
  return _then(AppConnectivityChangedEvent(
null == connectivityStatus ? _self.connectivityStatus : connectivityStatus // ignore: cast_nullable_to_non_nullable
as ConnectivityStatus,
  ));
}


}

/// @nodoc


class AppCheckConnectivityEvent implements AppEvent {
  const AppCheckConnectivityEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppCheckConnectivityEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppEvent.checkConnectivity()';
}


}




/// @nodoc


class AppLifecycleChangedEvent implements AppEvent {
  const AppLifecycleChangedEvent(this.state);
  

 final  AppLifecycleState state;

/// Create a copy of AppEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppLifecycleChangedEventCopyWith<AppLifecycleChangedEvent> get copyWith => _$AppLifecycleChangedEventCopyWithImpl<AppLifecycleChangedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppLifecycleChangedEvent&&(identical(other.state, state) || other.state == state));
}


@override
int get hashCode => Object.hash(runtimeType,state);

@override
String toString() {
  return 'AppEvent.lifecycleChanged(state: $state)';
}


}

/// @nodoc
abstract mixin class $AppLifecycleChangedEventCopyWith<$Res> implements $AppEventCopyWith<$Res> {
  factory $AppLifecycleChangedEventCopyWith(AppLifecycleChangedEvent value, $Res Function(AppLifecycleChangedEvent) _then) = _$AppLifecycleChangedEventCopyWithImpl;
@useResult
$Res call({
 AppLifecycleState state
});




}
/// @nodoc
class _$AppLifecycleChangedEventCopyWithImpl<$Res>
    implements $AppLifecycleChangedEventCopyWith<$Res> {
  _$AppLifecycleChangedEventCopyWithImpl(this._self, this._then);

  final AppLifecycleChangedEvent _self;
  final $Res Function(AppLifecycleChangedEvent) _then;

/// Create a copy of AppEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? state = null,}) {
  return _then(AppLifecycleChangedEvent(
null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as AppLifecycleState,
  ));
}


}

/// @nodoc


class AppClearErrorEvent implements AppEvent {
  const AppClearErrorEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppClearErrorEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppEvent.clearError()';
}


}




/// @nodoc
mixin _$AppState {

 bool get isLoading; AppLocale? get currentLocale; List<AppLocale> get supportedLocales; ThemeMode get themeMode; ConnectivityStatus get connectivityStatus; String? get error;
/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppStateCopyWith<AppState> get copyWith => _$AppStateCopyWithImpl<AppState>(this as AppState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.currentLocale, currentLocale) || other.currentLocale == currentLocale)&&const DeepCollectionEquality().equals(other.supportedLocales, supportedLocales)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.connectivityStatus, connectivityStatus) || other.connectivityStatus == connectivityStatus)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,currentLocale,const DeepCollectionEquality().hash(supportedLocales),themeMode,connectivityStatus,error);

@override
String toString() {
  return 'AppState(isLoading: $isLoading, currentLocale: $currentLocale, supportedLocales: $supportedLocales, themeMode: $themeMode, connectivityStatus: $connectivityStatus, error: $error)';
}


}

/// @nodoc
abstract mixin class $AppStateCopyWith<$Res>  {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) _then) = _$AppStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, AppLocale? currentLocale, List<AppLocale> supportedLocales, ThemeMode themeMode, ConnectivityStatus connectivityStatus, String? error
});




}
/// @nodoc
class _$AppStateCopyWithImpl<$Res>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._self, this._then);

  final AppState _self;
  final $Res Function(AppState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? currentLocale = freezed,Object? supportedLocales = null,Object? themeMode = null,Object? connectivityStatus = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,currentLocale: freezed == currentLocale ? _self.currentLocale : currentLocale // ignore: cast_nullable_to_non_nullable
as AppLocale?,supportedLocales: null == supportedLocales ? _self.supportedLocales : supportedLocales // ignore: cast_nullable_to_non_nullable
as List<AppLocale>,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,connectivityStatus: null == connectivityStatus ? _self.connectivityStatus : connectivityStatus // ignore: cast_nullable_to_non_nullable
as ConnectivityStatus,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppState].
extension AppStatePatterns on AppState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppState value)  $default,){
final _that = this;
switch (_that) {
case _AppState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppState value)?  $default,){
final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  AppLocale? currentLocale,  List<AppLocale> supportedLocales,  ThemeMode themeMode,  ConnectivityStatus connectivityStatus,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that.isLoading,_that.currentLocale,_that.supportedLocales,_that.themeMode,_that.connectivityStatus,_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  AppLocale? currentLocale,  List<AppLocale> supportedLocales,  ThemeMode themeMode,  ConnectivityStatus connectivityStatus,  String? error)  $default,) {final _that = this;
switch (_that) {
case _AppState():
return $default(_that.isLoading,_that.currentLocale,_that.supportedLocales,_that.themeMode,_that.connectivityStatus,_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  AppLocale? currentLocale,  List<AppLocale> supportedLocales,  ThemeMode themeMode,  ConnectivityStatus connectivityStatus,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that.isLoading,_that.currentLocale,_that.supportedLocales,_that.themeMode,_that.connectivityStatus,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _AppState implements AppState {
  const _AppState({this.isLoading = false, this.currentLocale, final  List<AppLocale> supportedLocales = const [], this.themeMode = ThemeMode.system, this.connectivityStatus = ConnectivityStatus.disconnected, this.error}): _supportedLocales = supportedLocales;
  

@override@JsonKey() final  bool isLoading;
@override final  AppLocale? currentLocale;
 final  List<AppLocale> _supportedLocales;
@override@JsonKey() List<AppLocale> get supportedLocales {
  if (_supportedLocales is EqualUnmodifiableListView) return _supportedLocales;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_supportedLocales);
}

@override@JsonKey() final  ThemeMode themeMode;
@override@JsonKey() final  ConnectivityStatus connectivityStatus;
@override final  String? error;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppStateCopyWith<_AppState> get copyWith => __$AppStateCopyWithImpl<_AppState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.currentLocale, currentLocale) || other.currentLocale == currentLocale)&&const DeepCollectionEquality().equals(other._supportedLocales, _supportedLocales)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.connectivityStatus, connectivityStatus) || other.connectivityStatus == connectivityStatus)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,currentLocale,const DeepCollectionEquality().hash(_supportedLocales),themeMode,connectivityStatus,error);

@override
String toString() {
  return 'AppState(isLoading: $isLoading, currentLocale: $currentLocale, supportedLocales: $supportedLocales, themeMode: $themeMode, connectivityStatus: $connectivityStatus, error: $error)';
}


}

/// @nodoc
abstract mixin class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) _then) = __$AppStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, AppLocale? currentLocale, List<AppLocale> supportedLocales, ThemeMode themeMode, ConnectivityStatus connectivityStatus, String? error
});




}
/// @nodoc
class __$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(this._self, this._then);

  final _AppState _self;
  final $Res Function(_AppState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? currentLocale = freezed,Object? supportedLocales = null,Object? themeMode = null,Object? connectivityStatus = null,Object? error = freezed,}) {
  return _then(_AppState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,currentLocale: freezed == currentLocale ? _self.currentLocale : currentLocale // ignore: cast_nullable_to_non_nullable
as AppLocale?,supportedLocales: null == supportedLocales ? _self._supportedLocales : supportedLocales // ignore: cast_nullable_to_non_nullable
as List<AppLocale>,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,connectivityStatus: null == connectivityStatus ? _self.connectivityStatus : connectivityStatus // ignore: cast_nullable_to_non_nullable
as ConnectivityStatus,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
