---
status: in-progress
created: 2026-04-18
priority: critical
tags:
- umbrella
- flutter
- metronome
created_at: 2026-04-18T00:10:47.265297557Z
updated_at: 2026-04-18T00:10:47.265297557Z
---

# Tempus Metronome App

## Overview

Tempus is a desktop metronome app for musicians. This umbrella spec tracks all development work.

**Goal**: Simple, modern UI with minimal components, focused on UX for musical practice.

**Platforms**: Windows, Linux, macOS

**Stack**:
- Flutter + Material UI
- Riverpod (with code generation)
- Freezed
- Go Router
- `metronome` package for audio engine
- `shared_preferences` for persistence

## Design

Umbrella spec to organize all feature specs. Child specs will be developed in priority order:
1. Core metronome functionality
2. User controls
3. Presets
4. Polish & preferences

## Plan

- [x] Define project structure and dependencies
- [ ] Core metronome playback
- [ ] Tempo controls
- [ ] Beat/time signature
- [ ] Visual feedback
- [ ] Presets system
- [ ] Settings & preferences
- [ ] i18n
- [ ] Keyboard shortcuts

## Test

- [ ] All child specs completed
- [ ] Integration tests pass
- [ ] Manual testing on all platforms

## Notes

**Key decisions**:
- Audio: `metronome` package (purpose-built, precise timing)
- Storage: `shared_preferences` (simple, KISS)
- Testing: Unit + Widget tests
- Priority: Core-first approach

**Accessibility**: Basic keyboard shortcuts only
**Background audio**: Not required (app must be focused)