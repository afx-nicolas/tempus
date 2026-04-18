---
status: complete
created: 2026-04-18
priority: critical
tags:
- setup
- architecture
- infrastructure
depends_on:
- 001-tempus-app
parent: 001-tempus-app
created_at: 2026-04-18T00:11:01.155586100Z
updated_at: 2026-04-18T00:30:34.859603332Z
completed_at: 2026-04-18T00:30:34.859603332Z
transitions:
- status: complete
  at: 2026-04-18T00:30:34.859603332Z
---

# Project Setup & Architecture

## Overview

Set up the foundational project structure, dependencies, and architecture before implementing features.

**Why**: Establish clean architecture following project standards (DRY, KISS, Code Split) from the start.

## Design

**Folder structure** (per README):
```
lib/
  core/
    app.dart
    theme.dart
    constants.dart
  controllers/
  widgets/
  providers/
  helpers/
  pages/
  main.dart
```

**Dependencies to add**:
- `flutter_riverpod` + `riverpod_generator`
- `freezed_annotation` + `freezed`
- `go_router`
- `metronome` (audio engine)
- `shared_preferences` (persistence)
- `flutter_localizations` (i18n)

**Architecture**:
- Riverpod for state management (with codegen)
- Freezed for immutable models
- Go Router for navigation (even if single-page initially)
- Feature-first organization within folders

## Plan

- [ ] Initialize Flutter project with desktop support (Windows, Linux, macOS)
- [ ] Add all dependencies to `pubspec.yaml`
- [ ] Configure Riverpod code generation (`build_runner`)
- [ ] Configure Freezed code generation
- [ ] Create base folder structure
- [ ] Set up Go Router with initial route
- [ ] Create core theme configuration (Material UI)
- [ ] Set up i18n structure (pt-BR, en-US)
- [ ] Create base providers (theme, locale)
- [ ] Add basic app scaffold

## Test

- [ ] `flutter pub get` succeeds
- [ ] Code generation runs without errors
- [ ] App builds and runs on all three platforms
- [ ] Theme switcher works (light/dark/system)
- [ ] Locale switching works (pt-BR/en-US)

## Notes

**Build command**: `flutter pub run build_runner build --delete-conflicting-outputs`

**Desktop enablement**:
```bash
flutter config --enable-linux-desktop
flutter config --enable-macos-desktop
flutter config --enable-windows-desktop
```