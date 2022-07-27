part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  ThemeMode get getThemeMode;
}

class AppTheme extends ThemeState {
  const AppTheme(this.themeMode);

  final ThemeMode themeMode;

  @override
  List<Object> get props => [themeMode];

  @override
  ThemeMode get getThemeMode => themeMode;
}
