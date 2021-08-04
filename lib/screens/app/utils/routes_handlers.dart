import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '/screens/search/search.dart';

Handler homeScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return SearchScreen();
});
