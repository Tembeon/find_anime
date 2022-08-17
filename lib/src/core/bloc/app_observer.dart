import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppObserver extends BlocObserver {
  static AppObserver? _singleton;

  factory AppObserver.instance() => _singleton ??= AppObserver._();

  AppObserver._();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('Bloc change: \n$change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('Bloc transition:\n $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('Error:$error\n\nStackTrace: $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
