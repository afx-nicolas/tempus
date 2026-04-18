---
status: planned
created: 2026-04-18
priority: low
tags:
- i18n
- localization
depends_on:
- 002-project-setup
parent: 001-tempus-app
created_at: 2026-04-18T00:12:25.882008657Z
updated_at: 2026-04-18T00:13:15.540095977Z
---

# Internationalization (i18n)

## Overview

Implement internationalization (i18n) for pt-BR and en-US locales.

**Why**: Support Portuguese (Brazil) and English (US) users as specified in requirements.

## Design

**Locales**:
- en-US (English - United States)
- pt-BR (Portuguese - Brazil)

**Strings to translate**:
- App title
- BPM label
- Time signature label
- Swing label
- Preset labels (save, delete, rename)
- Settings labels
- Theme options
- Common preset names
- Error messages
- Keyboard shortcut hints

**Implementation**:
- Flutter `flutter_localizations` package
- ARB files for translations
- Code generation with `intl_utils` or manual

## Plan

- [ ] Add `flutter_localizations` and `intl` dependencies
- [ ] Create `l10n.yaml` configuration
- [ ] Create ARB files (`app_en.arb`, `app_pt.arb`)
- [ ] Add all required string translations
- [ ] Generate localization code
- [ ] Wire locale to `MaterialApp`
- [ ] Replace all hardcoded strings with `AppLocalizations`
- [ ] Add language selector in settings
- [ ] Test both locales thoroughly
- [ ] Write widget tests for locale switching

## Test

- [ ] All UI text displays correctly in en-US
- [ ] All UI text displays correctly in pt-BR
- [ ] Locale switching works without restart
- [ ] No missing translations
- [ ] Numbers/dates format correctly
- [ ] Widget tests pass

## Notes

**ARB file example**:
```json
{
  "appTitle": "Tempus",
  "bpmLabel": "BPM",
  "timeSignatureLabel": "Time Signature",
  "@bpmLabel": {
    "description": "Beats per minute label"
  }
}
```

**Generation command**: `flutter gen-l10n`