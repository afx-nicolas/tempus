---
status: complete
created: 2026-04-18
priority: critical
tags:
- core
- audio
- riverpod
depends_on:
- 002-project-setup
parent: 001-tempus-app
created_at: 2026-04-18T00:11:14.086050698Z
updated_at: 2026-04-18T00:56:00.143745147Z
completed_at: 2026-04-18T00:56:00.143745147Z
transitions:
- status: in-progress
  at: 2026-04-18T00:52:15.918915782Z
- status: complete
  at: 2026-04-18T00:56:00.143745147Z
---

# Core Metronome Playback

## Overview

Implement core metronome playback functionality using the `metronome` package.

**Why**: This is the heart of the app - everything else builds on top of reliable, precise timing.

## Design

**Audio engine**: `metronome` package (v2.0.7)
- Precise timing with BPM 30-600
- Time signature support (1-16 beats)
- Accented first beat option
- Tick callback for visual sync
- Volume control

**State to manage**:
- BPM (tempo)
- Time signature
- Volume
- Playing state
- Current tick (for visuals)
- Sound selection

**Provider structure**:
- `MetronomeController` - StateNotifier
- `metronomeProvider` - AsyncNotifier for audio init
- `isPlayingProvider` - Stream from tick events

## Plan

- [ ] Add `metronome` package dependency
- [ ] Create `MetronomeState` model with Freezed
- [ ] Create `MetronomeController` (StateNotifier)
- [ ] Implement audio initialization
- [ ] Implement play/pause/stop methods
- [ ] Implement BPM setter
- [ ] Implement time signature setter
- [ ] Implement volume setter
- [ ] Wire tick callback to update UI state
- [ ] Handle disposal/cleanup
- [ ] Write unit tests for controller logic

## Test

- [ ] Metronome starts playing at correct BPM
- [ ] BPM changes take effect immediately
- [ ] Time signature changes work correctly
- [ ] Volume control works
- [ ] Play/pause/stop all function correctly
- [ ] Tick callback fires at correct intervals
- [ ] No memory leaks on dispose
- [ ] Unit tests pass

## Notes

**Default values**:
- BPM: 120
- Time signature: 4
- Volume: 50
- Sound: default (tick)

**Edge cases**:
- BPM boundaries (30-600)
- Time signature < 2 (no accent)
- Rapid BPM changes
