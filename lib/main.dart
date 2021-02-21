import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';

bool isDarkMode = false;

Future<void> main() async {
  // Initialize libs
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var box = await Hive.openBox('settings');

  // get system theme
  var brightness = SchedulerBinding.instance.window.platformBrightness;
  isDarkMode = brightness == Brightness.dark;

  if (isDarkMode == null) {
    isDarkMode = false;
  }

  // get user-selected theme
  String selectedTheme = box.get('selectedTheme');
  if (selectedTheme == 'dark') {
    isDarkMode = true;
  }
  if (selectedTheme == 'light') {
    isDarkMode = false;
  }

  runApp(FindAnime());
}
