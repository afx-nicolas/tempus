import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio_media_kit/just_audio_media_kit.dart';

import 'core/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Configure MPV to disable file cache (prevents Linux cache errors)
  JustAudioMediaKit.bufferSize = 0; // Disable cache
  
  JustAudioMediaKit.ensureInitialized();
  
  runApp(
    const ProviderScope(
      child: TempusApp(),
    ),
  );
}
