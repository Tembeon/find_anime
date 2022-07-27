part of 'language_cubit.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  Locale get getLocale;
}

class AppLanguage extends LanguageState {
  const AppLanguage(this.locale);

  final Locale locale;

  @override
  Locale get getLocale => locale;

  @override
  List<Object> get props => [locale];
}
