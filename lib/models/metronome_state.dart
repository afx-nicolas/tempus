import 'package:freezed_annotation/freezed_annotation.dart';

part 'metronome_state.freezed.dart';

@freezed
abstract class MetronomeState with _$MetronomeState {
  const factory MetronomeState({
    @Default(120) int bpm,
    @Default(4) int timeSignature,
    @Default(50) int volume,
    @Default(false) bool isPlaying,
    @Default(0) int currentTick,
    @Default(false) bool isInitialized,
  }) = _MetronomeState;
}
