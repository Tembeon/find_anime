import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../../theme.dart';
import '../utils/routes.dart';

class FindAnimeApp extends StatefulWidget {
  @override
  State<FindAnimeApp> createState() => _FindAnimeAppState();
}

class _FindAnimeAppState extends State<FindAnimeApp> {
  final router = FluroRouter();

  @override
  void initState() {
    Routes.defineRoutes(router);
    Routes.router = router;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.homeScreen,
      onGenerateRoute: Routes.router.generator,
      theme: themeData(),
      darkTheme: darkThemeData(),
    );
  }
}
