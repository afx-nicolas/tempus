import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controllers/metronome_controller.dart';

/// Displays the current BPM with optional beat highlight animation
class TempoDisplay extends ConsumerWidget {
  const TempoDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(metronomeProvider);
    final isPlaying = state.isPlaying;
    final currentTick = state.currentTick;
    final bpm = state.bpm;

    // Trigger beat highlight animation on each tick
    final shouldHighlight = isPlaying && currentTick > 0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: shouldHighlight
            ? Theme.of(context).colorScheme.primaryContainer
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'BPM',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 4),
          TweenAnimationBuilder<int>(
            duration: const Duration(milliseconds: 150),
            tween: IntTween(begin: bpm, end: bpm),
            builder: (context, value, child) {
              return Text(
                '$value',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 64,
                    ),
              );
            },
          ),
        ],
      ),
    );
  }
}
