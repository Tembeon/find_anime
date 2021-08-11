import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_strategy/url_strategy.dart';

import 'screens/app/app_observer.dart';
import 'screens/app/view/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy(); // remove # from url
  Bloc.observer = AppObserver();
  runApp(const FindAnimeApp());
}
