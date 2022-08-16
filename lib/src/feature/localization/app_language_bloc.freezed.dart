// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_language_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppLanguageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale locale) usingLocale,
    required TResult Function(String message) failure,
    required TResult Function() successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Locale locale)? usingLocale,
    TResult Function(String message)? failure,
    TResult Function()? successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale locale)? usingLocale,
    TResult Function(String message)? failure,
    TResult Function()? successful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialAppLanguageState value) usingLocale,
    required TResult Function(_FailureAppLanguageState value) failure,
    required TResult Function(_SuccessfulAppLanguageState value) successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialAppLanguageState value)? usingLocale,
    TResult Function(_FailureAppLanguageState value)? failure,
    TResult Function(_SuccessfulAppLanguageState value)? successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialAppLanguageState value)? usingLocale,
    TResult Function(_FailureAppLanguageState value)? failure,
    TResult Function(_SuccessfulAppLanguageState value)? successful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLanguageStateCopyWith<$Res> {
  factory $AppLanguageStateCopyWith(
          AppLanguageState value, $Res Function(AppLanguageState) then) =
      _$AppLanguageStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppLanguageStateCopyWithImpl<$Res>
    implements $AppLanguageStateCopyWith<$Res> {
  _$AppLanguageStateCopyWithImpl(this._value, this._then);

  final AppLanguageState _value;
  // ignore: unused_field
  final $Res Function(AppLanguageState) _then;
}

/// @nodoc
abstract class _$$_InitialAppLanguageStateCopyWith<$Res> {
  factory _$$_InitialAppLanguageStateCopyWith(_$_InitialAppLanguageState value,
          $Res Function(_$_InitialAppLanguageState) then) =
      __$$_InitialAppLanguageStateCopyWithImpl<$Res>;
  $Res call({Locale locale});
}

/// @nodoc
class __$$_InitialAppLanguageStateCopyWithImpl<$Res>
    extends _$AppLanguageStateCopyWithImpl<$Res>
    implements _$$_InitialAppLanguageStateCopyWith<$Res> {
  __$$_InitialAppLanguageStateCopyWithImpl(_$_InitialAppLanguageState _value,
      $Res Function(_$_InitialAppLanguageState) _then)
      : super(_value, (v) => _then(v as _$_InitialAppLanguageState));

  @override
  _$_InitialAppLanguageState get _value =>
      super._value as _$_InitialAppLanguageState;

  @override
  $Res call({
    Object? locale = freezed,
  }) {
    return _then(_$_InitialAppLanguageState(
      locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$_InitialAppLanguageState extends _InitialAppLanguageState {
  const _$_InitialAppLanguageState(this.locale) : super._();

  @override
  final Locale locale;

  @override
  String toString() {
    return 'AppLanguageState.usingLocale(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitialAppLanguageState &&
            const DeepCollectionEquality().equals(other.locale, locale));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(locale));

  @JsonKey(ignore: true)
  @override
  _$$_InitialAppLanguageStateCopyWith<_$_InitialAppLanguageState>
      get copyWith =>
          __$$_InitialAppLanguageStateCopyWithImpl<_$_InitialAppLanguageState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale locale) usingLocale,
    required TResult Function(String message) failure,
    required TResult Function() successful,
  }) {
    return usingLocale(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Locale locale)? usingLocale,
    TResult Function(String message)? failure,
    TResult Function()? successful,
  }) {
    return usingLocale?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale locale)? usingLocale,
    TResult Function(String message)? failure,
    TResult Function()? successful,
    required TResult orElse(),
  }) {
    if (usingLocale != null) {
      return usingLocale(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialAppLanguageState value) usingLocale,
    required TResult Function(_FailureAppLanguageState value) failure,
    required TResult Function(_SuccessfulAppLanguageState value) successful,
  }) {
    return usingLocale(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialAppLanguageState value)? usingLocale,
    TResult Function(_FailureAppLanguageState value)? failure,
    TResult Function(_SuccessfulAppLanguageState value)? successful,
  }) {
    return usingLocale?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialAppLanguageState value)? usingLocale,
    TResult Function(_FailureAppLanguageState value)? failure,
    TResult Function(_SuccessfulAppLanguageState value)? successful,
    required TResult orElse(),
  }) {
    if (usingLocale != null) {
      return usingLocale(this);
    }
    return orElse();
  }
}

abstract class _InitialAppLanguageState extends AppLanguageState {
  const factory _InitialAppLanguageState(final Locale locale) =
      _$_InitialAppLanguageState;
  const _InitialAppLanguageState._() : super._();

