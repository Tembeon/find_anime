import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../../theme.dart';
import '../../generated/l10n.dart';
import '../utils/app_router.dart';

class FindAnimeApp extends StatefulWidget {
  const FindAnimeApp({Key? key}) : super(key: key);

  @override
  State<FindAnimeApp> createState() => _FindAnimeAppState();
}

class _FindAnimeAppState extends State<FindAnimeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FindAnime',
      routerDelegate: AppRouter.beamerDelegate,
      routeInformationParser: AppRouter.beamerParser,
      theme: themeData(),
      darkTheme: darkThemeData(),
      supportedLocales: const AppLocalizationDelegate().supportedLocales,
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
