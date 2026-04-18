---
status: planned
created: 2026-04-18
priority: high
tags:
- ui
- page
- layout
depends_on:
- 004-tempo-controls
- 005-beat-signature-controls
- 006-visual-feedback
- 007-presets-system
- 008-settings-preferences
parent: 001-tempus-app
created_at: 2026-04-18T00:12:49.563534118Z
updated_at: 2026-04-18T00:13:16.922453797Z
---

# Main Page Layout

## Overview

Create the main page layout and assemble all components into a cohesive UI.

**Why**: Bring together all widgets and features into a polished, minimal interface.

## Design

**Layout structure**:
- Single-page app (Go Router with one main route)
- Centered metronome controls
- Clean, minimal Material UI design
- Responsive sizing for different window sizes

**Main sections**:
1. **Header**: App title, theme switcher, settings button
2. **Main display**: Large BPM number, beat indicator
3. **Tempo controls**: Slider, presets, scroll handler
4. **Beat controls**: Time signature selector, swing control
5. **Visual feedback**: Animated beat indicator
6. **Footer**: Preset selector, keyboard hints

**Design principles**:
- Minimal components (KISS)
- Clear visual hierarchy
- Easy to read at a glance
- Touch-friendly (large hit targets)

## Plan

- [ ] Create `HomePage` widget
- [ ] Design main layout structure
- [ ] Integrate `TempoDisplay` widget
- [ ] Integrate `TempoSlider` widget
- [ ] Integrate `TimeSignatureSelector` widget
- [ ] Integrate `MetronomeVisualizer` widget
- [ ] Integrate `PresetSelector` widget
- [ ] Add app bar with theme switcher and settings
- [ ] Apply Material UI theme
- [ ] Ensure responsive layout
- [ ] Polish spacing and alignment
- [ ] Write widget tests for page structure

## Test

- [ ] All components render correctly
- [ ] Layout is responsive
- [ ] Visual hierarchy is clear
- [ ] All interactions work from main page
- [ ] Theme applies correctly
- [ ] Widget tests pass

## Notes

**Layout approach**: Use `Column`/`Row` with `Expanded` and `Flexible` for responsiveness.

**Minimalism**: Avoid unnecessary decorations, focus on functionality.