  Locale get locale;
  @JsonKey(ignore: true)
  _$$_InitialAppLanguageStateCopyWith<_$_InitialAppLanguageState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FailureAppLanguageStateCopyWith<$Res> {
  factory _$$_FailureAppLanguageStateCopyWith(_$_FailureAppLanguageState value,
          $Res Function(_$_FailureAppLanguageState) then) =
      __$$_FailureAppLanguageStateCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$_FailureAppLanguageStateCopyWithImpl<$Res>
    extends _$AppLanguageStateCopyWithImpl<$Res>
    implements _$$_FailureAppLanguageStateCopyWith<$Res> {
  __$$_FailureAppLanguageStateCopyWithImpl(_$_FailureAppLanguageState _value,
      $Res Function(_$_FailureAppLanguageState) _then)
      : super(_value, (v) => _then(v as _$_FailureAppLanguageState));

  @override
  _$_FailureAppLanguageState get _value =>
      super._value as _$_FailureAppLanguageState;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_FailureAppLanguageState(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FailureAppLanguageState extends _FailureAppLanguageState {
  const _$_FailureAppLanguageState(
      {this.message = 'An error while changed language has occurred'})
      : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppLanguageState.failure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FailureAppLanguageState &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_FailureAppLanguageStateCopyWith<_$_FailureAppLanguageState>
      get copyWith =>
          __$$_FailureAppLanguageStateCopyWithImpl<_$_FailureAppLanguageState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale locale) usingLocale,
    required TResult Function(String message) failure,
    required TResult Function() successful,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Locale locale)? usingLocale,
    TResult Function(String message)? failure,
    TResult Function()? successful,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale locale)? usingLocale,
    TResult Function(String message)? failure,
    TResult Function()? successful,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialAppLanguageState value) usingLocale,
    required TResult Function(_FailureAppLanguageState value) failure,
    required TResult Function(_SuccessfulAppLanguageState value) successful,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialAppLanguageState value)? usingLocale,
    TResult Function(_FailureAppLanguageState value)? failure,
    TResult Function(_SuccessfulAppLanguageState value)? successful,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialAppLanguageState value)? usingLocale,
    TResult Function(_FailureAppLanguageState value)? failure,
    TResult Function(_SuccessfulAppLanguageState value)? successful,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _FailureAppLanguageState extends AppLanguageState {
  const factory _FailureAppLanguageState({final String message}) =
      _$_FailureAppLanguageState;
  const _FailureAppLanguageState._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$_FailureAppLanguageStateCopyWith<_$_FailureAppLanguageState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccessfulAppLanguageStateCopyWith<$Res> {
  factory _$$_SuccessfulAppLanguageStateCopyWith(
          _$_SuccessfulAppLanguageState value,
          $Res Function(_$_SuccessfulAppLanguageState) then) =
      __$$_SuccessfulAppLanguageStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SuccessfulAppLanguageStateCopyWithImpl<$Res>
    extends _$AppLanguageStateCopyWithImpl<$Res>
    implements _$$_SuccessfulAppLanguageStateCopyWith<$Res> {
  __$$_SuccessfulAppLanguageStateCopyWithImpl(
      _$_SuccessfulAppLanguageState _value,
      $Res Function(_$_SuccessfulAppLanguageState) _then)
      : super(_value, (v) => _then(v as _$_SuccessfulAppLanguageState));

  @override
  _$_SuccessfulAppLanguageState get _value =>
      super._value as _$_SuccessfulAppLanguageState;
}

/// @nodoc

class _$_SuccessfulAppLanguageState extends _SuccessfulAppLanguageState {
  const _$_SuccessfulAppLanguageState() : super._();

  @override
  String toString() {
    return 'AppLanguageState.successful()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuccessfulAppLanguageState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale locale) usingLocale,
    required TResult Function(String message) failure,
    required TResult Function() successful,
  }) {
    return successful();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Locale locale)? usingLocale,
    TResult Function(String message)? failure,
    TResult Function()? successful,
  }) {
    return successful?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale locale)? usingLocale,
    TResult Function(String message)? failure,
    TResult Function()? successful,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialAppLanguageState value) usingLocale,
    required TResult Function(_FailureAppLanguageState value) failure,
    required TResult Function(_SuccessfulAppLanguageState value) successful,
  }) {
    return successful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialAppLanguageState value)? usingLocale,
    TResult Function(_FailureAppLanguageState value)? failure,
    TResult Function(_SuccessfulAppLanguageState value)? successful,
  }) {
    return successful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialAppLanguageState value)? usingLocale,
    TResult Function(_FailureAppLanguageState value)? failure,
    TResult Function(_SuccessfulAppLanguageState value)? successful,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(this);
    }
    return orElse();
  }
}

abstract class _SuccessfulAppLanguageState extends AppLanguageState {
  const factory _SuccessfulAppLanguageState() = _$_SuccessfulAppLanguageState;
  const _SuccessfulAppLanguageState._() : super._();
}

