---
status: planned
created: 2026-04-18
priority: low
tags:
- accessibility
- keyboard
- ux
depends_on:
- 002-project-setup
- 004-tempo-controls
- 005-beat-signature-controls
parent: 001-tempus-app
created_at: 2026-04-18T00:12:39.236406311Z
updated_at: 2026-04-18T00:13:16.248915190Z
---

# Keyboard Shortcuts

## Overview

Implement basic keyboard shortcuts for essential controls.

**Why**: Provide quick access to common actions without mouse interaction, improving UX for musicians during practice.

## Design

**Keyboard shortcuts**:
- `Space` - Play/Pause toggle
- `↑` / `↓` - BPM +1 / -1
- `Shift` + `↑` / `↓` - BPM +10 / -10
- `←` / `→` - Previous/Next time signature
- `+` / `-` - BPM +1 / -1
- `0-9` - Quick BPM preset (optional)
- `S` - Open settings
- `P` - Open presets
- `T` - Toggle theme
- `M` - Mute/unmute (if volume control added)

**Implementation**:
- `KeyboardListener` or `Shortcuts` widget
- `Actions` and `Intent` system (Flutter's recommended approach)
- Focus management for desktop

## Plan

- [ ] Create `KeyboardShortcuts` helper class
- [ ] Define `Intent` classes for each action
- [ ] Define `Action` classes mapping intents to callbacks
- [ ] Wrap app with `Shortcuts` and `Actions` widgets
- [ ] Implement Space for play/pause
- [ ] Implement arrow keys for BPM
- [ ] Implement number keys for presets (optional)
- [ ] Implement letter shortcuts (S, P, T)
- [ ] Add visual hint for shortcuts (tooltip or help dialog)
- [ ] Write widget tests for keyboard interactions

## Test

- [ ] Space toggles play/pause
- [ ] Arrow keys change BPM correctly
- [ ] Shift modifier works for ±10 BPM
- [ ] Time signature changes with ←/→
- [ ] Letter shortcuts open correct dialogs
- [ ] Shortcuts work when app is focused
- [ ] No conflicts with system shortcuts
- [ ] Widget tests pass

## Notes

**Focus management**: Ensure `KeyboardListener` has focus or use global shortcuts.

**Platform differences**: Some shortcuts may conflict with OS-level shortcuts (test on all platforms).

**Accessibility**: Document all shortcuts in a help dialog or settings page.