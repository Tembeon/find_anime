import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/view/app.dart';
import 'app_observer.dart';

void main() {
  setPathUrlStrategy();

  BlocOverrides.runZoned(
    () => runApp(const FindAnimeApp()),
    blocObserver: AppObserver(),
  );
}
