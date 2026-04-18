import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metronome/metronome.dart';
import '../models/metronome_state.dart';

final metronomeProvider = StateNotifierProvider<MetronomeController, MetronomeState>((ref) {
  return MetronomeController();
});

class MetronomeController extends StateNotifier<MetronomeState> {
  final Metronome _metronome = Metronome();
  StreamSubscription<int>? _tickSubscription;

  MetronomeController() : super(const MetronomeState());

  Future<void> initialize() async {
    try {
      await _metronome.init(
        'assets/audio/claves.wav',
        accentedPath: 'assets/audio/claves44.wav',
        bpm: state.bpm,
        volume: state.volume,
        enableTickCallback: true,
        timeSignature: state.timeSignature,
        sampleRate: 44100,
      );

      _tickSubscription = _metronome.tickStream.listen((tick) {
        state = state.copyWith(currentTick: tick);
      });

      state = state.copyWith(isInitialized: true);
    } catch (e) {
      throw Exception('Failed to initialize metronome: $e');
    }
  }

  Future<void> play() async {
    if (!state.isInitialized) {
      await initialize();
    }
    await _metronome.play();
    state = state.copyWith(isPlaying: true);
  }

  Future<void> pause() async {
    await _metronome.pause();
    state = state.copyWith(isPlaying: false);
  }

  Future<void> stop() async {
    await _metronome.stop();
    state = state.copyWith(isPlaying: false, currentTick: 0);
  }

  Future<void> setBpm(int bpm) async {
    if (bpm < 30 || bpm > 600) {
      throw ArgumentError('BPM must be between 30 and 600');
    }
    await _metronome.setBPM(bpm);
    state = state.copyWith(bpm: bpm);
  }

  Future<void> setTimeSignature(int timeSignature) async {
    if (timeSignature < 1 || timeSignature > 16) {
      throw ArgumentError('Time signature must be between 1 and 16');
    }
    await _metronome.setTimeSignature(timeSignature);
    state = state.copyWith(timeSignature: timeSignature);
  }

  Future<void> setVolume(int volume) async {
    if (volume < 0 || volume > 100) {
      throw ArgumentError('Volume must be between 0 and 100');
    }
    await _metronome.setVolume(volume);
    state = state.copyWith(volume: volume);
  }

  @override
  void dispose() {
    _tickSubscription?.cancel();
    _metronome.destroy();
    super.dispose();
  }
}
