import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../../theme.dart';
import '../../generated/l10n.dart';
import '../cubit/language_cubit.dart';
import '../cubit/theme_cubit.dart';
import '../utils/app_router.dart';

class FindAnimeApp extends StatelessWidget {
  const FindAnimeApp({
    Key? key,
    this.themeCubit,
    this.languageCubit,
  }) : super(key: key);

  final ThemeCubit? themeCubit;
  final LanguageCubit? languageCubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => themeCubit ?? ThemeCubit()),
        BlocProvider(create: (_) => languageCubit ?? LanguageCubit()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            title: 'FindAnime',
            routerDelegate: AppRouter.beamerDelegate,
            routeInformationParser: AppRouter.beamerParser,
            theme: themeData(),
            darkTheme: darkThemeData(),
            themeMode: context.watch<ThemeCubit>().appTheme,
            locale: context.watch<LanguageCubit>().getLocale,
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
