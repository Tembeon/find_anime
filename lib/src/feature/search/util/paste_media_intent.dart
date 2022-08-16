import 'dart:typed_data';

import 'package:flutter/material.dart';

class PasteMediaIntent extends Intent {
  const PasteMediaIntent({required this.mediaBytes, this.text});

  final Future<Uint8List?> mediaBytes;
  final Future<String?>? text;
}
