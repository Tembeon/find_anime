import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl_standalone.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/view/app.dart';
import 'app_observer.dart';

Future<void> main() async {
  setPathUrlStrategy();
  if (!kIsWeb) await findSystemLocale();
  BlocOverrides.runZoned(
    () => runApp(const FindAnimeApp()),
    blocObserver: AppObserver(),
  );
}
