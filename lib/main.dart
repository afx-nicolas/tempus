import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

import 'core/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SoLoud.instance.init();

  runApp(
    const ProviderScope(
      child: TempusApp(),
    ),
  );
}
