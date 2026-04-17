# Tempus

**Tempus** is a metronome desktop app built with Flutter, focused on simplicity and a minimal UI.

## Overview

### Goal

A simple desktop metronome focused in help musicians on studying and musical routine.

Provide a simple and modern UI with minimal components with UX in mind.

### Features

- Tempo controls - Slider/Scroll controls for Tempo/BPM
- Beat/Time signature controls
- Swing/Variation controls
- Common presets
- Custom user presets
- Visual animations for metronome
- i18n (pt-BR and en-US)
- Theme switcher with user preferences and system default

### Platforms

- Windows
- Linux
- MacOS

## Stack

- Material UI
- Riverpod with code generation
- Freezed
- Go Router

## Code Standards

DRY - Don't Repeat Yourself, functions and widgets should be extracted in reusable code whenever they're needed in multiple scenarios.
KISS - Always prefer simple solutions and existent libraries (when available) over implementations from scratch, all the new dependencies should be discussed before added also including alternatives.
Code Split - Files should never include more logic than needed, concepts should be extracted to prevent massive files.

## Folder Structure

```
lib/
 core/
   app.dart
   ...
 controllers/
 widgets/
 providers/
 helpers/
 pages/
 main.dart
...
```

## Spec Driven

This project follow Spec Driven Development, meaning that all the developed code are based on specs, this pattern has to be respected and the specs should follow a order keeping clear the goal and avoiding feature overlap