/// @nodoc
mixin _$AppLanguageEvent {
  Locale get newLocale => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale newLocale) changeToLocale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Locale newLocale)? changeToLocale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale newLocale)? changeToLocale,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeToLocaleAppLanguageEvent value)
        changeToLocale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeToLocaleAppLanguageEvent value)? changeToLocale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeToLocaleAppLanguageEvent value)? changeToLocale,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppLanguageEventCopyWith<AppLanguageEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLanguageEventCopyWith<$Res> {
  factory $AppLanguageEventCopyWith(
          AppLanguageEvent value, $Res Function(AppLanguageEvent) then) =
      _$AppLanguageEventCopyWithImpl<$Res>;
  $Res call({Locale newLocale});
}

/// @nodoc
class _$AppLanguageEventCopyWithImpl<$Res>
    implements $AppLanguageEventCopyWith<$Res> {
  _$AppLanguageEventCopyWithImpl(this._value, this._then);

  final AppLanguageEvent _value;
  // ignore: unused_field
  final $Res Function(AppLanguageEvent) _then;

  @override
  $Res call({
    Object? newLocale = freezed,
  }) {
    return _then(_value.copyWith(
      newLocale: newLocale == freezed
          ? _value.newLocale
          : newLocale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc
abstract class _$$_ChangeToLocaleAppLanguageEventCopyWith<$Res>
    implements $AppLanguageEventCopyWith<$Res> {
  factory _$$_ChangeToLocaleAppLanguageEventCopyWith(
          _$_ChangeToLocaleAppLanguageEvent value,
          $Res Function(_$_ChangeToLocaleAppLanguageEvent) then) =
      __$$_ChangeToLocaleAppLanguageEventCopyWithImpl<$Res>;
  @override
  $Res call({Locale newLocale});
}

/// @nodoc
class __$$_ChangeToLocaleAppLanguageEventCopyWithImpl<$Res>
    extends _$AppLanguageEventCopyWithImpl<$Res>
    implements _$$_ChangeToLocaleAppLanguageEventCopyWith<$Res> {
  __$$_ChangeToLocaleAppLanguageEventCopyWithImpl(
      _$_ChangeToLocaleAppLanguageEvent _value,
      $Res Function(_$_ChangeToLocaleAppLanguageEvent) _then)
      : super(_value, (v) => _then(v as _$_ChangeToLocaleAppLanguageEvent));

  @override
  _$_ChangeToLocaleAppLanguageEvent get _value =>
      super._value as _$_ChangeToLocaleAppLanguageEvent;

  @override
  $Res call({
    Object? newLocale = freezed,
  }) {
    return _then(_$_ChangeToLocaleAppLanguageEvent(
      newLocale == freezed
          ? _value.newLocale
          : newLocale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$_ChangeToLocaleAppLanguageEvent
    extends _ChangeToLocaleAppLanguageEvent {
  const _$_ChangeToLocaleAppLanguageEvent(this.newLocale) : super._();

  @override
  final Locale newLocale;

  @override
  String toString() {
    return 'AppLanguageEvent.changeToLocale(newLocale: $newLocale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeToLocaleAppLanguageEvent &&
            const DeepCollectionEquality().equals(other.newLocale, newLocale));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(newLocale));

  @JsonKey(ignore: true)
  @override
  _$$_ChangeToLocaleAppLanguageEventCopyWith<_$_ChangeToLocaleAppLanguageEvent>
      get copyWith => __$$_ChangeToLocaleAppLanguageEventCopyWithImpl<
          _$_ChangeToLocaleAppLanguageEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale newLocale) changeToLocale,
  }) {
    return changeToLocale(newLocale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Locale newLocale)? changeToLocale,
  }) {
    return changeToLocale?.call(newLocale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale newLocale)? changeToLocale,
    required TResult orElse(),
  }) {
    if (changeToLocale != null) {
      return changeToLocale(newLocale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeToLocaleAppLanguageEvent value)
        changeToLocale,
  }) {
    return changeToLocale(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeToLocaleAppLanguageEvent value)? changeToLocale,
  }) {
    return changeToLocale?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeToLocaleAppLanguageEvent value)? changeToLocale,
    required TResult orElse(),
  }) {
    if (changeToLocale != null) {
      return changeToLocale(this);
    }
    return orElse();
  }
}

abstract class _ChangeToLocaleAppLanguageEvent extends AppLanguageEvent {
  const factory _ChangeToLocaleAppLanguageEvent(final Locale newLocale) =
      _$_ChangeToLocaleAppLanguageEvent;
  const _ChangeToLocaleAppLanguageEvent._() : super._();

  @override
  Locale get newLocale;
  @override
  @JsonKey(ignore: true)
  _$$_ChangeToLocaleAppLanguageEventCopyWith<_$_ChangeToLocaleAppLanguageEvent>
      get copyWith => throw _privateConstructorUsedError;
}
