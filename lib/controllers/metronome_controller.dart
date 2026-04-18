import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import '../models/metronome_state.dart';

final metronomeProvider = StateNotifierProvider<MetronomeController, MetronomeState>((ref) {
  return MetronomeController();
});

class MetronomeController extends StateNotifier<MetronomeState> {
  AudioSource? _tickSound;
  Timer? _metronomeTimer;
  int _currentBeat = 0;
  bool _isDisposed = false;

  MetronomeController() : super(const MetronomeState());

  Future<void> initialize() async {
    if (_isDisposed) return;

    try {
      _tickSound = await SoLoud.instance.loadAsset('assets/audio/tick.wav');
      state = state.copyWith(isInitialized: true);
    } catch (e) {
      throw Exception('Failed to initialize metronome: $e');
    }
  }

  Future<void> play() async {
    if (!state.isInitialized) {
      await initialize();
    }

    if (_isDisposed) return;

    state = state.copyWith(isPlaying: true);
    _currentBeat = 0;
    _startMetronome();
  }

  Future<void> pause() async {
    _stopMetronome();
    state = state.copyWith(isPlaying: false);
  }

  Future<void> stop() async {
    _stopMetronome();
    _currentBeat = 0;
    state = state.copyWith(isPlaying: false, currentTick: 0);
  }

  void _startMetronome() {
    _stopMetronome();

    final interval = Duration(milliseconds: (60000 / state.bpm).round());

    _metronomeTimer = Timer.periodic(interval, (timer) {
      if (_isDisposed) {
        timer.cancel();
        return;
      }

      _currentBeat++;
      if (_currentBeat > state.timeSignature) {
        _currentBeat = 1;
      }

      state = state.copyWith(currentTick: _currentBeat);

      // Play sound on each beat
      _playSound();
    });
  }

  void _stopMetronome() {
    _metronomeTimer?.cancel();
    _metronomeTimer = null;
  }

  void _playSound() {
    if (_isDisposed || _tickSound == null) return;

    try {
      SoLoud.instance.play(_tickSound!, volume: state.volume / 100.0);
    } catch (e) {
      // Ignore playback errors
    }
  }

  Future<void> setBpm(int bpm) async {
    if (bpm < 30 || bpm > 600) {
      throw ArgumentError('BPM must be between 30 and 600');
    }

    state = state.copyWith(bpm: bpm);

    // Restart timer if playing with new BPM
    if (state.isPlaying) {
      _startMetronome();
    }
  }

  Future<void> setTimeSignature(int timeSignature) async {
    if (timeSignature < 1 || timeSignature > 16) {
      throw ArgumentError('Time signature must be between 1 and 16');
    }
    state = state.copyWith(timeSignature: timeSignature);
  }

  Future<void> setVolume(int volume) async {
    if (volume < 0 || volume > 100) {
      throw ArgumentError('Volume must be between 0 and 100');
    }

    state = state.copyWith(volume: volume);
  }

  @override
  void dispose() {
    _isDisposed = true;
    _stopMetronome();
    if (_tickSound != null) {
      SoLoud.instance.disposeSource(_tickSound!);
    }
    super.dispose();
  }
}
