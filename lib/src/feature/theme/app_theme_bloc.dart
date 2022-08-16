import 'dart:ui';

import 'package:flutter/material.dart'; // used only for ThemeMode
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_theme_bloc.freezed.dart';

@freezed
class AppThemeState with _$AppThemeState {
  const AppThemeState._();

  ThemeMode get themeMode => when(
        system: () => ThemeMode.system,
        light: () => ThemeMode.light,
        dark: () => ThemeMode.dark,
      );

  /// App theme is matching system
  const factory AppThemeState.system() = _SystemAppThemeState;

  /// App theme is light
  const factory AppThemeState.light() = _LightAppThemeState;

  /// App theme is dark
  const factory AppThemeState.dark() = _DarkAppThemeState;
}

@freezed
class AppThemeEvent with _$AppThemeEvent {
  const AppThemeEvent._();

  /// User changed app theme to light
  const factory AppThemeEvent.changedToLight() = _ChangedToLightAppThemeEvent;

  /// User changed app theme to dark
  const factory AppThemeEvent.changedToDark() = _ChangedToDarkAppThemeEvent;

  /// User changed app theme to matching system
  const factory AppThemeEvent.changedToSystem() = _ChangedToSystemAppThemeEvent;
}

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc(
    Brightness brightness,
  ) : super(
          brightness == Brightness.light
              ? const AppThemeState.light()
              : const AppThemeState.dark(),
        ) {
    on<AppThemeEvent>(
      (event, emit) => event.map<Future<void>>(
        changedToDark: (event) => _changedToDark(event, emit),
        changedToLight: (event) => _changedToLight(event, emit),
        changedToSystem: (event) => _changedToSystem(event, emit),
      ),
    );
  }

  Future<void> _changedToDark(
    _ChangedToDarkAppThemeEvent event,
    Emitter<AppThemeState> emitter,
  ) async =>
      emitter(const AppThemeState.dark());

  Future<void> _changedToLight(
    _ChangedToLightAppThemeEvent event,
    Emitter<AppThemeState> emitter,
  ) async =>
      emitter(const AppThemeState.light());

  Future<void> _changedToSystem(
    _ChangedToSystemAppThemeEvent event,
    Emitter<AppThemeState> emitter,
  ) async =>
      emitter(const AppThemeState.system());
}
