---
status: planned
created: 2026-04-18
priority: medium
tags:
- ui
- animation
- widgets
depends_on:
- 003-core-metronome
parent: 001-tempus-app
created_at: 2026-04-18T00:11:53.021146362Z
updated_at: 2026-04-18T00:13:13.110489985Z
---

# Visual Feedback & Animations

## Overview

Implement visual animations and feedback synchronized with metronome ticks.

**Why**: Visual feedback helps musicians stay on beat, especially in loud environments or when learning.

## Design

**Visual elements**:
- Beat indicator (pulsing circle/bar)
- Current beat highlight in measure
- BPM display pulse on beat
- Optional: Subdivision indicators

**Animation approach**:
- Use tick callback from `metronome` package
- Flutter animations (`AnimationController` or implicit animations)
- Smooth transitions between beats
- Sync visual pulse with audio precisely

**Widgets**:
- `MetronomeVisualizer` - Main visual feedback component
- `BeatPulse` - Individual beat animation
- `MeasureTracker` - Shows position in measure

## Plan

- [ ] Create `MetronomeVisualizer` widget
- [ ] Implement beat pulse animation using tick callback
- [ ] Create measure tracker showing beat position
- [ ] Add BPM display pulse on each beat
- [ ] Implement accent visual distinction (brighter on beat 1)
- [ ] Optimize animation performance (vsync, ticker)
- [ ] Add optional subdivision visual (if needed)
- [ ] Write widget tests for animation triggers

## Test

- [ ] Visual pulse syncs with audio beat
- [ ] Accent beat is visually distinct
- [ ] Measure tracker shows correct beat
- [ ] Animations are smooth (60fps)
- [ ] No visual lag or drift
- [ ] Widget tests pass

## Notes

**Performance**: Use `TickerProvider` for animations, avoid rebuilding entire widget tree on each tick.

**Accessibility**: Visual feedback should complement audio, not replace it.