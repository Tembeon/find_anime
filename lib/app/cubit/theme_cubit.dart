import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const AppTheme(ThemeMode.system));

  ThemeMode get appTheme => state.getThemeMode;

  set setTheme(ThemeMode newMode) => AppTheme(newMode);

  void changeAppTheme() {
    if (_isDeviceInDarkMode && state.getThemeMode == ThemeMode.system) {
      emit(const AppTheme(ThemeMode.light));
    } else if (_isAppThemeDark) {
      emit(const AppTheme(ThemeMode.light));
    } else {
      emit(const AppTheme(ThemeMode.dark));
    }
  }

  bool get _isDeviceInDarkMode {
    Brightness deviceBrightness =
        SchedulerBinding.instance.window.platformBrightness;

    return deviceBrightness == Brightness.dark;
  }

  bool get _isAppThemeDark => appTheme == ThemeMode.dark;
}
