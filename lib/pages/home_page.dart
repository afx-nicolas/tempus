import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/metronome_controller.dart';
import '../widgets/tempo_controls.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    // Initialize the metronome on page load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(metronomeProvider.notifier).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(metronomeProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tempus Metronome',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 48),
            const TempoControls(),
            const SizedBox(height: 32),
            // Play/Pause button
            FloatingActionButton.large(
              onPressed: () {
                if (state.isPlaying) {
                  ref.read(metronomeProvider.notifier).pause();
                } else {
                  ref.read(metronomeProvider.notifier).play();
                }
              },
              child: Icon(
                state.isPlaying ? Icons.pause : Icons.play_arrow,
                size: 48,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
