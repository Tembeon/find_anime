import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/core/bloc/app_observer.dart';
import 'runner_stub.dart'
    if (dart.library.io) 'runner_io.dart'
    if (dart.library.html) 'runner_web.dart' as runner;

Future<void> main() async {
  runZonedGuarded(
    () {
      Bloc.observer = AppObserver.instance();
      Bloc.transformer = bloc_concurrency.sequential<Object?>();
      runner.run();
    },
    (error, stack) {
      debugPrint('Error: $error\n\nStacktrace: $stack');
    },
  );
}
