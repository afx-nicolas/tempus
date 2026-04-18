---
status: complete
created: 2026-04-18
priority: high
tags:
- ui
- controls
- widgets
depends_on:
- 003-core-metronome
parent: 001-tempus-app
created_at: 2026-04-18T00:11:26.433949134Z
updated_at: 2026-04-18T01:23:29.844065316Z
completed_at: 2026-04-18T01:23:29.844065316Z
transitions:
- status: in-progress
  at: 2026-04-18T01:17:23.833899868Z
- status: complete
  at: 2026-04-18T01:23:29.844065316Z
---

# Tempo Controls

## Overview

Implement tempo/BPM controls with slider and scroll interactions.

**Why**: Primary user interaction for adjusting metronome speed.

## Design

**Controls**:
- Slider: Visual drag control (30-600 BPM)
- Scroll: Mouse wheel / trackpad gesture
- Numeric input: Direct BPM entry
- Preset buttons: Common tempos (60, 90, 120, 140, 180)

**UX considerations**:
- Smooth slider movement
- Scroll sensitivity (fine vs coarse adjustment)
- Visual feedback on current BPM
- Haptic feedback on beat (optional, platform-dependent)

**Widgets to create**:
- `TempoSlider` - Main slider widget
- `TempoDisplay` - Large BPM number display
- `TempoPresets` - Quick-select buttons
- `ScrollTempoHandler` - Gesture detector

## Plan

- [x] Create `TempoSlider` widget with Material UI slider
- [x] Create `TempoDisplay` widget with animated number
- [x] Create `TempoPresets` widget with common BPM buttons
- [x] Implement scroll gesture handler for BPM adjustment
- [x] Add keyboard shortcuts (↑/↓ arrows for BPM)
- [x] Connect all controls to `MetronomeController`
- [x] Add visual feedback on beat (highlight BPM display)
- [x] Write widget tests for slider interactions

## Test

- [x] Slider changes BPM in real-time
- [x] Scroll up/down adjusts BPM
- [x] Preset buttons set correct BPM
- [x] Keyboard arrows change BPM
- [x] BPM display updates smoothly
- [x] Beat highlight fires on each tick
- [x] Widget tests pass

## Notes

**Scroll sensitivity**: 1 BPM per scroll step (fine control)
**Keyboard**: Arrow up/down = ±1 BPM, Shift+Arrow = ±10 BPM