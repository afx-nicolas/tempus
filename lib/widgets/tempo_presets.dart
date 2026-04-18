import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controllers/metronome_controller.dart';

/// Quick-select buttons for common tempo presets
class TempoPresets extends ConsumerWidget {
  const TempoPresets({super.key});

  static const List<int> _presetBpms = [60, 90, 120, 140, 180];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(metronomeProvider);
    final currentBpm = state.bpm;

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: _presetBpms.map((bpm) {
        final isSelected = bpm == currentBpm;
        return ChoiceChip(
          label: Text('$bpm'),
          selected: isSelected,
          onSelected: (selected) {
            if (selected) {
              ref.read(metronomeProvider.notifier).setBpm(bpm);
            }
          },
          labelStyle: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.onSurface,
          ),
          selectedColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        );
      }).toList(),
    );
  }
}
