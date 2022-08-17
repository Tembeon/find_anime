import 'package:flutter/material.dart';
import 'package:intl/intl_browser.dart';
import 'package:url_strategy/url_strategy.dart';

import 'src/core/widget/app.dart';

// starting app in web mode
Future<void> run() async {
  setPathUrlStrategy(); // remove "#" from url
  await findSystemLocale(); // find language for web platform
  runApp(FindAnimeApp());
}