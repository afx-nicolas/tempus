---
status: planned
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
updated_at: 2026-04-18T00:13:11.017408923Z
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

- [ ] Create `TempoSlider` widget with Material UI slider
- [ ] Create `TempoDisplay` widget with animated number
- [ ] Create `TempoPresets` widget with common BPM buttons
- [ ] Implement scroll gesture handler for BPM adjustment
- [ ] Add keyboard shortcuts (↑/↓ arrows for BPM)
- [ ] Connect all controls to `MetronomeController`
- [ ] Add visual feedback on beat (highlight BPM display)
- [ ] Write widget tests for slider interactions

## Test

- [ ] Slider changes BPM in real-time
- [ ] Scroll up/down adjusts BPM
- [ ] Preset buttons set correct BPM
- [ ] Keyboard arrows change BPM
- [ ] BPM display updates smoothly
- [ ] Beat highlight fires on each tick
- [ ] Widget tests pass

## Notes

**Scroll sensitivity**: 1 BPM per scroll step (fine control)
**Keyboard**: Arrow up/down = ±1 BPM, Shift+Arrow = ±10 BPM