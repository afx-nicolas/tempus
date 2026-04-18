---
status: planned
created: 2026-04-18
priority: medium
tags:
- feature
- persistence
- riverpod
depends_on:
- 002-project-setup
- 003-core-metronome
parent: 001-tempus-app
created_at: 2026-04-18T00:12:07.182565582Z
updated_at: 2026-04-18T00:13:13.860453711Z
---

# Presets System

## Overview

Implement preset system for saving and loading user configurations.

**Why**: Musicians need quick access to their常用 tempos and time signatures for practice routines.

## Design

**Preset types**:
- **Common presets**: Built-in defaults (60, 90, 120, 140, 180 BPM with 4/4)
- **Custom presets**: User-saved configurations (name, BPM, time signature, swing, sound)

**Storage**: `shared_preferences`
- Store as JSON-encoded list
- Max 20 custom presets (reasonable limit)

**State**:
- List of custom presets
- Currently selected preset
- Preset dirty state (unsaved changes)

**UI**:
- Preset list/grid
- Save current config as preset
- Delete preset
- Rename preset
- Quick-select dropdown

## Plan

- [ ] Create `Preset` model with Freezed
- [ ] Create `PresetRepository` for storage operations
- [ ] Create `PresetController` (StateNotifier)
- [ ] Implement save preset functionality
- [ ] Implement load preset functionality
- [ ] Implement delete preset functionality
- [ ] Implement rename preset functionality
- [ ] Create `PresetList` widget
- [ ] Create `PresetSaveDialog` widget
- [ ] Create `PresetSelector` dropdown
- [ ] Add common preset quick-select buttons
- [ ] Write unit tests for repository
- [ ] Write widget tests for preset UI

## Test

- [ ] Can save new preset
- [ ] Can load existing preset
- [ ] Can delete preset
- [ ] Can rename preset
- [ ] Presets persist after app restart
- [ ] Common presets always available
- [ ] UI updates on preset changes
- [ ] Unit and widget tests pass

## Notes

**Preset model**:
```dart
@freezed
class Preset with _$Preset {
  const factory Preset({
    required String id,
    required String name,
    required int bpm,
    required int timeSignature,
    int? swing,
    String? sound,
  }) = _Preset;
}
```

**Storage key**: `user_presets_v1`