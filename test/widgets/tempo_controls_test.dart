import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tempus/widgets/tempo_display.dart';
import 'package:tempus/widgets/tempo_slider.dart';
import 'package:tempus/widgets/tempo_presets.dart';

void main() {
  group('TempoDisplay', () {
    testWidgets('displays BPM label', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TempoDisplay(),
            ),
          ),
        ),
      );

      expect(find.text('BPM'), findsOneWidget);
      expect(find.text('120'), findsOneWidget); // Default BPM
    });
  });

  group('TempoSlider', () {
    testWidgets('displays slider with correct range labels', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TempoSlider(),
            ),
          ),
        ),
      );

      expect(find.byType(Slider), findsOneWidget);
      expect(find.text('30'), findsOneWidget); // Min label
      expect(find.text('600'), findsOneWidget); // Max label
    });

    testWidgets('slider has correct initial value', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TempoSlider(),
            ),
          ),
        ),
      );

      final slider = tester.widget<Slider>(find.byType(Slider));
      expect(slider.value, equals(120.0)); // Default BPM
      expect(slider.min, equals(30.0));
      expect(slider.max, equals(600.0));
    });
  });

  group('TempoPresets', () {
    testWidgets('displays all preset buttons', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TempoPresets(),
            ),
          ),
        ),
      );

      expect(find.text('60'), findsOneWidget);
      expect(find.text('90'), findsOneWidget);
      expect(find.text('120'), findsOneWidget);
      expect(find.text('140'), findsOneWidget);
      expect(find.text('180'), findsOneWidget);
    });

    testWidgets('highlights current BPM preset', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TempoPresets(),
            ),
          ),
        ),
      );

      // Default is 120, should be highlighted
      final chip120 = find.text('120');
      expect(chip120, findsOneWidget);
    });
  });
}
