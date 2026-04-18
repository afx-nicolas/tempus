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
created_at: 2026-04-18T00:11:41.570199174Z
updated_at: 2026-04-18T00:13:12.396907129Z
---

# Beat & Time Signature Controls

## Overview

Implement beat/time signature controls and swing/variation settings.

**Why**: Musicians need to practice different time signatures and rhythmic variations.

## Design

**Time signature controls**:
- Common signatures: 2/4, 3/4, 4/4, 5/4, 6/8, 7/8, 9/8, 12/8
- Custom signature input (1-16 beats)
- Visual indicator of current beat in measure
- Accent on first beat (configurable)

**Swing/Variation controls**:
- Swing percentage (0-100%, straight to heavy swing)
- Subdivision selector (quarter, eighth, triplet)
- Variation patterns (optional future feature)

**State**:
- Current time signature
- Current beat in measure
- Swing percentage
- Subdivision type

## Plan

- [ ] Create `TimeSignatureSelector` widget
- [ ] Create `BeatIndicator` widget (shows current beat)
- [ ] Create `SwingControl` widget (slider for swing %)
- [ ] Create `SubdivisionSelector` widget
- [ ] Add time signature to `MetronomeState`
- [ ] Implement swing timing logic (may need custom audio handling)
- [ ] Wire beat indicator to tick callback
- [ ] Add keyboard shortcuts for time signature
- [ ] Write widget tests

## Test

- [ ] Time signature changes work correctly
- [ ] Beat indicator highlights correct beat
- [ ] First beat is accented
- [ ] Swing affects timing (if implemented)
- [ ] Subdivision changes work
- [ ] Keyboard shortcuts function
- [ ] Widget tests pass

## Notes

**Swing implementation**: May require custom timing logic beyond `metronome` package basic features. Start without swing, add in iteration if package doesn't support.

**Beat visualization**: Use color/brightness to show accented vs regular beats.