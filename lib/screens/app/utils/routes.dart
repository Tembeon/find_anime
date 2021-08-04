import 'package:fluro/fluro.dart';

import 'routes_handlers.dart';

class Routes {
  static late FluroRouter router;

  static String homeScreen = '/';
  static String settingsScreen = '/settings';

  static void defineRoutes(FluroRouter router) {
    // router.notFoundHandler use for 404 page
    router.notFoundHandler = homeScreenHandler;

    router.define(homeScreen,
        handler: homeScreenHandler, transitionType: TransitionType.cupertino);
  }
}
