---
status: planned
created: 2026-04-18
priority: medium
tags:
- testing
- quality
depends_on:
- 003-core-metronome
- 004-tempo-controls
- 005-beat-signature-controls
- 007-presets-system
- 008-settings-preferences
- 011-main-page-layout
parent: 001-tempus-app
created_at: 2026-04-18T00:13:02.665656736Z
updated_at: 2026-04-18T00:13:17.731995489Z
---

# Testing Suite

## Overview

Write comprehensive unit and widget tests for critical components.

**Why**: Ensure reliability and catch regressions as development continues.

## Design

**Unit tests** (logic):
- `MetronomeController` - All state changes
- `PresetController` - CRUD operations
- `PresetRepository` - Storage operations
- `SettingsController` - Theme/locale changes
- Helper functions and utilities

**Widget tests** (UI):
- `TempoSlider` - Interactions and callbacks
- `TempoDisplay` - Rendering and updates
- `TimeSignatureSelector` - Selection logic
- `PresetList` - List operations
- `ThemeSwitcher` - Toggle behavior
- `HomePage` - Overall structure

**Integration tests** (optional future):
- Full play/pause flow
- Preset save/load flow
- Theme persistence flow

## Plan

- [ ] Write unit tests for `MetronomeController`
- [ ] Write unit tests for `PresetController`
- [ ] Write unit tests for `PresetRepository`
- [ ] Write unit tests for `SettingsController`
- [ ] Write widget tests for `TempoSlider`
- [ ] Write widget tests for `TempoDisplay`
- [ ] Write widget tests for `TimeSignatureSelector`
- [ ] Write widget tests for `PresetList`
- [ ] Write widget tests for `ThemeSwitcher`
- [ ] Write widget tests for `HomePage`
- [ ] Ensure all tests pass on CI
- [ ] Add test coverage reporting (optional)

## Test

- [ ] All unit tests pass
- [ ] All widget tests pass
- [ ] Test coverage > 70% for critical files
- [ ] Tests run in CI pipeline
- [ ] No flaky tests

## Notes

**Test organization**:
```
test/
  unit/
    controllers/
    repositories/
  widget/
    widgets/
    pages/
```

**Mocking**: Use `mocktail` or `mockito` for dependencies.

**Golden tests**: Consider for visual regression testing (optional).