import 'package:flutter/material.dart';
import 'package:intl/intl_standalone.dart';

import 'src/core/widget/app.dart';

// starting app in io mode
Future<void> run() async {
  await findSystemLocale(); // find device language
  runApp(FindAnimeApp());
}