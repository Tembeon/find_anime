import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../src/core/generated/localization/l10n.dart';


part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const AppLanguage(Locale('en')));

  Locale get getLocale => state.getLocale;

  // in real app should not toggle language, need
  // show user dialog or smthng else to pick locale
  void toggleAppLanguage() {
    List<Locale> locales = const AppLocalizationDelegate().supportedLocales;
    int currentLocale = locales.indexOf(getLocale);
    if (currentLocale + 1 >= locales.length) {
      emit(AppLanguage(locales[0]));
    } else {
      emit(AppLanguage(locales[currentLocale + 1]));
    }
  }
}
