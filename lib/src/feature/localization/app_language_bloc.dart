import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/generated/localization/l10n.dart';

part 'app_language_bloc.freezed.dart';

@freezed
class AppLanguageState with _$AppLanguageState {
  const AppLanguageState._();

  /// Returns current used language. Can be null, if something went wrong
  /// while changing language
  Locale? get getCurrentLocaleOrNull => maybeWhen(
        usingLocale: (locale) => locale,
        orElse: () => null,
      );

  /// Application using [locale]
  const factory AppLanguageState.usingLocale(Locale locale) =
      _InitialAppLanguageState;

  /// Something went wrong with language
  const factory AppLanguageState.failure({
    @Default('An error while changed language has occurred') String message,
  }) = _FailureAppLanguageState;

  /// Language changing was successful
  const factory AppLanguageState.successful() = _SuccessfulAppLanguageState;
}

@freezed
class AppLanguageEvent with _$AppLanguageEvent {
  const AppLanguageEvent._();

  /// User changed app language to [newLocale]
  const factory AppLanguageEvent.changeToLocale(Locale newLocale) =
      _ChangeToLocaleAppLanguageEvent;

  /// User toggled language
  const factory AppLanguageEvent.languageToggled() =
      _LanguageToggledAppLanguageEvent;
}

class AppLanguageBloc extends Bloc<AppLanguageEvent, AppLanguageState> {
  AppLanguageBloc(Locale locale) : super(AppLanguageState.usingLocale(locale)) {
    on<AppLanguageEvent>(
      (event, emit) => event.map<Future<void>>(
        changeToLocale: (event) => _changeToLocale(event, emit),
        languageToggled: (event) => _languageToggled(event, emit),
      ),
    );
  }

  /// Sets app language to new
  Future<void> _changeToLocale(
    _ChangeToLocaleAppLanguageEvent event,
    Emitter<AppLanguageState> emitter,
  ) async {
    try {
      // load new locale to app
      await S.load(event.newLocale);
      // notify about new language
      emitter(AppLanguageState.usingLocale(event.newLocale));
      // notify about successful changing
      emitter(const AppLanguageState.successful());
    } on Object catch (error) {
      // something went wrong while changing language
      emitter(AppLanguageState.failure(message: error.toString()));
      // rethrow error to observer
      rethrow;
    }
  }

  // this method used only for bloc training, in real app
  // you should use [_changeToLocale] with GUI for user. Do not just
  // toggle language
  /// Toggles current app language
  Future<void> _languageToggled(
    _LanguageToggledAppLanguageEvent event,
    Emitter<AppLanguageState> emitter,
  ) async {
    List<Locale> locales = const AppLocalizationDelegate().supportedLocales;
    int currentLocale = locales.indexOf(state.getCurrentLocaleOrNull!);
    if (currentLocale + 1 >= locales.length) {
      emitter(AppLanguageState.usingLocale(locales[0]));
    } else {
      emitter(AppLanguageState.usingLocale(locales[currentLocale + 1]));
    }
  }
}
