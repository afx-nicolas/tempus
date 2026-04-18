import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controllers/metronome_controller.dart';
import 'tempo_display.dart';
import 'tempo_slider.dart';
import 'tempo_presets.dart';

/// Container for tempo controls with scroll and keyboard support
class TempoControls extends ConsumerStatefulWidget {
  const TempoControls({super.key});

  @override
  ConsumerState<TempoControls> createState() => _TempoControlsState();
}

class _TempoControlsState extends ConsumerState<TempoControls> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Request focus to enable keyboard shortcuts
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _adjustBpm(int delta) {
    final state = ref.read(metronomeProvider);
    final newBpm = (state.bpm + delta).clamp(30, 600);
    ref.read(metronomeProvider.notifier).setBpm(newBpm);
  }

  void _handleScroll(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      // Scroll down (positive scrollDelta.dy) decreases BPM
      // Scroll up (negative scrollDelta.dy) increases BPM
      final delta = event.scrollDelta.dy < 0 ? 1 : -1;
      _adjustBpm(delta);
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: (KeyEvent key) {
        if (key is KeyDownEvent) {
          final isShiftPressed = HardwareKeyboard.instance.isShiftPressed;
          final delta = isShiftPressed ? 10 : 1;

          if (key.logicalKey == LogicalKeyboardKey.arrowUp) {
            _adjustBpm(delta);
          } else if (key.logicalKey == LogicalKeyboardKey.arrowDown) {
            _adjustBpm(-delta);
          }
        }
      },
      child: Listener(
        onPointerSignal: _handleScroll,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              TempoDisplay(),
              SizedBox(height: 24),
              TempoSlider(),
              SizedBox(height: 16),
              TempoPresets(),
            ],
          ),
        ),
      ),
    );
  }
}
