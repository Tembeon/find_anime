import 'package:find_anime/ui/screens/settings_screen.dart';
import 'package:find_anime/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_router/flutter_web_router.dart';
import 'package:get/get.dart';

import 'main.dart';
import 'ui/screens/current_search.dart';

class FindAnime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize WebRouter (this thing give URL like this: /search)
    final router = WebRouter();
    router.addRoute(CurrentSearch.routeName, (request) => CurrentSearch());
    router.addRoute(SettingsScreen.routeName, (request) => SettingsScreen());

    return GetMaterialApp(
      initialRoute: CurrentSearch.routeName,
      onGenerateRoute: router.build(),
      theme: isDarkMode ? darkThemeData(context) : themeData(context),
    );
  }
}
