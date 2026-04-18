---
status: planned
created: 2026-04-18
priority: medium
tags:
- feature
- ui
- persistence
depends_on:
- 002-project-setup
parent: 001-tempus-app
created_at: 2026-04-18T00:12:15.694250686Z
updated_at: 2026-04-18T00:13:14.500099333Z
---

# Settings & Preferences

## Overview

Implement settings, preferences, and theme switcher with user persistence.

**Why**: Users need to customize app appearance and behavior to their preferences.

## Design

**Theme options**:
- Light mode
- Dark mode
- System default (follows OS)

**Settings to persist**:
- Theme preference
- Locale (pt-BR / en-US)
- Default BPM
- Default time signature
- Last used preset
- Volume level
- Swing default

**Storage**: `shared_preferences`

**UI**:
- Settings page/dialog
- Theme switcher in app bar
- Language selector
- Reset to defaults option

## Plan

- [ ] Create `AppSettings` model with Freezed
- [ ] Create `SettingsController` (StateNotifier)
- [ ] Implement theme persistence
- [ ] Implement locale persistence
- [ ] Implement default values persistence
- [ ] Create `ThemeSwitcher` widget (dropdown or segmented button)
- [ ] Create `SettingsPage` widget
- [ ] Create `LanguageSelector` widget
- [ ] Wire theme to Material app
- [ ] Wire locale to Material app
- [ ] Add settings icon to app bar
- [ ] Write unit tests for settings controller
- [ ] Write widget tests for theme switcher

## Test

- [ ] Theme changes apply immediately
- [ ] Theme persists after app restart
- [ ] System theme follows OS (when selected)
- [ ] Language changes apply immediately
- [ ] Settings persist correctly
- [ ] Reset to defaults works
- [ ] Unit and widget tests pass

## Notes

**Theme implementation**: Use `ThemeMode` enum (light, dark, system)

**Default settings**:
- Theme: system
- Locale: en-US (or detect system)
- Default BPM: 120
- Default time signature: 4