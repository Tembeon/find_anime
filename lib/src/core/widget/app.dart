import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../feature/localization/app_language_bloc.dart';
import '../../feature/theme/app_theme_bloc.dart';
import '../generated/localization/l10n.dart';
import '../router/app_router.dart';
import '../theme/theme.dart';

class FindAnimeApp extends StatelessWidget {
  FindAnimeApp({
    Key? key,
    AppThemeBloc? themeBloc,
    AppLanguageBloc? languageBloc,
  })  : _theme = themeBloc ??= AppThemeBloc(Brightness.dark),
        _language = languageBloc ??= AppLanguageBloc(const Locale('en')),
        super(key: key);

  final AppThemeBloc _theme;
  final AppLanguageBloc _language;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => _theme),
        BlocProvider(create: (_) => _language),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            title: 'FindAnime',
            routerDelegate: AppRouter.beamerDelegate,
            routeInformationParser: AppRouter.beamerParser,
            theme: themeData(),
            darkTheme: darkThemeData(),
            themeMode: context.watch<AppThemeBloc>().state.themeMode,
            locale: context.watch<AppLanguageBloc>().state.getCurrentLocaleOrNull,
            supportedLocales: const AppLocalizationDelegate().supportedLocales,
            localizationsDelegates: const [
              AppLocalizationDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
