import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthnote/global/global_init.dart' as gi;

import 'app.dart';

void main() {
  // get_it初期化
  gi.setup();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
