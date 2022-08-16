import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/generated/localization/l10n.dart';

part 'app_language_bloc.freezed.dart';

@freezed
class AppLanguageState with _$AppLanguageState {
  const AppLanguageState._();

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
}

class AppLanguageBloc extends Bloc<AppLanguageEvent, AppLanguageState> {
  AppLanguageBloc(Locale locale) : super(AppLanguageState.usingLocale(locale)) {
    on<AppLanguageEvent>(
      (event, emit) => event.map<Future<void>>(
        changeToLocale: (event) => _changeToLocale(event, emit),
      ),
    );
  }

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
}
